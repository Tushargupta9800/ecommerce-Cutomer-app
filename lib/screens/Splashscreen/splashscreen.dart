import 'dart:async';
import 'package:customeremall/localization/code/language_constraints.dart';
import 'package:customeremall/localization/variables/languageCode.dart';
import 'package:customeremall/settingsAndVariables/routers/routecodes.dart';
import 'package:customeremall/settingsAndVariables/settings.dart';
import 'package:customeremall/settingsAndVariables/variables.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // _incrementStartup();
    Timer(Duration(seconds: SplashTimer), (){
      Navigator.of(context).pop(true);
      Navigator.pushNamed(context, GetStartedRouteCode);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenWidth = MediaQuery.of(context).size.width;
    ScreenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(gradient: BackgroundGradientColor),
          height: ScreenHeight,
          width: ScreenWidth,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: ScreenWidth,
                child: Center(
                  child: Image.asset("assets/images/background/picture.png",height: 200.0,width: 180.0,),
                ),
              ),
              Container(
                width: ScreenWidth,
                child: Text(
                  Translate(context, AppnameCode) + " - " +Translate(context, TaglineCode),
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: HeaderBold(White,H4),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
