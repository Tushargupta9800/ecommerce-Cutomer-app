import 'package:shared_preferences/shared_preferences.dart';

Future<int> _getIntFromSharedPref() async {
  final prefs = await SharedPreferences.getInstance();
  final startupNumber = prefs.getInt('startupNumber');
  if (startupNumber == null) {
    return 0;
  }
  return startupNumber;
}

Future<String> _getStringFromSharedPref() async {
  final prefs = await SharedPreferences.getInstance();
  final startupNumber = prefs.getString('login');
  if (startupNumber == null) {
    return "";
  }
  return startupNumber;
}

Future<void> _resetCounter() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setInt('startupNumber', 0);
}

Future<int> _incrementStartup() async {
  final prefs = await SharedPreferences.getInstance();

  int lastStartupNumber = await _getIntFromSharedPref();
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