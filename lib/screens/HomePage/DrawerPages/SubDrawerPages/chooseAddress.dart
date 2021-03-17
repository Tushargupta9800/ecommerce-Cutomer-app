import 'dart:async';

import 'package:customeremall/screens/HomePage/DrawerPages/SubDrawerPages/editAddress.dart';
import 'package:customeremall/settingsAndVariables/Toast/Toast.dart';
import 'package:customeremall/settingsAndVariables/variables.dart';
import 'package:flutter/material.dart';

class ChooseAddress extends StatefulWidget {
  @override
  _ChooseAddressState createState() => _ChooseAddressState();
}

class _ChooseAddressState extends State<ChooseAddress> {

  Timer time;

  @override
  void initState() {
    time = new Timer.periodic(Duration(milliseconds: 5000), (Timer t) {setState(() {});});
    super.initState();
  }

  @override
  void dispose() {
    time.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            centerTitle: true,
            elevation: 0,
            backgroundColor: Colors.white,
            title: Text('Choose Address', style: TextStyle(
                color: Colors.black),
            ),
            actions: [
              TextButton(
                  child: Icon(Icons.done, color: DarkBlue,size: 35,),
                  onPressed: (){
                    setState(() {
                      if(ChoosenAddress <= MyAllAddresses.length){
                        CanWeOrderNow = true;
                        Navigator.of(context).pop();
                      }
                      else ShowToast("Select the address first", context);
                    });
                  }),
            ],
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
                    child: GestureDetector(
                      onTap: () {setState(() {ChoosenAddress = i;});},
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color: (i == ChoosenAddress)?DarkBlue:White,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.grey)
                        ),
                        child: Center(
                          child: Text(MyAllAddresses[i].Address, style: TextStyle(
                            color: (i == ChoosenAddress)?White:Black, fontSize: 18, fontWeight: FontWeight.bold,
                          ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        )
    );
  }
}
