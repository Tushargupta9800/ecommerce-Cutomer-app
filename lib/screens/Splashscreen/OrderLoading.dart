import 'package:customeremall/settingsAndVariables/variables.dart';
import 'package:flutter/material.dart';

Widget OrderLoading(String text){
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
          Text("Loading..."),
          SizedBox(height: 10,),
          Text("Do not press back button ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
          SizedBox(height: 10,),
          Text("Completed "+ text + "%",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
        ],
      ),
    ),
  );
}