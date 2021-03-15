import 'package:customeremall/Models/productModel.dart';
import 'package:customeremall/api/secrets/secrets.dart';
import 'package:customeremall/localization/code/language_constraints.dart';
import 'package:customeremall/localization/variables/languageCode.dart';
import 'package:customeremall/screens/Shop/SubCategoryPage.dart';
import 'package:customeremall/settingsAndVariables/Toast/Toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<productModel>> GetProductsByCategories(String category, String SubCategory,BuildContext context) async {
  // print(category);
  // print(SubCategory);

  var response = await http.post(
    Uri.parse(GetProductsUrl),
    headers: {
      'Content-Type': 'application/json; charset=UTF-8',
      "Accept": "application/json",
      "Access-Control-Allow-Origin": "*",
    },
    body: jsonEncode(<String, dynamic>{
      "city": "new",
      "category": category,
      "subcategory": SubCategory
    }),
  );

  Map<dynamic, dynamic> res = jsonDecode(response.body.toString());
  if(res["error"] == null){
    List<productModel> ProductList = [];
    for(var product in res["data"]){
      productModel newProduct = productModel();
      newProduct.ProductName = product["data"]["productname"];
      newProduct.ProductDescription = product["data"]["Description"];
      newProduct.ProductPrice = product["data"]["price"];
      newProduct.ProductId = product["data"]["_id"];
      newProduct.ProductPic = List.from(product["data"]["ProductPic"]["data"]["data"]);
      newProduct.addList(product["data"]["color"].toString(), product["data"]["size"].toString(), product["data"]["quantity"].toString());
      ProductList.add(newProduct);
    }
    return ProductList;
  }
  else ShowToast(Translate(context, ErrorCode), context);

}