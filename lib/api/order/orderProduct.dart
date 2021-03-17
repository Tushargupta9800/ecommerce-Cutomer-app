import 'dart:convert';

import 'package:customeremall/api/secrets/secrets.dart';
import 'package:customeremall/settingsAndVariables/variables.dart';
import 'package:http/http.dart' as http;

Future<bool> OrderProduts(int index, double total, double deliveryFee, String IsIt) async {

  print(MyCart[index].Id);
  print(Customer.Mobile);
  print(MyAllAddresses[ChoosenAddress].TotalAddress);

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
      "total_amount": "Product Price: " + MyCart[index].Price +
          ", DeliveryCharges: " + deliveryFee.toStringAsFixed(2) +
          ", Tax: " + (0.15*double.parse(MyCart[index].Price)).toStringAsFixed(2) +
          ", Total: " + total.toStringAsFixed(2) +
          ", IsIt: "  + IsIt,
      "state": MyAllAddresses[ChoosenAddress].State,
      "country": MyAllAddresses[ChoosenAddress].State,
      "quantity": MyCart[index].Quantity,
      "payment_type": "Online Payment",
      "color": MyCart[index].Color,
      "size": MyCart[index].Size
    }),
  );

  Map<dynamic, dynamic> res = await jsonDecode(response.body.toString());

  if(res["error"] == null){return true;}

  return false;
}