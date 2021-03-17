import 'package:customeremall/Models/cartModel.dart';
import 'package:customeremall/localization/code/language_constraints.dart';
import 'package:customeremall/localization/sharedpreferences/saveLocally.dart';
import 'package:customeremall/localization/variables/languageCode.dart';
import 'package:customeremall/settingsAndVariables/Toast/Toast.dart';
import 'package:customeremall/settingsAndVariables/settings.dart';
import 'package:customeremall/settingsAndVariables/variables.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';

class FullProduct extends StatefulWidget {

  @override
  _FullProductState createState() => _FullProductState();
}

class _FullProductState extends State<FullProduct> with TickerProviderStateMixin {

  String Value = HeroProduct.ProductSize[0];
  int number = 1;
  int selectedIndex = 0;
  TextEditingController numberController = TextEditingController();
  FocusNode textSecondFocusNode = new FocusNode();
  bool startAnimation = false;

  @override
  void initState() {
    numberController.text = 1.toString();
    super.initState();
  }

  @override
  void dispose() {
    numberController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    timeDilation = 3;

    return SafeArea(
        child: Scaffold(
            body: GestureDetector(
              onTap: (){
                FocusScope.of(context).requestFocus(new FocusNode());
              },
              child: Container(
                width: ScreenWidth,
                height: ScreenHeight,
                child: Stack(
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                                Hero(
                                  tag: HeroTag,
                                  child: Container(
                                    margin: EdgeInsets.only(bottom: 20),
                                    height: 350,
                                    width: ScreenWidth,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
                                        color: Colors.blue,
                                        image: DecorationImage(
                                            image: HeroProduct.ProductFinalImages,
                                            fit: BoxFit.fill,
                                        )
                                    ),
                                  ),
                                ),

                                Positioned(
                                    top: 20,
                                    left: 10,
                                    child: GestureDetector(
                                      onTap: (){
                                        Navigator.of(context).pop();
                                      },
                                      child: Material(
                                        elevation: 10,
                                        shadowColor: DarkBlue,
                                        borderRadius: BorderRadius.circular(12),
                                        child: Container(
                                          padding: EdgeInsets.symmetric(horizontal: 7,vertical: 7),
                                          child: Icon(Icons.arrow_back_ios_rounded, color:DarkBlue,),
                                          decoration: BoxDecoration(
                                                  color: Colors.white.withOpacity(0.7),
                                                  borderRadius: BorderRadius.circular(10),
                                                ),
                                        ),
                                      ),
                                    ),
                                ),

                                Positioned(
                                  right: 20,
                                  bottom: 0,
                                  child:  Material(
                                    elevation: 10,
                                    shadowColor: Colors.redAccent,
                                    borderRadius: BorderRadius.circular(17),
                                    child: Container(
                                      padding: EdgeInsets.only(right: 0.5),
                                      height: 36,
                                      width: 36,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.red,
                                      ),
                                      child: Icon(Icons.favorite, color: Colors.white,),
                                    ),
                                  ),
                                ),
                            ],
                          ),

                          Padding(
                            padding: const EdgeInsets.only(left: 20,top: 10,right: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(HeroProduct.ProductName, style: TextStyle(
                                    color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold
                                ),),
                                SizedBox(height: 10,),

                                Padding(
                                  padding: const EdgeInsets.only(left:3.0,right: 3.0),
                                  child: Text("SR " + HeroProduct.ProductPrice, style: TextStyle(
                                      color: DarkBlue, fontSize: 22, fontWeight: FontWeight.bold
                                  ),),
                                ),

                                SizedBox(height: 10,),

                                Center(
                                  child: Container(
                                    height: 1,
                                    width: ScreenWidth-80,
                                    color: LightGrey,
                                  ),
                                ),

                                Padding(
                                  padding: const EdgeInsets.only(left:3.0, top: 10,right: 3.0),
                                  child: Text(Translate(context, DescriptionCode) , style: TextStyle(
                                      color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold
                                  ),),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left:3.0, top: 10,right: 3.0),
                                  child: Text(HeroProduct.ProductDescription , style: TextStyle(
                                      color: Colors.grey[800], fontSize: 14
                                  ),),
                                ),

                                SizedBox(height: ScreenHeight * 0.05,),

                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Column(
                                          children: [
                                            Text(Translate(context, SizeCode), style: TextStyle(
                                                fontSize: 16, fontWeight: FontWeight.bold
                                            ),),
                                            SizedBox(height: ScreenHeight * 0.011,),
                                            Material(
                                              elevation: 10,
                                              shadowColor: Colors.grey,
                                              borderRadius: BorderRadius.circular(10),
                                              child: Container(
                                                width: 100,
                                                padding: EdgeInsets.symmetric(horizontal: 10),
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(10),
                                                ),
                                                child: Center(
                                                  child: DropdownButton<String>(
                                                    iconSize: 35,
                                                    isExpanded: true,
                                                    icon: Icon(Icons.arrow_drop_down, color: DarkBlue,),
                                                    dropdownColor: White,
                                                    items: HeroProduct.ProductSize.map((String value) {
                                                      return new DropdownMenuItem<String>(
                                                        value: value,
                                                        child: Center(child: new Text(value)),
                                                      );
                                                    }).toList(),
                                                    value: Value,
                                                    onChanged: (_) {
                                                      FocusScope.of(context).requestFocus(new FocusNode());
                                                        setState(() {Value = _;});
                                                      },
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),

                                        SizedBox(width: 20,),

                                        Padding(
                                          padding: const EdgeInsets.only(left:40.0, top: 5),
                                          child: Column(
                                            children: [
                                              Text(Translate(context, QuantityCode), style: TextStyle(
                                                  color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold
                                              ),),


                                              Container(
                                                height:  65,
                                                width: 160,
                                                child: Row(
                                                  children: [

                                                    Material(
                                                      elevation: 10,
                                                      shadowColor: Colors.grey,
                                                      borderRadius: BorderRadius.circular(15),
                                                      color: DarkBlue,
                                                      child: GestureDetector(
                                                        onTap: (){
                                                          FocusScope.of(context).requestFocus(new FocusNode());
                                                            setState(() {
                                                              if(number > 1){
                                                                number--;
                                                                numberController.text = number.toString();
                                                              }
                                                            });
                                                        },
                                                        child: Container(
                                                          margin: EdgeInsets.only(bottom: 6, left: 1),
                                                          height:  25,
                                                          width: 35,
                                                          decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.circular(10),
                                                          ),
                                                          child: Center(
                                                            child: Text('-', style: TextStyle(
                                                                fontSize: 25, fontWeight: FontWeight.bold,
                                                                color: Colors.white
                                                            ),),
                                                          ),
                                                        ),
                                                      ),
                                                    ),

                                                    SizedBox(width: 6,),

                                                    Material(
                                                      elevation: 10,
                                                      shadowColor: Colors.grey,
                                                      borderRadius: BorderRadius.circular(15),
                                                      child: Container(
                                                        height:  40,
                                                        width: 60,
                                                        padding: EdgeInsets.only(left: 10,right: 10,bottom: 5),
                                                        decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.circular(10),
                                                        ),
                                                        child: Center(
                                                          child: TextField(
                                                            textAlign: TextAlign.center,
                                                            controller: numberController,
                                                            decoration: InputDecoration(
                                                              enabledBorder: InputBorder.none,
                                                            ),
                                                            style: TextStyle(
                                                              fontSize: 18
                                                            ),
                                                            keyboardType: TextInputType.number,
                                                            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                                                            onChanged: (val){
                                                              if(int.parse(val) > int.parse(HeroProduct.ProductQuantity[selectedIndex])){
                                                                numberController.text = number.toString();
                                                              }
                                                              else number = int.parse(numberController.text);
                                                            },
                                                          ),
                                                        ),
                                                      ),
                                                    ),

                                                    SizedBox(width: 6,),
                                                    Material(
                                                      elevation: 10,
                                                      shadowColor: Colors.grey,
                                                      color: DarkBlue,
                                                      borderRadius: BorderRadius.circular(15),
                                                      child: GestureDetector(
                                                        onTap: (){
                                                          FocusScope.of(context).requestFocus(new FocusNode());
                                                            setState(() {
                                                              if(number < int.parse(HeroProduct.ProductQuantity[selectedIndex])){
                                                                number++;
                                                                numberController.text = number.toString();
                                                              }
                                                            });
                                                        },
                                                        child: Container(
                                                          margin: EdgeInsets.only(bottom: 6, left: 1),
                                                          height: 25,
                                                          width: 35,
                                                          decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.circular(15),
                                                          ),
                                                          child: Center(
                                                            child: Text('+', style: TextStyle(
                                                                fontSize: 25, fontWeight: FontWeight.bold,
                                                                color: Colors.white
                                                            ),),
                                                          ),
                                                        ),
                                                      ),
                                                    ),


                                                  ],
                                                ),
                                              )

                                            ],
                                          ),
                                        ),
                                      ],
                                    ),

                                    Container(
                                      padding: EdgeInsets.only(top: 20),
                                      width: ScreenWidth,
                                      child: SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          children: [
                                            Text(Translate(context, AvailableColorCode) + " : ", style: TextStyle(
                                                fontSize: 16, fontWeight: FontWeight.bold
                                            ),),

                                            for(int i=0;i<HeroProduct.ProductColor.length;i++)
                                              GestureDetector(
                                                onTap: (){
                                                  FocusScope.of(context).requestFocus(new FocusNode());
                                                  setState(() {
                                                    selectedIndex = i;
                                                    if(number > int.parse(HeroProduct.ProductQuantity[i])){
                                                      number = int.parse(HeroProduct.ProductQuantity[i]);
                                                      numberController.text = number.toString();
                                                    }
                                                  });
                                                },
                                                child: Container(
                                                  height: 40,
                                                  width: 40,
                                                  margin: EdgeInsets.only(right: 10,top: 10),
                                                  decoration : AddProductDecoration(
                                                      HexColor.fromHex(HeroProduct.ProductColor[i]),
                                                      500, (selectedIndex == i)?DarkBlue:Blue
                                                  ),
                                                ),
                                              ),
                                          ],
                                        ),
                                      ),
                                    ),


