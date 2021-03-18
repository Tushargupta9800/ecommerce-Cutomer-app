import 'package:customeremall/localization/code/language_constraints.dart';
import 'package:customeremall/localization/variables/languageCode.dart';
import 'package:customeremall/settingsAndVariables/variables.dart';
import 'package:flutter/material.dart';

Widget OrderLoading(String text,BuildContext context){
  return Container(
    width: ScreenWidth,
    height: ScreenHeight,
    color: White,
    child: Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircularProgressIndicator(),
          SizedBox(height: 10,),
          Text(Translate(context, LoadingCode),),
          SizedBox(height: 10,),
          Text(Translate(context, DoNotPressBackCode),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
          SizedBox(height: 10,),
          Text(Translate(context, CompletedCode) + " "+ text + "%",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
        ],
      ),
    ),
  );
}