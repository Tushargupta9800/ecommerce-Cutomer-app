import 'dart:convert';
import 'package:customeremall/api/secrets/secrets.dart';
import 'package:customeremall/settingsAndVariables/variables.dart';
import 'package:http/http.dart' as http;

Future<bool> AuthRegister() async {
  var response = await http.post(
    Uri.parse(RegisterUrl),
    headers: {
      'Content-Type': 'application/json; charset=UTF-8',
      "Accept": "application/json",
      "Access-Control-Allow-Origin": "*",
    },
    body: jsonEncode(<String, dynamic>{
      "name": Customer.Name,
      "email": Customer.Email,
      "password": Customer.Password,
      "mobilenumber": Customer.Mobile,
      "address": Customer.Address
    }),
  );

  Map<dynamic, dynamic> res = await jsonDecode(response.body.toString());
  print(res);
  if(res["error"] == null){return true;}
  return false;

}

Future<bool> AuthLogin() async {
  var response = await http.post(
    Uri.parse(LoginUrl),
    headers: {
      'Content-Type': 'application/json; charset=UTF-8',
      "Accept": "application/json",
      "Access-Control-Allow-Origin": "*",
    },
    body: jsonEncode(<String, dynamic>{
      "email": Customer.Email.trim(),
      "password": Customer.Password.trim()
    }),
  );

  Map<dynamic, dynamic> res = jsonDecode(response.body.toString());
  print(res);
  if(res["error"] == null){
    Customer.Token = res["token"];
    Customer.Address = res["info"]["Address"];
    Customer.Mobile = res["info"]["Mobile_number"];
    Customer.Name = res["info"]["name"];
    return true;
  }
  return false;

}