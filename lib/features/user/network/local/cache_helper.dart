import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper
{
  static late SharedPreferences sharedPreferences;

  static init()async
  {
    sharedPreferences = await SharedPreferences.getInstance();
  }

 static Future<bool> setData({
    required String key,
    required dynamic value,
})async{
    if(value is int)return await sharedPreferences.setInt(key, value);
    if(value is bool)return await sharedPreferences.setBool(key, value);
    if(value is String)return await sharedPreferences.setString(key, value);
    return await sharedPreferences.setDouble(key, value);
  }

 static dynamic getData({
   required dynamic key,
}){
    return sharedPreferences.get(key);
  }
}