import 'dart:async';

import 'package:customeremall/localization/code/language_constraints.dart';
import 'package:customeremall/localization/sharedpreferences/saveLocally.dart';
import 'package:customeremall/screens/HomePage/DrawerPages/SubDrawerPages/editAddress.dart';
import 'package:customeremall/settingsAndVariables/variables.dart';
import 'package:customeremall/localization/variables/languageCode.dart';
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
    time = new Timer.periodic(Duration(milliseconds: 1000), (Timer t) {setState(() {});});
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
        title: Text(Translate(context, MyAddressCode), style: TextStyle(
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
              for(int i=0;i<MyAllAddresses.length;i++)
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                  width: ScreenWidth,
                  child: Container(
                    width: ScreenWidth,
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey)
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          MyAllAddresses[i].Address + ", " +
                              MyAllAddresses[i].Area + ", " +
                              MyAllAddresses[i].City + ", " +
                              MyAllAddresses[i].State
                          , style: TextStyle(
                          color: Colors.black, fontSize: 18,
                        ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                        SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                                onTap: (){
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
                                child: Text("Edit",style: TextStyle(
                                    fontSize: 14,
                                  decoration: TextDecoration.underline
                                ),)
                            ),
                            SizedBox(width: 10,),
                            GestureDetector(
                              onTap: (){
                                MyAllAddresses.removeAt(i);
                                writeAddresses().then((value){readAllAddress();});
                              },
                              child: Text("Delete",style: TextStyle(
                                fontSize: 14,
                                decoration: TextDecoration.underline
                              ),)
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              SizedBox(height: 20,),
              Container(
                width: ScreenWidth,
                height: 0.2,
                color: Grey,
              ),
              SizedBox(height: 20,),
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
                    child: Text(Translate(context, NewAddressCode), style: TextStyle(
                        color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold
                    ),),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
