import 'dart:convert';

import 'package:customeremall/api/secrets/secrets.dart';
import 'package:customeremall/settingsAndVariables/variables.dart';
import 'package:http/http.dart' as http;

Future<bool> AllCategories() async {
  var response = await http.get(
    Uri.parse(CategoryUrl),
    headers: {
      'Content-Type': 'application/json; charset=UTF-8',
      "Accept": "application/json",
      "Access-Control-Allow-Origin": "*",
    },
  );

  Map<dynamic, dynamic> res = await jsonDecode(response.body.toString());

  if(res["error"] == null){
    for(int i=0;i<res["data"].length;i++){
      AllCategoryList.add(res["data"][i]["Category"]);
    }
    return true;
  }

  return false;
}

Future<bool> AllSubCategories() async {
  var response = await http.get(
    Uri.parse(SubCategoryUrl),
    headers: {
      'Content-Type': 'application/json; charset=UTF-8',
      "Accept": "application/json",
      "Access-Control-Allow-Origin": "*",
    },
  );

  Map<dynamic, dynamic> res = await jsonDecode(response.body.toString());

  if(res["error"] == null){
    for(int i=0;i<res["data"].length;i++){
      AllSubCategoryList.add(res["data"][i]["Subcategory"]);
    }
    return true;
  }

  return false;
}