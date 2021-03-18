import 'package:customeremall/api/Auth/auth.dart';
import 'package:customeremall/localization/code/language_constraints.dart';
import 'package:customeremall/localization/sharedpreferences/sharedpreferences.dart';
import 'package:customeremall/localization/variables/languageCode.dart';
import 'package:customeremall/settingsAndVariables/Toast/Toast.dart';
import 'package:customeremall/settingsAndVariables/routers/routecodes.dart';
import 'package:customeremall/settingsAndVariables/settings.dart';
import 'package:customeremall/settingsAndVariables/variables.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget{

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  TextEditingController EmailController = TextEditingController();
  TextEditingController PasswordController = TextEditingController();
  bool EmailValidation = true;
  bool PasswordValidation = true;
  Icon PasswordIcon = Icon(Icons.lock_outline);
  bool obscuretext = true;
  bool loading = false;

  bool overallValidation(){
    setState(() {
      EmailValidation = EmailController.text.isNotEmpty;
      PasswordValidation = PasswordController.text.isNotEmpty;
    });

    if(!EmailController.text.isValidEmail()) ShowToast(Translate(context, CorrectEmailCode), context);

    return (EmailValidation && PasswordValidation && EmailController.text.isValidEmail());
  }

  @override
  void dispose() {
    EmailController.dispose();
    PasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(left: 16,right: 16),
          width: ScreenWidth,
          height: ScreenHeight,
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 30,),
                      Text(
                        Translate(context, WelcomeCode),
                        style: HeaderBold(Black, H3),),
                      SizedBox(height: 6,),
                      Text(
                        Translate(context, SigninContinueCode),
                        style: Header(Grey, H5),),
                      SizedBox(height: 15,),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                        height: TextFieldSize,
                        child: TextField(
                          onTap: (){setState(() {EmailValidation = true;});},
                          controller: EmailController,
                          decoration: InputDecoration(
                            errorText: (EmailValidation)?null:Translate(context, EmptyCode),
                            labelText: (EmailValidation)?Translate(context, EmailCode):null,
                            suffixIcon: Icon(Icons.person),
                            labelStyle: Header(Grey, H6),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Grey,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: Blue,
                                )
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 16,),
                      Container(
                        height: TextFieldSize,
                        child: TextField(
                          obscureText: obscuretext,
                          onTap: (){setState(() {PasswordValidation = true;});},
                          controller: PasswordController,
                          decoration: InputDecoration(
                            errorText: (PasswordValidation)?null:Translate(context, EmptyCode),
                            labelText: (PasswordValidation)?Translate(context, PasswordCode):null,
                            suffixIcon: GestureDetector(
                              onTap: (){
                                setState(() {
                                  obscuretext = !obscuretext;
                                  if(obscuretext) PasswordIcon = Icon(Icons.lock_outline);
                                  else PasswordIcon = Icon(Icons.lock_open);
                                });
                              },
                              child: PasswordIcon,
                            ),
                            labelStyle: Header(Grey, H6),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Grey,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: Blue,
                                )
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 30,),
                      Container(
                        height: 50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: DarkBlue,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: TextButton(
                          onPressed: (){
                            setState(() {
                              loading = true;
                            });
                            if(overallValidation()){
                              setState(() {
                                Customer.Email = EmailController.text;
                                Customer.Password = PasswordController.text;
                              });
                              AuthLogin().then((value) {
                                if(value){
                                  setState(() {
                                    loading = false;
                                  });
                                  ShowToast(Translate(context, WelcomeCode), context);
                                  incrementStartup();
                                  SetStringFromSharedPref("Email", Customer.Email);
                                  SetStringFromSharedPref("Password", Customer.Password);
                                  Navigator.popAndPushNamed(context, HomePageRouteCode);
                                }
                                else{
                                  setState(() {
                                    loading = false;
                                  });
                                  ShowToast(Translate(context, ErrorLoginCode), context);
                                }
                              });
                            }
                          },
                          child: Container(
                            alignment: Alignment.center,
                            constraints: BoxConstraints(maxWidth: double.infinity,minHeight: 50),
                            child: Text(Translate(context, SigninCode),
                              style: HeaderBold(White, H5),textAlign: TextAlign.center,),
                          ),
                        ),
                      ),
                      SizedBox(height: 30,),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(Translate(context, NewUserCode),
                          style: TextStyle(fontWeight: FontWeight.bold),),
                        GestureDetector(
                          onTap: (){
                            Navigator.popAndPushNamed(context, RegisterRouteCode);
                          },
                          child: Text(" " + Translate(context, SignupCode),
                            style: HeaderBold(Red, H5),),
                        )
                      ],
                    ),
                  )
                ],
              ),

              (loading)?Container(
                width: ScreenWidth,
                color: Colors.white,
                height: ScreenHeight,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ):SizedBox(height: 0,),

            ],
          ),
        ),
      ),
    );
  }
}