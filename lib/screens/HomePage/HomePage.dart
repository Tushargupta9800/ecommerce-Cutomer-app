import 'dart:math';
import 'package:customeremall/api/productCategories/categories.dart';
import 'package:customeremall/localization/code/language_constraints.dart';
import 'package:customeremall/localization/sharedpreferences/saveLocally.dart';
import 'package:customeremall/localization/variables/languageCode.dart';
import 'package:customeremall/settingsAndVariables/Toast/Toast.dart';
import 'package:customeremall/settingsAndVariables/routers/routecodes.dart';
import 'package:customeremall/settingsAndVariables/settings.dart';
import 'package:customeremall/settingsAndVariables/variables.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_custom_dialog/flutter_custom_dialog.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  List<String> ProductImageList = [];
  List<String> ProductImageListNames;
  List<int> ListOfInt = [0,1,2,3,4,5,6];
  List<int> NewProductListOfInt = [];
  List<int> MenListOfInt = [];
  List<int> WomenListOfInt = [];
  List<int> KidsListOfInt = [];
  Random random = new Random();
  bool loading = false;

  void Shuffle(){

    readCart();

    ListOfInt..shuffle();
    NewProductListOfInt.addAll(ListOfInt);
    ListOfInt..shuffle();
    MenListOfInt.addAll(ListOfInt);
    ListOfInt..shuffle();
    WomenListOfInt.addAll(ListOfInt);
    ListOfInt..shuffle();
    KidsListOfInt.addAll(ListOfInt);
  }
  
  @override
  void initState() {
    ProductImageList.add("assets/images/Products/Accessories.jpg");
    ProductImageList.add("assets/images/Products/Pants.jpg");
    ProductImageList.add("assets/images/Products/Shirts.jpg");
    ProductImageList.add("assets/images/Products/Shoes.jpg");
    ProductImageList.add("assets/images/Products/Suits.jpg");
    ProductImageList.add("assets/images/Products/Toys.jpg");
    ProductImageList.add("assets/images/Products/Tshirts.jpg");
    Shuffle();
    super.initState();

  }

  Widget CategoryTile(String text1, String text2, String text3,String text4){
    return Column(
      children: [
        GestureDetector(
          onTap:(){

            setState(() {
              shiftToTab = 0;
              CurrentCategoryArabic = text1;
              CurrentCategoryEnglish = text2;
              loading = true;
            });

            AllSubCategoryList.clear();
            AllSubCategories().then((value){
              setState(() {loading = false;});
              if(value) Navigator.pushNamed(context, CategoryPageRouteCode);
              else ShowToast(Translate(context, ErrorCode), context);
            });
          },
          child: Container(
            height: ScreenHeight * 0.074,
            width: ScreenWidth * 0.14,
            padding: EdgeInsets.all(8.0),
            child: Image.asset(text3),
            decoration: BoxDecoration(
              color: LightGrey,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
          ),

        ),
        SizedBox(height: 4,),
        Text(text4, style: TextStyle(
            fontSize: 16, fontWeight: FontWeight.bold
        ),),
      ],
    );
  }

  Widget DrawerTile(String text, String image,String routeName){

    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, routeName);
      },
      child: ListTile(
        title: Text(text),
        leading: Container(
          height: 30,
          width: 30,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.fill
              )
          ),
        ),
      ),
    );
  }

  Widget SubHeader(String name, String text1, String text2){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(name, style: TextStyle(
            color: Black, fontSize: 18, fontWeight: FontWeight.bold,
        ),),
        Padding(
          padding: const EdgeInsets.only(right:3),
          child: Column(
            children: [
              GestureDetector(
                onTap: (){
                  setState(() {
                    shiftToTab = 0;
                    CurrentCategoryArabic = text1;
                    CurrentCategoryEnglish = text2;
                    loading = true;
                  });
                  AllSubCategoryList.clear();
                  AllSubCategories().then((value){
                    setState(() {loading = false;});
                    if(value) Navigator.pushNamed(context, CategoryPageRouteCode);
                    else ShowToast(Translate(context, ErrorCode), context);
                  });
                },
                child: Text(Translate(context, SeeAllCode), style: Header(DarkBlue, H7),),
              ),
              Container(
                width: 30,
                height: 1,
                color: DarkBlue,
              )
            ],
          ),
        )
      ],
    );
  }

  Widget SubHeaderCategories(List whichList,String text1, String text2){
    return Container(
      height: ScreenHeight * 0.19,
      child: GridView.builder(
          itemCount: 5,
          scrollDirection: Axis.horizontal,
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 2/2.2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (BuildContext ctx, index) {
            return GestureDetector(
              onTap: (){
                setState(() {
                  shiftToTab = 0;
                  CurrentCategoryArabic = text1;
                  CurrentCategoryEnglish = text2;
                  loading = true;
                });
                AllSubCategoryList.clear();
                AllSubCategories().then((value){
                  for(int i=0;i<AllSubCategoryList.length;i++){
                    if(AllSubCategoryList[i].split(":")[0].trim() == ProductImageListNames[whichList[index]].trim() && AppLanguage == "en") shiftToTab = i;
                    else if(AllSubCategoryList[i].split(":")[1].trim() == ProductImageListNames[whichList[index]].trim() && AppLanguage == "ar") shiftToTab = i;
                  }
                  setState(() {loading = false;});
                  if(value) Navigator.pushNamed(context, CategoryPageRouteCode);
                  else ShowToast(Translate(context, ErrorCode), context);
                });
              },
              child: Container(
                margin: EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: AssetImage(ProductImageList[whichList[index]]),
                      fit: BoxFit.cover
                  ),
                ),
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                          begin: Alignment.bottomRight,
                          colors: [
                            Black.withOpacity(.9),
                            Black.withOpacity(.4),
                          ]
                      )
                  ),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(ProductImageListNames[whichList[index]], style: TextStyle(
                        color: White, fontWeight: FontWeight.bold, fontSize: 16
                    ),),
                  ),
                ),
              ),
            );
          }),
    );
  }
  
  @override
  Widget build(BuildContext context) {

    YYDialog.init(context);
    ProductImageListNames = [
      Translate(context, AccessoriesCode),
      Translate(context, PantsCode),
      Translate(context, ShirtsCode),
      Translate(context, ShoesCode),
      Translate(context, SuitsCode),
      Translate(context, ToysCode),
      Translate(context, TshirtsCode),
    ];

    return (loading)?Loading():SafeArea(
      child: Scaffold(
        backgroundColor: White,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: White,
          iconTheme: IconThemeData(color: Black,),
          actions: [
            IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: (){
                  Navigator.pushNamed(context, CartPageRouteCode);
                }),
            IconButton(icon: Icon(Icons.notification_important_rounded),
                onPressed: (){})
          ],
        ),
        drawer: Drawer(
          child: Container(
            color: White,
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                DrawerHeader(
                    decoration: BoxDecoration(
                        color: White
                    ),
                    child: Column(
                      children: [
                        Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/images/background/picture.png'),
                                  fit: BoxFit.fill
                              )
                          ),
                        ),

                        SizedBox(height: 10,),
                        Text(Customer.Name, style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18
                        ),),

                        Text(Customer.Address, style: TextStyle(
                          fontSize: 14, color: DarkBlue,
                        ),),
                      ],
                    )
                ),

                DrawerTile(Translate(context, MyOrdersCode), 'assets/images/DrawerIcons/Orders.png', MyOrdersRouteCode),
                DrawerTile(Translate(context, MyAddressCode), 'assets/images/DrawerIcons/Address.png', MyAddressRouteCode),
                DrawerTile(Translate(context, LanguageCode), 'assets/images/DrawerIcons/language.png', LanguageRouteCode),
                DrawerTile(Translate(context, SettingsCode), 'assets/images/DrawerIcons/Settings.png', SettingsRouteCode),
                GestureDetector(
                  onTap: (){
                    setState(() {
                      YYNoticeDialog();
                    });
                  },
                  child: ListTile(
                    title: Text(Translate(context, CustomerCareCode)),
                    leading: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/DrawerIcons/CustomerCare.png'),
                              fit: BoxFit.fill
                          )
                      ),
                    ),
                  ),
                ),
                DrawerTile(Translate(context, LogoutCode), 'assets/images/DrawerIcons/logout.png', LogoutRouteCode),
                DrawerTile(Translate(context, TACCode), 'assets/images/DrawerIcons/TAC.png', TACRouteCode),

              ],
            ),
          ),
        ),

        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        shiftToTab = 0;
                        int number  = random.nextInt(3);
                        if(number == 0){
                          CurrentCategoryArabic = "نسا";
                          CurrentCategoryEnglish = "Women";
                        }
                        else if(number == 1){
                          CurrentCategoryArabic = "رجال";
                          CurrentCategoryEnglish = "Men";
                        }
                        else{
                          CurrentCategoryArabic = "أطفال";
                          CurrentCategoryEnglish = "Kids";
                        }
                        loading = true;
                      });

                      AllSubCategoryList.clear();
                      AllSubCategories().then((value){
                        setState(() {loading = false;});
                        shiftToTab = random.nextInt(AllSubCategoryList.length);
                        if(value) Navigator.pushNamed(context, CategoryPageRouteCode);
                        else ShowToast(Translate(context, ErrorCode), context);
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      height: ScreenHeight * 0.35,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                            image: AssetImage(ProductImageList[random.nextInt(7)]),
                            fit: BoxFit.fill,
                          )
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            gradient: LinearGradient(
                                begin: Alignment.bottomRight,
                                colors: [
                                  Black.withOpacity(.8),
                                  Black.withOpacity(.2),
                                ]
                            )
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [

                            Container(
                              padding: EdgeInsets.only(left: 30, bottom: 10, right: 30),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                  Text(Translate(context, NewProductsCode), style: TextStyle(
                                      color: White, fontSize: 30, fontWeight: FontWeight.bold
                                  ),),

                                  SizedBox(height: 10,),

                                  Row(
                                    children: [
                                      Text(Translate(context, ViewMoreCode), style: TextStyle(
                                          color: White, fontWeight: FontWeight.w600
                                      ),),
                                      SizedBox(width: 5,),
                                      Icon(Icons.arrow_forward_ios, color: White, size: 15,)
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            CategoryTile("نسا", "Women", "assets/images/CategoryIcons/women.png",Translate(context, WomenCode)),
                            CategoryTile("رجال", "Men", "assets/images/CategoryIcons/men.png",Translate(context, MenCode)),
                            CategoryTile("أطفال", "Kids", "assets/images/CategoryIcons/girl.png",Translate(context, KidsCode)),
                          ],
                        ),

                        SizedBox(height: 25),
                        SubHeader(Translate(context, NewProductsCode), "رجال", "Men"),
                        SizedBox(height: ScreenHeight * 0.025,),
                        SubHeaderCategories(NewProductListOfInt,"رجال", "Men"),


                        SizedBox(height: 25,),
                        SubHeader(Translate(context, MenCode) + " " + Translate(context, CollectionCode), "رجال", "Men"),
                        SizedBox(height: ScreenHeight * 0.025,),
                        SubHeaderCategories(MenListOfInt,"رجال", "Men"),

                        SizedBox(height: 25,),
                        SubHeader(Translate(context, WomenCode) + " " + Translate(context, CollectionCode), "نسا", "Women"),
                        SizedBox(height: ScreenHeight * 0.025,),
                        SubHeaderCategories(WomenListOfInt,"نسا", "Women"),

                        SizedBox(height: 25,),
                        SubHeader(Translate(context, KidsCode) + " " + Translate(context, CollectionCode), "أطفال", "Kids"),
                        SizedBox(height: ScreenHeight * 0.025,),
                        SubHeaderCategories(KidsListOfInt,"أطفال", "Kids"),

                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  YYDialog YYNoticeDialog() {
    return YYDialog().build()
      ..gravity = Gravity.bottom
      ..gravityAnimationEnable = true
      ..backgroundColor = Colors.transparent
      ..widget(
          Container(
            width: ScreenWidth,
            height: 200,
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topRight: Radius.circular(30),topLeft: Radius.circular(30)),
              color: Colors.white,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(height: 5,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(width: 1,),
                    Text("Help And Support",style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: H5
                    ),),
                    GestureDetector(
                      onTap: (){
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                          child: Icon(Icons.clear)
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: (){
                    String url = "tel:" + Whatsappnumber;
                    launch(url);
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/images/DrawerIcons/subdrawerIcons/call.png'),
                                fit: BoxFit.fill
                            )
                        ),
                      ),
                      SizedBox(width: 8,),
                      Text("Call",style: TextStyle( fontSize: H5
                      ),),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    String url = "https://wa.me/" + Whatsappnumber + "?text=" + Whatsappmsg;
                    launch(url);
                  },
                  child: Row(
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/images/DrawerIcons/subdrawerIcons/whatsapp.png'),
                                fit: BoxFit.fill
                            )
                        ),
                      ),
                      SizedBox(width: 8,),
                      Text("Message",style: TextStyle( fontSize: H5
                      ),),
                    ],
                  ),
                ),
                SizedBox(height: 5,),
              ],
            ),
      ))
      ..show();
  }

}