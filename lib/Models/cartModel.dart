import 'dart:typed_data';

import 'package:flutter/cupertino.dart';

class CartModel{
  String Name;
  String Price;
  String Id;
  String Quantity;
  String Color;
  MemoryImage image;
  List<int> Imagelist = [];

  getImage(){
    image = MemoryImage(Uint8List.fromList(Imagelist));
  }

  Map<String, String> toJson() => {
    "Name": Name,
    "Price": Price,
    "Id": Id,
    "Quantity": Quantity,
    "Color": Color,
    "Imagelist": Imagelist.toString()
};

}