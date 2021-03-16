import 'package:customeremall/settingsAndVariables/variables.dart';
import 'package:flutter/material.dart';

class EditAddress extends StatefulWidget {
  @override
  _EditAddressState createState() => _EditAddressState();
}

class _EditAddressState extends State<EditAddress> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text('Edit Address', style: TextStyle(
            color: Colors.black
        ),),
        leading: Icon(Icons.arrow_back_ios, color: DarkBlue,),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left:8.0, top: 10),
            child: Text('*Country', style: TextStyle(
                color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold
            ),),
          ),

          SizedBox(height: 10,),

          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            height: 40,
            width: ScreenWidth,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey)
            ),
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
              ),
            ),
          ),
          SizedBox(height: 10,),

          Padding(
            padding: const EdgeInsets.only(left:8.0),
            child: Text('*State/Province', style: TextStyle(
                color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold
            ),),
          ),

          SizedBox(height: 10,),

          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            height: 40,
            width: ScreenWidth,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey)
            ),
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
              ),
            ),
          ),
          SizedBox(height: 10,),

          Padding(
            padding: const EdgeInsets.only(left:8.0),
            child: Text('*City', style: TextStyle(
                color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold
            ),),
          ),

          SizedBox(height: 10,),

          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            height: 40,
            width: ScreenWidth,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey)
            ),
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
              ),
            ),
          ),
          SizedBox(height: 10,),

          Padding(
            padding: const EdgeInsets.only(left:8.0),
            child: Text('*Area', style: TextStyle(
                color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold
            ),),
          ),

          SizedBox(height: 10,),

          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            height: 40,
            width: ScreenWidth,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey)
            ),
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
              ),
            ),
          ),
          SizedBox(height: 10,),

          Padding(
            padding: const EdgeInsets.only(left:8.0),
            child: Text('*Street', style: TextStyle(
                color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold
            ),),
          ),

          SizedBox(height: 10,),

          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            height: 40,
            width: ScreenWidth,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey)
            ),
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
              ),
            ),
          ),
          SizedBox(height: 10,),

          Padding(
            padding: const EdgeInsets.only(left:8.0),
            child: Text('*Address Details', style: TextStyle(
                color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold
            ),),
          ),

          SizedBox(height: 10,),

          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            height: 40,
            width: ScreenWidth,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey)
            ),
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
              ),
            ),
          ),
          SizedBox(height: 10,),

          Padding(
            padding: const EdgeInsets.only(left:8.0),
            child: Text('*Landmark', style: TextStyle(
                color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold
            ),),
          ),

          SizedBox(height: 10,),

          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            height: 40,
            width: ScreenWidth,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey)
            ),
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
              ),
            ),
          ),
          SizedBox(height: 40,),

          Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: DarkBlue,
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Center(
                child: Text("Save",style: TextStyle(
                    color: Colors.white, fontSize: 18,
                    fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,),
              ),
          ),

        ],
      ),
    );
  }
}
