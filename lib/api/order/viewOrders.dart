import 'dart:convert';

import 'package:customeremall/Models/MyOrdersModel.dart';
import 'package:customeremall/api/secrets/secrets.dart';
import 'package:customeremall/settingsAndVariables/variables.dart';
import 'package:http/http.dart' as http;

Future<bool> ViewAllOrders() async {

  var response = await http.get(
      Uri.parse(ViewOrdersUrl),
    headers: {
      'Content-Type': 'application/json; charset=UTF-8',
      "Accept": "application/json",
      "Access-Control-Allow-Origin": "*",
      "auth-token": Customer.Token,
    }
  );

  Map<dynamic, dynamic> res = await jsonDecode(response.body.toString());

  if(res["error"] == null){
    for(var order in res["data"]){
      MyOrdersModel ThisOrder = MyOrdersModel();
      ThisOrder.User_Payment = order["User_payment"];
      ThisOrder.Customer_Id = order["Customer_id"];
      ThisOrder.Order_Id = order["_id"];
      ThisOrder.Product_Id = order["Product_id"];
      ThisOrder.Mobile = order["Mobile"];
      ThisOrder.Address = order["Address"];
      ThisOrder.Amount = order["Total_amount"];
      ThisOrder.Size = order["size"];
      ThisOrder.Color = order["color"];
      ThisOrder.Quantity = order["Quantity"];
      ThisOrder.Date = order["Date"];
      ThisOrder.PaymentType = order["Payment_type"];
      print(ThisOrder.Color);
      MyAllOrders.add(ThisOrder);
    }
    return true;
  }
  return false;
}