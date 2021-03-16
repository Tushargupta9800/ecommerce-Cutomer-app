import 'package:customeremall/localization/code/language_constraints.dart';
import 'package:customeremall/localization/variables/languageCode.dart';
import 'package:customeremall/settingsAndVariables/variables.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: White,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: White,
        title: Text(Translate(context, SettingsCode), style: TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold
        ),),
        leading: GestureDetector(
            onTap: (){
              Navigator.of(context).pop();
            },
            child: Icon(Icons.arrow_back_ios, color: DarkBlue,)
        ),
      ),
    );
  }
}
