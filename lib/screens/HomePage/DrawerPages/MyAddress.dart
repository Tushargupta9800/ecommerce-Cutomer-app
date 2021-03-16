import 'package:customeremall/screens/HomePage/DrawerPages/editAddress.dart';
import 'package:customeremall/settingsAndVariables/variables.dart';
import 'package:flutter/material.dart';

class MyAddress extends StatefulWidget {
  @override
  _MyAddressState createState() => _MyAddressState();
}

class _MyAddressState extends State<MyAddress> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text('My Address', style: TextStyle(
            color: Colors.black
        ),),
        leading: Icon(Icons.arrow_back_ios, color: DarkBlue,),
      ),
      body: Column(
        children: [
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> EditAddress()));
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              height: 40,
              width: ScreenWidth,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey)
              ),
              child: Center(
                child: Text('+ New Location', style: TextStyle(
                    color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold
                ),),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
