import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper{
  static SharedPreferences? sharedPreferences;

  static Future <void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }
  static Future <bool> saveData({required String key, required dynamic value}) {
    if(value is bool)
      {
        return sharedPreferences!.setBool(key, value);
      }
    else if(value is String)
      {
        return sharedPreferences!.setString(key, value);
      }
    else if(value is int)
    {
      return sharedPreferences!.setInt(key, value);
    }
    else
    {
      return sharedPreferences!.setDouble(key, value);
    }
  }
  static dynamic getData({required dynamic key, required dynamic defaultValue}) {
    if(sharedPreferences!.get(key) == null) {
      return defaultValue;
    }
    else {
      return sharedPreferences!.get(key);
    }
  }
}