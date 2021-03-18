import 'dart:async';

import 'package:customeremall/localization/sharedpreferences/saveLocally.dart';
import 'package:customeremall/localization/sharedpreferences/sharedpreferences.dart';
import 'package:customeremall/settingsAndVariables/routers/routecodes.dart';
import 'package:customeremall/settingsAndVariables/variables.dart';
import 'package:flutter/material.dart';

class LogoutPage extends StatefulWidget {
  @override
  _LogoutPageState createState() => _LogoutPageState();
}

class _LogoutPageState extends State<LogoutPage> {

  @override
  void initState() {
    MyCart.clear();
    MyAllAddresses.clear();
    writeAddresses();
    writeCart();
    SetStringFromSharedPref("Email", "@#");
    SetStringFromSharedPref("Password", "@#");
    Timer(Duration(seconds: SplashTimer), () {
      Navigator.popAndPushNamed(context, SplashRouteCode);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Container(
            width: ScreenWidth,
            height: ScreenHeight,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
        ),
    );
  }
}