                                    Container(
                                      padding: EdgeInsets.only(top: 20),
                                      width: ScreenWidth,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(Translate(context, AvailableQuantityCode) + " : ", style: TextStyle(
                                              fontSize: 16, fontWeight: FontWeight.bold
                                          ),),

                                          Text(HeroProduct.ProductQuantity[selectedIndex], style: TextStyle(
                                              fontSize: H5, fontWeight: FontWeight.bold
                                          ),),

                                        ],
                                      ),
                                    ),

                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 100,),
                        ],
                      ),
                    ),

                    Positioned(
                      bottom: 20,
                      right: 10,
                      left: 10,
                      child: GestureDetector(
                        onTap: (){
                          setState(() {
                            CartModel ThisToCart = CartModel();
                            ThisToCart.Name = HeroProduct.ProductName;
                            ThisToCart.Price = HeroProduct.ProductPrice;
                            ThisToCart.Id = HeroProduct.ProductId;
                            ThisToCart.Quantity = numberController.text;
                            ThisToCart.Color = HeroProduct.ProductColor[selectedIndex];
                            ThisToCart.Size = HeroProduct.ProductSize[selectedIndex];
                            ThisToCart.Imagelist.addAll(HeroProduct.ProductPic);
                            ThisToCart.getImage();
                            MyCart.add(ThisToCart);
                            writeCart().then((value){
                              ShowToast(Translate(context, AddedToCartCode), context);
                            });
                          });
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
                              Text(Translate(context, AddToCartCode),style: TextStyle(color: Colors.white,
                                  fontWeight: FontWeight.bold, fontSize: 20),textAlign: TextAlign.center,),

                              Text("SR " + HeroProduct.ProductPrice,style: TextStyle(color: Colors.white,
                                  fontWeight: FontWeight.bold, fontSize: 20),textAlign: TextAlign.center,),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    ));
  }
}