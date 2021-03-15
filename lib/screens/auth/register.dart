import 'package:customeremall/api/Auth/auth.dart';
import 'package:customeremall/localization/code/language_constraints.dart';
import 'package:customeremall/localization/variables/languageCode.dart';
import 'package:customeremall/settingsAndVariables/Toast/Toast.dart';
import 'package:customeremall/settingsAndVariables/routers/routecodes.dart';
import 'package:customeremall/settingsAndVariables/settings.dart';
import 'package:customeremall/settingsAndVariables/variables.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Register extends StatefulWidget{
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  TextEditingController NameController = TextEditingController();
  TextEditingController EmailController = TextEditingController();
  TextEditingController MobileController = TextEditingController();
  TextEditingController AddressController = TextEditingController();
  TextEditingController PasswordController = TextEditingController();
  bool NameValidation = true;
  bool EmailValidation = true;
  bool MobileValidation = true;
  bool AddressValidation = true;
  bool PasswordValidation = true;
  Icon PasswordIcon = Icon(Icons.lock_outline);
  bool obscuretext = true;

  bool overallValidation(){
    setState(() {
      NameValidation = NameController.text.isNotEmpty;
      EmailValidation = EmailController.text.isNotEmpty;
      MobileValidation = MobileController.text.isNotEmpty;
      AddressValidation = AddressController.text.isNotEmpty;
      PasswordValidation = PasswordController.text.isNotEmpty;
    });

    if(!EmailController.text.isValidEmail()) ShowToast(Translate(context, CorrectEmailCode), context);

    return (
        NameValidation
        && EmailValidation
        && MobileValidation
        && AddressValidation
        && PasswordValidation
        && EmailController.text.isValidEmail()
    );
  }

  @override
  void dispose() {
    NameController.dispose();
    EmailController.dispose();
    MobileController.dispose();
    AddressController.dispose();
    PasswordController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(left: 16,right: 16),
          width: ScreenWidth,
          height: ScreenHeight,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 30,),
                    Text(
                      Translate(context, CreateAccountCode),
                      style: HeaderBold(Black, H3),),
                    SizedBox(height: 10,),
                    Text(
                      Translate(context, SignupStartedCode),
                      style: Header(Grey, H5),),
                    SizedBox(height: 20,),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Container(
                      height: TextFieldSize,
                      child: TextField(
                        controller: NameController,
                        onTap: (){setState(() {NameValidation = true;});},
                        decoration: InputDecoration(
                          suffixIcon: Icon(Icons.person),
                          errorText: (NameValidation)?null:Translate(context, EmptyCode),
                          labelText: (NameValidation)?Translate(context, NameCode):null,
                          labelStyle: Header(Grey, H6),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Grey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Blue),
                          ),
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                        ),
                      ),
                    ),
                    SizedBox(height: 16,),
                    Container(
                      height: TextFieldSize,
                      child: TextField(
                        onTap: (){setState(() {EmailValidation = true;});},
                        controller: EmailController,
                        decoration: InputDecoration(
                          suffixIcon: Icon(Icons.email),
                          errorText: (EmailValidation)?null:Translate(context, EmptyCode),
                          labelText: (EmailValidation)?Translate(context, EmailCode):null,
                          labelStyle: Header(Grey, H6),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Grey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Blue),
                          ),
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                        ),
                      ),
                    ),
                    SizedBox(height: 16,),
                    Container(
                      height: TextFieldSize,
                      child: TextField(
                        onTap: (){setState(() {MobileValidation = true;});},
                        controller: MobileController,
                        decoration: InputDecoration(
                          suffixIcon: Icon(Icons.phone),
                          errorText: (MobileValidation)?null:Translate(context, EmptyCode),
                          labelText: (MobileValidation)?Translate(context, MobileCode):null,
                          labelStyle: Header(Grey, H6),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Grey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Blue),
                          ),
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                        ),
                        keyboardType: TextInputType.phone,
                        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      ),
                    ),
                    SizedBox(height: 16,),
                    Container(
                      height: TextFieldSize,
                      child: TextField(
                        onTap: (){setState(() {AddressValidation = true;});},
                        controller: AddressController,
                        decoration: InputDecoration(
                          suffixIcon: Icon(Icons.location_on),
                          errorText: (AddressValidation)?null:Translate(context, EmptyCode),
                          labelText: (AddressValidation)?Translate(context, AddressCode):null,
                          labelStyle: Header(Grey, H6),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Grey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Blue),
                          ),
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                        ),
                      ),
                    ),

                    SizedBox(height: 16,),
                    Container(
                      height: TextFieldSize,
                      child: TextField(
                        onTap: (){setState(() {PasswordValidation = true;});},
                        controller: PasswordController,
                        obscureText: obscuretext,
                        decoration: InputDecoration(
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
                          errorText: (PasswordValidation)?null:Translate(context, EmptyCode),
                          labelText: (PasswordValidation)?Translate(context, PasswordCode):null,
                          labelStyle: Header(Grey, H6),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Grey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Blue),
                          ),
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                        ),
                      ),
                    ),
                    SizedBox(height: 30,),
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: DarkBlue,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: TextButton(
                        onPressed: (){
                          if(overallValidation()){
                            setState(() {
                              Customer.Name = NameController.text;
                              Customer.Email = EmailController.text;
                              Customer.Mobile = MobileController.text;
                              Customer.Address = AddressController.text;
                              Customer.Password = PasswordController.text;
                            });
                            AuthRegister().then((value) {
                             if(value) ShowToast(Translate(context, SuccessRegisterCode), context);
                             else ShowToast(Translate(context, ErrorRegisterCode), context);
                            });
                          }
                        },
                        // shape: RoundedRectangleBorder(
                        //   borderRadius: BorderRadius.circular(6),
                        // ),
                        child: Container(
                          alignment: Alignment.center,
                          constraints: BoxConstraints(minHeight: 50,maxWidth: double.infinity),
                          child: Text(Translate(context, SignupCode),
                            style: HeaderBold(White, H5),textAlign: TextAlign.center,),
                        ),
                      ),
                    ),

                    SizedBox(height: 30,),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10,top: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(Translate(context, AlreadyHadAccountCode),
                        style: Header(Black, H6),),
                      GestureDetector(
                        onTap: (){
                          Navigator.popAndPushNamed(context, LoginRouteCode);
                        },
                        child: Text(" " + Translate(context, SigninCode),
                          style: HeaderBold(Red, H5),),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}