import 'dart:convert';
import 'dart:io';

import 'package:customeremall/Models/cartModel.dart';
import 'package:customeremall/settingsAndVariables/variables.dart';
import 'package:path_provider/path_provider.dart';

Future<String> get _localPath async {
  final directory = await getApplicationDocumentsDirectory();

  return directory.path;
}

Future<File> localFile(String filename) async {
  final path = await _localPath;
  return File('$path/$filename.txt');
}

Future<File> writeCart() async {
  final file = await localFile("myCartList");
  return file.writeAsString(jsonEncode(MyCart));
}

Future<String> readCart() async {
  try {
    final file = await localFile("myCartList");
    String contents = await file.readAsString();
    List Cart = await jsonDecode(contents);

    MyCart.clear();

    for(var order in Cart){
      CartModel NewCart = CartModel();
      NewCart.Name = order["Name"];
      NewCart.Price = order["Price"];
      NewCart.Id = order["Id"];
      NewCart.Quantity = order["Quantity"];
      NewCart.Color = order["Color"];
      NewCart.Imagelist.addAll(List.from(jsonDecode(order["Imagelist"])));
      NewCart.getImage();
      MyCart.add(NewCart);
    }

    return contents;
  } catch (e) {
    print(e.toString());
    return "f";
  }
}