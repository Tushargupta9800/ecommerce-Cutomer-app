import 'package:customeremall/localization/code/language_constraints.dart';
import 'package:customeremall/localization/variables/languageCode.dart';
import 'package:customeremall/settingsAndVariables/routers/routecodes.dart';
import 'package:customeremall/settingsAndVariables/settings.dart';
import 'package:customeremall/settingsAndVariables/variables.dart';
import 'package:flutter/material.dart';
import '../../main.dart';

class GetStarted extends StatefulWidget {
  @override
  _GetStartedState createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {

  void changeLanguage(String code) async {

  Locale _temp;
  switch(code){
    case 'en':
      _temp = Locale('en', 'US');
      break;
    case 'ar':
      _temp = Locale('ar', 'SA');
      break;
    default:
      _temp = Locale('en', 'US');
  }
  await setLocale(_temp.languageCode);
  MyApp.setLocale(context, _temp);

}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: ScreenWidth,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/background/picture.png'),
              // fit: BoxFit.cover
          ),
        ),
        child: Container(
          decoration: BoxDecoration(gradient: BackgroundGradientColor),
          child: Padding(
            padding: EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  Translate(context,PerspectiveCode),
                  style: HeaderBold(White, H1),
                ),
                SizedBox(height: 20,),
                Text(
                Translate(context,GetStartedTaglineCode),
                  style: Header(White, H5),
                ),
                SizedBox(height: 100,),
                GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context, RegisterRouteCode);
                  },
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(color: White),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Center(
                      child: Text(
                        Translate(context, CreateAccountCode),
                        style: HeaderBold(White, H6),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      Translate(context, AlreadyHadAccountCode),
                      style: Header(White, H6),
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.pushNamed(context, LoginRouteCode);
                      },
                      child: Text(
                        " " + Translate(context, SigninCode),
                        style: HeaderBold(Blue, H5),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
