import 'dart:convert';

import 'package:customeremall/api/secrets/secrets.dart';
import 'package:customeremall/settingsAndVariables/variables.dart';
import 'package:http/http.dart' as http;

Future<bool> getDeliveryCharges() async {
  var response = await http.get(
    Uri.parse(getDeliveryChargesUrl),
    headers: {
      'Content-Type': 'application/json; charset=UTF-8',
      "Accept": "application/json",
      "Access-Control-Allow-Origin": "*",
    },
  );

  Map<dynamic, dynamic> res = await jsonDecode(response.body.toString());

  if(res["error"] == null){
    DeliveryFee = double.parse(res["Delivery_charges"]);
    return true;
  }

  return false;
}