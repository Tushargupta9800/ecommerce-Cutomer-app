import 'package:customeremall/Models/productModel.dart';
import 'package:customeremall/api/productCategories/GetProducts.dart';
import 'package:customeremall/localization/code/language_constraints.dart';
import 'package:customeremall/localization/variables/languageCode.dart';
import 'package:customeremall/screens/Shop/CategoryPage.dart';
import 'package:customeremall/settingsAndVariables/routers/routecodes.dart';
import 'package:customeremall/settingsAndVariables/variables.dart';
import 'package:flutter/material.dart';

class SubCategoryPage extends StatefulWidget {
  String SubCat;
  SubCategoryPage(this.SubCat);

  @override
  _SubCategoryPageState createState() => _SubCategoryPageState();
}

class _SubCategoryPageState extends State<SubCategoryPage> {

  String ThisCategory;
  String ThisSubCategory;
  List<productModel> ThisProductList = [];
  bool anyProducts = false;

  @override
  void initState() {

    ThisCategory = CurrentCategoryEnglish + " : " + CurrentCategoryArabic;
    ThisSubCategory = widget.SubCat;
    GetProductsByCategories(ThisCategory, ThisSubCategory,context).then((value) {
      if(this.mounted)
      setState(() {
        anyProducts = true;
        ThisProductList.clear();
        ThisProductList.addAll(value);
      });
    });
    super.initState();
  }

  Widget ShowProduct(var image,String name, String price,bool any, int index){

    return GestureDetector(
      onTap: (){
        if(any){
          HeroTag = ThisProductList[index].ProductId;
          HeroIndex = index;
          HeroProduct = ThisProductList[index];
          Navigator.pushNamed(context, FullProductRouteCode);
        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Hero(
            tag: (any)?ThisProductList[index].ProductId:"fakeTag" + index.toString(),
            child: Container(
              padding: EdgeInsets.all(10),
              height: ScreenHeight * 0.23,
              width: ScreenWidth * 3,
              decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(16),
                  image: DecorationImage(
                      image: (!any)?AssetImage(image):image,
                    fit: (!any)?BoxFit.contain:BoxFit.fill
                  )
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.only(left: 5, top: 5),
            child: Text(name, style: TextStyle(
                color: Colors.black
            ),),
          ),
          Padding(
            padding: const EdgeInsets.only(left:5.0),
            child: Text(price, style: TextStyle(
                fontWeight: FontWeight.bold
            ),),
          ),

        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal:30.0, vertical: 20),
          child: GridView.builder(
              itemCount: (!anyProducts)?20:ThisProductList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.75,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 10
              ), itemBuilder: (context, index){
            return (anyProducts)?
            ShowProduct(
                ThisProductList[index].ProductFinalImages,
                ThisProductList[index].ProductName,
                "SR " + ThisProductList[index].ProductPrice,
              anyProducts, index
            ):
            AnimatedOpacity(
              opacity: opacity,
              duration: const Duration(milliseconds: 800),
              child: ShowProduct('assets/images/background/picture.png',Translate(context, NameCode), "SR",anyProducts, index),
            );
          }),
        )
    );
  }
}
