import 'dart:typed_data';
import 'package:flutter/cupertino.dart';

class productModel{
  List<int> ProductPic;
  List<String> ProductColor;
  List<String> ProductSize;
  List<String> ProductQuantity;
  String ProductName;
  String ProductPrice;
  String ProductDescription;
  String ProductId;
  MemoryImage ProductFinalImages;

  void addList(String Color, String Size, String Quantity){
    this.ProductColor = Color.substring(1,Color.length-1).split(',');
    this.ProductSize = Size.substring(1,Size.length-1).split(',');
    this.ProductQuantity = Quantity.substring(1,Quantity.length-1).split(',');
    for(int i=0;i<ProductColor.length;i++){
      ProductColor[i] = ProductColor[i].trim();
      ProductSize[i] = ProductSize[i].trim();
      ProductQuantity[i] = ProductQuantity[i].trim();
      ProductColor[i] = ProductColor[i].replaceAll(']', '');
      ProductSize[i] = ProductSize[i].replaceAll(']', '');
      ProductQuantity[i] = ProductQuantity[i].replaceAll(']', '');
      ProductColor[i] = ProductColor[i].replaceAll('[', '');
      ProductSize[i] = ProductSize[i].replaceAll('[', '');
      ProductQuantity[i] = ProductQuantity[i].replaceAll('[', '');
    }

    ProductFinalImages = MemoryImage(Uint8List.fromList(ProductPic));
  }

}