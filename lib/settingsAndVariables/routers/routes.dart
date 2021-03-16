import 'package:customeremall/screens/HomePage/DrawerPages/Language.dart';
import 'package:customeremall/screens/HomePage/DrawerPages/LogoutPage.dart';
import 'package:customeremall/screens/HomePage/DrawerPages/termsAndconditions.dart';
import 'package:customeremall/screens/HomePage/HomePage.dart';
import 'package:customeremall/screens/Shop/CategoryPage.dart';
import 'package:customeremall/screens/Shop/FullProduct.dart';
import 'package:customeremall/screens/Shop/Productcart.dart';
import 'package:customeremall/screens/Splashscreen/getstarted.dart';
import 'package:customeremall/screens/Splashscreen/splashscreen.dart';
import 'package:customeremall/screens/auth/login.dart';
import 'package:customeremall/screens/auth/register.dart';
import 'package:customeremall/settingsAndVariables/routers/routecodes.dart';
import 'package:flutter/material.dart';

var routes = <String,WidgetBuilder>{
  SplashRouteCode: (BuildContext context) => SplashScreen(),
  GetStartedRouteCode: (BuildContext context) => GetStarted(),
  LoginRouteCode: (BuildContext context) => Login(),
  RegisterRouteCode: (BuildContext context) => Register(),
  HomePageRouteCode: (BuildContext context) => HomePage(),
  CategoryPageRouteCode: (BuildContext context) => CategoryPage(),
  LanguageRouteCode: (BuildContext context) => Language(),
  FullProductRouteCode: (BuildContext context) => FullProduct(),
  LogoutRouteCode: (BuildContext context) => LogoutPage(),
  CartPageRouteCode: (BuildContext context) => CartPage(),
  TACRouteCode: (BuildContext context) => TermsAndConditions(),
};