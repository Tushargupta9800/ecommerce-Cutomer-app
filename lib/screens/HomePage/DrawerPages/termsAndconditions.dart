import 'package:customeremall/settingsAndVariables/variables.dart';
import 'package:flutter/material.dart';

class TermsAndConditions extends StatefulWidget {
  @override
  _TermsAndConditionsState createState() => _TermsAndConditionsState();
}

class _TermsAndConditionsState extends State<TermsAndConditions> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: LightGrey,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: LightGrey,
        title: Text('Terms & Conditions', style: TextStyle(
            color: Colors.black
        ),),
        leading: Icon(Icons.arrow_back_ios, color: DarkBlue,),
      ),
    );
  }
}
