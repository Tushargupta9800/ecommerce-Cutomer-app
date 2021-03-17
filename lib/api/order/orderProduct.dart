import 'dart:convert';

import 'package:customeremall/api/secrets/secrets.dart';
import 'package:customeremall/settingsAndVariables/variables.dart';
import 'package:http/http.dart' as http;

Future<bool> OrderProduts(int index) async {
  var response = await http.post(
    Uri.parse(BuyProductsUrl),
    headers: {
      'Content-Type': 'application/json; charset=UTF-8',
      "Accept": "application/json",
      "Access-Control-Allow-Origin": "*",
      "auth-token": Customer.Token,
    },
    body: jsonEncode(<String, dynamic>{
      "product_id": MyCart[index].Id,
      "mobile": Customer.Mobile,
      "address": MyAllAddresses[ChoosenAddress].TotalAddress,
      "total_amount": MyCart[index].Price,
      "state": MyAllAddresses[ChoosenAddress].State,
      "country": MyAllAddresses[ChoosenAddress].State,
      "quantity": MyCart[index].Quantity,
      "payment_type": "COD",
      "color": MyCart[index].Color,
      "size": "size"
    }),
  );

  Map<dynamic, dynamic> res = await jsonDecode(response.body.toString());

  if(res["error"] == null){return true;}

  return false;
}