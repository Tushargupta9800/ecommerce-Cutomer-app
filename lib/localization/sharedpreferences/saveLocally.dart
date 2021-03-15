import 'dart:convert';
import 'dart:io';

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

Future<File> writeCounter() async {
  final file = await localFile("myCartList");
  return file.writeAsString(MyCart.toString());
}

Future<String> readCounter() async {
  try {
    final file = await localFile("myCartList");
    String contents = await file.readAsString();
    List Cart = jsonDecode(contents);

    for(var order in Cart){
      print(order);
    }

    return contents;
  } catch (e) {
    print(e.toString());
    return "f";
  }
}