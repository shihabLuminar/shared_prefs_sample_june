import 'package:shared_preferences/shared_preferences.dart';

class HomeScreenController {
  static String? data = "empty";
  static late final SharedPreferences prefs;

  static initSharedPrefs() async {
    prefs = await SharedPreferences.getInstance();
  }

  static Future addData(String name) async {
    await prefs.setString("name", name);
  }

  static getData() {
    data = prefs.getString("name");
  }
}
