import 'package:shared_preferences/shared_preferences.dart';

Future<int> getIntFromSharedPref() async {
  final prefs = await SharedPreferences.getInstance();
  final startupNumber = prefs.getInt('startupNumber');
  if (startupNumber == null) {
    return 0;
  }
  return startupNumber;
}

Future<String> getStringFromSharedPref(String text) async {
  final prefs = await SharedPreferences.getInstance();
  final startupString = prefs.getString(text);
  if (startupString == null) {
    return "@#";
  }
  return startupString;
}

Future<bool> SetStringFromSharedPref(String code,String text) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString(code,text);
  return true;
}

Future<void> resetCounter() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setInt('startupNumber', 0);
}

Future<int> incrementStartup() async {
  final prefs = await SharedPreferences.getInstance();

  int lastStartupNumber = await getIntFromSharedPref();
  int currentStartupNumber = ++lastStartupNumber;

  await prefs.setInt('startupNumber', currentStartupNumber);

  return currentStartupNumber;

  // if (currentStartupNumber >= 2) {
  //   mystring = await _getStringFromSharedPref();
  //   setState(() => _haveStarted2Times = '$currentStartupNumber : ');
  //   // _resetCounter();
  // } else {
  //   await prefs.setString("login", "login success");
  //   setState(() => _haveStarted2Times = '$currentStartupNumber : ');
  // }
}