import 'package:customeremall/settingsAndVariables/variables.dart';
import 'package:flutter/material.dart';

class AboutUs extends StatefulWidget {
  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: White,
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: White,
          title: Text("About Us", style: TextStyle(
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
              Text("This is About us Page"),
            ],
          ),
        ),
      ),
    );
  }
}
