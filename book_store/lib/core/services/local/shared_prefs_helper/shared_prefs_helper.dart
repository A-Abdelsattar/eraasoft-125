import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsHelper{

  static SharedPreferences? _prefs;

  static init()async{
    _prefs=await SharedPreferences.getInstance();
  }

 static Future<void> saveData({required String key, required value })async{
    if(value is String ) {
      await _prefs!.setString(key, value);
    }else if(value is int){
      await _prefs!.setInt(key, value);
    }else if(value is bool){
      await _prefs!.setBool(key, value);
    }else if(value is double){
      await _prefs!.setDouble(key, value);
    }
  }

  static  getData(String key){
    return _prefs!.get(key);
  }

  static removeData(String key)async{
    await _prefs!.remove(key);
  }

}