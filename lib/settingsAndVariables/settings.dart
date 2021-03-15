import 'package:customeremall/localization/code/language_constraints.dart';
import 'package:customeremall/settingsAndVariables/variables.dart';
import 'package:flutter/material.dart';

import '../main.dart';

LinearGradient BackgroundGradientColor = LinearGradient(
    begin: Alignment.bottomRight,
    colors: [
      Colors.black.withOpacity(.9),
      Colors.black.withOpacity(.4),
    ]
);

TextStyle Header(Color _Color, double size){
  return TextStyle(
      color: _Color,
      fontSize: size,
  );
}

TextStyle HeaderBold(Color _Color, double size){
  return TextStyle(
      color: _Color,
      fontSize: size,
      fontWeight: FontWeight.bold
  );
}

void changeLanguage(String code,BuildContext context) async {

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

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}

Widget Loading(){
  return Container(
    width: ScreenWidth,
    height: ScreenHeight,
    color: White,
    child: Center(
      child: CircularProgressIndicator(),
    ),
  );
}

BoxDecoration AddProductDecoration(var color,int shadow, var BorderColor){
  return BoxDecoration(
    color: color,
    shape: BoxShape.circle,
    border: Border.all(color: BorderColor,width: 2.0),
    boxShadow: [BoxShadow(
      color: Colors.grey[shadow],
      blurRadius: 5.0,
    ),],
  );
}