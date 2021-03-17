import 'package:customeremall/api/order/viewOrders.dart';
import 'package:customeremall/localization/code/language_constraints.dart';
import 'package:customeremall/localization/variables/languageCode.dart';
import 'package:customeremall/settingsAndVariables/variables.dart';
import 'package:flutter/material.dart';

class MyOrders extends StatefulWidget {
  @override
  _MyOrdersState createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> {

  void CheckingAllOrders(){ViewAllOrders().then((value){if(this.mounted) setState(() {});});}

  @override
  void initState() {
    CheckingAllOrders();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: White,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: White,
        title: Text(Translate(context, MyOrdersCode), style: TextStyle(
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
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              for(int i=MyAllOrders.length-1;i>=0;i--)
                Container(
                  margin: EdgeInsets.only(top: 20),
                  width: ScreenWidth,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    border: Border.all(color: Black,width: 0.2),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 15,),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          children: [
                            Text("Order " + "#",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                            Text(MyAllOrders[i].Order_Id,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),overflow: TextOverflow.ellipsis,),
                          ],
                        ),
                      ),
                      SizedBox(height: 15,),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Order Date",style: TextStyle(color: Colors.grey[600],fontSize: 14),),
                            Text(MyAllOrders[i].Date.split("T")[0],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14)),
                          ],
                        ),
                      ),
                      SizedBox(height: 10,),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Status",style: TextStyle(color: Colors.grey[600],fontSize: 14),),
                            Text(MyAllOrders[i].Status,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14)),
                          ],
                        ),
                      ),
                      SizedBox(height: 10,),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Price",style: TextStyle(color: Colors.grey[600],fontSize: 14),),
                            Text("SR " + MyAllOrders[i].Amount.split(":")[1].split(",")[0].trim(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14)),
                          ],
                        ),
                      ),
                      SizedBox(height: 10,),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Delivery Charge",style: TextStyle(color: Colors.grey[600],fontSize: 14),),
                            Text("SR " + MyAllOrders[i].Amount.split(":")[2].split(",")[0].trim(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14)),
                          ],
                        ),
                      ),
                      SizedBox(height: 10,),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Tax(15%)",style: TextStyle(color: Colors.grey[600],fontSize: 14),),
                            Text("SR " + MyAllOrders[i].Amount.split(":")[3].split(",")[0].trim(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14)),
                          ],
                        ),
                      ),
                      SizedBox(height: 10,),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Address",style: TextStyle(color: Colors.grey[600],fontSize: 14),),
                            Container(
                                width: 150,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                        MyAllOrders[i].Address.split(":")[1].split(",")[0].trim(),
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14)),
                                  ],
                                )),
                          ],
                        ),
                      ),
                      SizedBox(height: 15,),
                      (MyAllOrders[i].Status == "Processing")?Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Expected Day of Delivery",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),),
                            Text("Within Two Days of Order",style: TextStyle(fontSize: 14,color: Colors.red)),
                          ],
                        ),
                      ):Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Order Completed",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),),
                          ],
                        ),
                      ),
                      SizedBox(height: 15,),
                    ],
                  ),
                ),
              SizedBox(height: 20,),
            ],
          ),
        ),
      ),
    );
  }
}
