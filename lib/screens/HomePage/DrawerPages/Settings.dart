import 'package:customeremall/localization/code/language_constraints.dart';
import 'package:customeremall/localization/variables/languageCode.dart';
import 'package:customeremall/screens/HomePage/DrawerPages/SubDrawerPages/AboutUs.dart';
import 'package:customeremall/screens/HomePage/DrawerPages/SubDrawerPages/ContactUs.dart';
import 'package:customeremall/screens/HomePage/DrawerPages/SubDrawerPages/accountInfo.dart';
import 'package:customeremall/screens/Splashscreen/getstarted.dart';
import 'package:customeremall/settingsAndVariables/routers/routecodes.dart';
import 'package:customeremall/settingsAndVariables/variables.dart';
import 'package:flutter/cupertino.dart';
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
      body: Container(
        width: ScreenWidth,
        height: ScreenHeight,
        margin: EdgeInsets.symmetric(horizontal: 15),
        padding: EdgeInsets.only(top: 25),
        child: Column(
          children: [
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>AccountInfo()));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Account Info", style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                  Icon(Icons.arrow_forward_ios),
                ],
              ),
            ),
            // SizedBox(height: 15,),
            // GestureDetector(
            //   onTap: (){},
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       Text("Change Password", style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
            //       Icon(Icons.arrow_forward_ios),
            //     ],
            //   ),
            // ),
            SizedBox(height: 15,),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ContactUs()));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Contact Us", style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                  Icon(Icons.arrow_forward_ios),
                ],
              ),
            ),
            SizedBox(height: 15,),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>AboutUs()));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("About Us", style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                  Icon(Icons.arrow_forward_ios),
                ],
              ),
            ),
            SizedBox(height: 15,),
            GestureDetector(
              onTap: (){
                Navigator.popAndPushNamed(context, LogoutRouteCode);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Logout", style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                  Icon(Icons.arrow_forward_ios),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
