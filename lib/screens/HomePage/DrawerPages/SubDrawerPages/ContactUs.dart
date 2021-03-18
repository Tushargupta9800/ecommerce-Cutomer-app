import 'package:customeremall/settingsAndVariables/variables.dart';
import 'package:flutter/material.dart';

class ContactUs extends StatefulWidget {
  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: White,
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: White,
          title: Text("Contact Us", style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold
          ),),
          leading: GestureDetector(
              onTap: (){
                Navigator.of(context).pop();
              },
              child: Icon(Icons.arrow_back_ios, color: DarkBlue,)
          ),
        ),
        body: Container(
          width: ScreenWidth,
          height: ScreenHeight,
          margin: EdgeInsets.symmetric(horizontal: 15),
          padding: EdgeInsets.only(top: 25),
          child: Column(
            children: [

            ],
          ),
        ),
      ),
    );
  }
}
