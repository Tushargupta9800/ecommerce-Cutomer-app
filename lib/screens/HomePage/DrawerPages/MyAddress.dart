import 'dart:async';

import 'package:customeremall/localization/sharedpreferences/saveLocally.dart';
import 'package:customeremall/screens/HomePage/DrawerPages/SubDrawerPages/editAddress.dart';
import 'package:customeremall/settingsAndVariables/variables.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyAddress extends StatefulWidget {
  @override
  _MyAddressState createState() => _MyAddressState();
}

class _MyAddressState extends State<MyAddress> {

  Timer time;

  void readAllAddress(){readAddresses().then((value){setState(() {});});}

  @override
  void initState() {
    time = new Timer.periodic(Duration(milliseconds: 1000), (Timer t) {setState(() {
      print("here");
    });});
    readAllAddress();
    super.initState();
  }

  @override
  void dispose() {
    time.cancel();
    super.dispose();
  }

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
        leading: GestureDetector(
            onTap: (){
              Navigator.of(context).pop();
            },
            child: Container(
                padding: EdgeInsets.all(5),
                child: Icon(Icons.arrow_back_ios, color: DarkBlue,)
            )
        ),
      ),
      body: Container(
        width: ScreenWidth,
        height: ScreenHeight,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(height: 40,),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> EditAddress("","","","","","","",MyAllAddresses.length)));
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
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

              SizedBox(height: 30,),

              for(int i=0;i<MyAllAddresses.length;i++)
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                height: 40,
                width: ScreenWidth,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>
                            EditAddress(MyAllAddresses[i].Country,
                                MyAllAddresses[i].State,
                                MyAllAddresses[i].City,
                                MyAllAddresses[i].Area,
                                MyAllAddresses[i].Street,
                                MyAllAddresses[i].Address,
                                MyAllAddresses[i].Landmark,i
                            )));
                      },
                      child: Container(
                        width: ScreenWidth - 85,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.grey)
                        ),
                        child: Center(
                          child: Text(MyAllAddresses[i].Address, style: TextStyle(
                              color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold,
                          ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        MyAllAddresses.removeAt(i);
                        writeAddresses().then((value){readAllAddress();});
                      },
                      child: Container(
                        width: 35,
                        height: 35,
                        margin: EdgeInsets.symmetric(horizontal: 5),
                          child: Center(child: Icon(Icons.delete))
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
