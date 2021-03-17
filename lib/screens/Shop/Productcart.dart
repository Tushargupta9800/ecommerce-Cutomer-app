import 'package:customeremall/Models/cartModel.dart';
import 'package:customeremall/api/order/orderProduct.dart';
import 'package:customeremall/localization/code/language_constraints.dart';
import 'package:customeremall/localization/sharedpreferences/saveLocally.dart';
import 'package:customeremall/localization/variables/languageCode.dart';
import 'package:customeremall/screens/HomePage/DrawerPages/SubDrawerPages/chooseAddress.dart';
import 'package:customeremall/screens/Splashscreen/OrderLoading.dart';
import 'package:customeremall/settingsAndVariables/Toast/Toast.dart';
import 'package:customeremall/settingsAndVariables/variables.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {

  double Total = 0.00;
  double SubTotal = 0.00;
  double DeliveryFee = 25.00;
  double tax = 0.00;
  bool loading = false;
  bool didOrderCompleted = true;
  int orderIndex = 1;

  CalculatePrice(){
    setState(() {
      Total = 0.00;
      SubTotal = 0.00;
      tax = 0.00;
      for(CartModel cart in MyCart){
        SubTotal += double.parse(cart.Quantity)*double.parse(cart.Price);
      }
      tax = 0.15*SubTotal;
      if(SubTotal == 0.00){DeliveryFee = 0.00;}
      Total = SubTotal + DeliveryFee + tax;
      tax = double.parse(tax.toStringAsFixed(2));
      Total = double.parse(Total.toStringAsFixed(2));
    });
  }

  @override
  void initState() {
    CalculatePrice();
    setState(() {CanWeOrderNow = false;});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        body: Container(
          height: ScreenHeight,
          width: ScreenWidth,
          child: Stack(
            children: [
              Column(
                children: [

                  Container(
                    width: ScreenWidth,
                    height: 40,
                    child: Row(
                      children: [
                        IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: (){
                          Navigator.of(context).pop();
                        }),
                        SizedBox(width: 100,),
                        Padding(
                          padding: const EdgeInsets.only(top:13.0),
                          child: Column(
                            children: [
                              Text(Translate(context, YourCartCode), style: TextStyle(
                                  color: Colors.black, fontSize: 22,
                                fontWeight: FontWeight.bold
                              ),),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),

                  SizedBox(height: ScreenHeight * 0.021,),

                  Container(
                      height: ScreenHeight/2,
                      width: ScreenWidth,
                      child: ListView.separated(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: MyCart.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Material(
                            shadowColor: Colors.grey,
                            elevation: 2,
                            borderRadius: BorderRadius.circular(20),
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              width: ScreenWidth,
                              padding: EdgeInsets.symmetric(vertical: 5.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,

                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(left: 5),
                                        height: 55,
                                        width: 55,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: MyCart[index].image,
                                                fit: BoxFit.fill
                                            )
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(left: 10,right: 10),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(MyCart[index].Name, style: TextStyle(
                                              color: Black, fontSize: 18, fontWeight: FontWeight.bold
                                            ),),
                                            SizedBox(height: 10,),
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                // Text('SR: ' +
                                                //     MyCart[index].Quantity + "*" + MyCart[index].Price +
                                                //   " = " + (double.parse(MyCart[index].Quantity)*double.parse(MyCart[index].Price)).toString(),
                                                //   style: TextStyle(
                                                //     color: Colors.black, fontSize: 18,
                                                //   ),),
                                                Text('SR ' + (double.parse(MyCart[index].Quantity)*double.parse(MyCart[index].Price)).toString(),
                                                  style: TextStyle(
                                                    color: DarkBlue, fontSize: 18, fontWeight: FontWeight.bold
                                                  ),),
                                                SizedBox(height: 4,),
                                                Text(Translate(context, QuantityCode) + ": " + MyCart[index].Quantity,
                                                  style: TextStyle(
                                                    color: Black, fontSize: 18,
                                                  ),),
                                                // Row(
                                                //   children: [
                                                //     Text("Color: ",
                                                //       style: TextStyle(
                                                //         color: Colors.black, fontSize: 18,
                                                //       ),),
                                                //     Container(
                                                //       height: 15,
                                                //       width: 15,
                                                //       margin: EdgeInsets.only(right: 10,top: 10),
                                                //       decoration : AddProductDecoration(
                                                //           HexColor(MyCart[index].Color),
                                                //           500, DarkBlue
                                                //       ),
                                                //     ),
                                                //   ],
                                                // ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),

                                  GestureDetector(
                                    onTap: (){
                                      MyCart.removeAt(index);
                                      writeCart().then((value){
                                        CalculatePrice();
                                      });
                                    },
                                    child: Icon(Icons.delete),
                                  ),

                                ],
                              ),
                            ),
                          );


                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            height: 10,
                          );
                        },
                      )
                  ),

                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    height: ScreenHeight/2 - 80,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: [

                          // GestureDetector(
                          //   onTap: (){
                          //     dialogForCoupon();
                          //   },
                          //   child: Container(
                          //     margin: EdgeInsets.only(top: 15),
                          //       padding: EdgeInsets.symmetric(vertical: 5),
                          //       decoration: BoxDecoration(
                          //         borderRadius: BorderRadius.circular(20),
                          //         color: Colors.white,
                          //
                          //       ),
                          //       child: Center(
                          //         child: Text('Have Coupon Code?', style: TextStyle(
                          //           color: Colors.grey, fontSize: 18,
                          //         ),),
                          //       )
                          //
                          //   ),
                          // ),

                          SizedBox(height: 20,),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(Translate(context, SubTotalCode), style: TextStyle(
                                color: Colors.grey, fontSize: 18,
                              ),),
                              Text(SubTotal.toString(), style: TextStyle(
                                color: Colors.grey, fontSize: 18,
                              ),)
                            ],
                          ),
                          SizedBox(height: 8,),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(Translate(context, DeliveryFeeCode), style: TextStyle(
                                color: Colors.grey, fontSize: 18,
                              ),),
                              Text(DeliveryFee.toString(), style: TextStyle(
                                color: Colors.grey, fontSize: 18,
                              ),)
                            ],
                          ),
                          SizedBox(height: 8,),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(Translate(context, TaxCode), style: TextStyle(
                                color: Colors.grey, fontSize: 18,
                              ),),
                              Text(tax.toString(), style: TextStyle(
                                color: Colors.grey, fontSize: 18,
                              ),)
                            ],
                          ),

                          SizedBox(height: 10,),

                          GestureDetector(
                            onTap: () async {
                              if(MyCart.length > 0)
                                if(!CanWeOrderNow)
                                Navigator.push(context, MaterialPageRoute(builder: (context) => ChooseAddress()));
                                else {
                                  setState(() {
                                    loading = true;
                                  });
                                  if (MyCart.length > 0)
                                    for (int i = 0; i < MyCart.length; i++) {
                                      setState(() {
                                        orderIndex = i;
                                      });
                                      await OrderProduts(i, Total, DeliveryFee, (i == 0) ? "Yes" : "No")
                                          .then((value) {
                                        if (!value) {
                                          ShowToast("Please Check Your Network!!!", context);
                                          setState(() {
                                            didOrderCompleted = false;
                                            loading = false;
                                          });
                                        }
                                      });
                                    }
                                  if (didOrderCompleted) {
                                    setState(() {
                                      MyCart.clear();
                                      writeCart().then((value) {
                                        readCart();
                                      });
                                    });
                                    ShowToast("Order Send", context);
                                    Navigator.of(context).pop();
                                  }
                                  setState(() {
                                    loading = false;
                                  });
                                }
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              height: 60,
                              width: ScreenWidth,
                              decoration: BoxDecoration(
                                  color: DarkBlue,
                                  borderRadius: BorderRadius.circular(15)
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(Translate(context, CheckoutCode),style: TextStyle(color: Colors.white,
                                      fontWeight: FontWeight.bold, fontSize: 20),textAlign: TextAlign.center,),

                                  Text(Total.toString(),style: TextStyle(color: Colors.white,
                                      fontWeight: FontWeight.bold, fontSize: 20),textAlign: TextAlign.center,),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 60,),
                        ],
                      ),
                    ),
                  ),

                ],
              ),

              Positioned(
                bottom: 10,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,

                  children: [

                    Container(
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        width: ScreenWidth,
                        color: Colors.white,
                        child: Column(
                          children: [
                            Text(Translate(context, AgreeTermsCode), style: TextStyle(
                              color: Colors.black, fontSize: 16,
                            ),),
                            Column(
                              children: [
                                GestureDetector(
                                  onTap:(){
                                    dialogForTerms();
                                  },
                                  child: Text(Translate(context, TACCode), style: TextStyle(
                                    color: Colors.black, fontSize: 16,
                                  ),),
                                ),
                                Container(
                                  width: 140,
                                  height: 2,
                                  color: DarkBlue,
                                )
                              ],
                            )
                          ],
                        )

                    ),
                  ],
                ),
              ),

              (loading)?
                  OrderLoading(((orderIndex*100)/MyCart.length).toStringAsFixed(1))
                  :SizedBox(height: 0,),

            ],
          ),
        ),
      ),
    );
  }

  // dialogForCoupon(){
  //
  //   return showDialog(context: context, builder: (context){
  //
  //     return Dialog(
  //         shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.circular(20.0),
  //         ),
  //         child:  Container(
  //           height: 220,
  //           width: double.infinity,
  //           decoration: BoxDecoration(
  //               borderRadius: BorderRadius.circular(20),
  //               color: Colors.white
  //           ),
  //           child: Column(
  //             children: [
  //               Padding(
  //                 padding: const EdgeInsets.symmetric(horizontal:20.0),
  //                 child: Row(
  //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                   children: [
  //                     Text('Coupon Code', style: TextStyle(
  //                         color: Colors.black, fontSize: 18
  //                     ),),
  //                     IconButton(icon: Icon(Icons.cancel, color: Colors.grey,), onPressed: (){
  //                       Navigator.of(context).pop();
  //                     })
  //                   ],
  //                 ),
  //               ),
  //
  //               SizedBox(height: 20,),
  //
  //               Padding(
  //                 padding: const EdgeInsets.symmetric(horizontal:20.0),
  //                 child: TextFormField(
  //                   maxLines: 1,
  //                   decoration: InputDecoration(
  //                     hintText: 'Enter here',
  //                     border: OutlineInputBorder(
  //                       borderRadius: BorderRadius.all(Radius.circular(10.0)),
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //               SizedBox(height: 20,),
  //
  //               Padding(
  //                   padding: const EdgeInsets.symmetric(horizontal:20.0),
  //                   child: Container(
  //                     height: 50,
  //                     width: double.infinity,
  //                     decoration: BoxDecoration(
  //                       color: DarkBlue,
  //                       borderRadius: BorderRadius.circular(10),
  //                     ),
  //                     child: Center(
  //                       child: Text('Add', style: TextStyle(
  //                           color: Colors.white, fontSize: 18
  //                       )),
  //                     ),
  //                   )
  //               ),
  //
  //
  //             ],
  //           ),
  //         )
  //
  //     );
  //   });
  // }


  dialogForTerms(){

    return showDialog(context: context, builder: (context){

      return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child:  Container(
              height: 700,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white
              ),
              child: Stack(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    height: 150,
                    decoration: BoxDecoration(
                        color: DarkBlue,
                        image: DecorationImage(
                            image: AssetImage('assets/images/background/picture.png'),
                            fit: BoxFit.cover
                        )
                    ),
                  ),

                  Positioned(
                      top: 90,
                      left: 110,
                      child: Container(
                        height: 140,
                        width: ScreenWidth - 180,
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            Text(Translate(context, TermsOfServiceCode), style: TextStyle(
                                color: Colors.black, fontWeight: FontWeight.bold
                            ),),
                            SizedBox(height: 10,),

                            Text(Translate(context, PleaseReadCode), style: TextStyle(
                              color: Colors.black,
                            ),)
                          ],
                        ),
                      )),


                  Positioned(
                      top: 210,
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        color: Colors.white,
                        height: 200,
                        width:500,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(Translate(context, FullTermsCode), style: TextStyle(
                                color: Colors.black
                            ),)
                          ],
                        ),
                      ))
                ],
              )
          )

      );
    });
  }


}
