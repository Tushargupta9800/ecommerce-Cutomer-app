import 'package:customeremall/Models/AddressModel.dart';
import 'package:customeremall/Models/MyOrdersModel.dart';
import 'package:customeremall/Models/cartModel.dart';
import 'package:customeremall/Models/productModel.dart';
import 'package:customeremall/Models/userModel.dart';
import 'package:customeremall/settingsAndVariables/settings.dart';
import 'package:flutter/material.dart';

int SplashTimer = 1;

List<String> AllCategoryList = [];
List<String> AllSubCategoryList = [];
String CurrentCategoryEnglish;
String CurrentCategoryArabic;
int shiftToTab = 1;

String AppLanguage = "en";

double ScreenWidth;
double ScreenHeight;

double H1 = 40;
double H2 = 35;
double H3 = 30;
double H4 = 25;
double H5 = 20;
double H6 = 15;
double H7 = 10;

Color White = Colors.white;
Color Black = Colors.black;
Color Grey = Colors.grey;
Color LightGrey = Colors.grey[400];
Color Blue = Colors.blue;
Color Red = Colors.red;
Color DarkBlue = HexColor.fromHex("#18396A");

double TextFieldSize = 50;

User Customer = User();

String HeroTag;
int HeroIndex;
productModel HeroProduct = productModel();
List<CartModel> MyCart = [];
List<AddressModel> MyAllAddresses = [];
List<MyOrdersModel> MyAllOrders = [];
int MyAddressPosition = 0;
int ChoosenAddress = 0;
bool CanWeOrderNow = false;

String Whatsappnumber = "+966599018558";
String Whatsappmsg = "Hello";