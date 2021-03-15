import 'package:flutter/cupertino.dart';
import 'package:toast/toast.dart';

Future<void> ShowToast(String text, BuildContext context) async {
  Toast.show(text, context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
}