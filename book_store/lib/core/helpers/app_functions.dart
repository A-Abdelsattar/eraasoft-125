import '../services/local/shared_prefs_helper/prefs_keys.dart';
import '../services/local/shared_prefs_helper/shared_prefs_helper.dart';

class AppFunctions{


  static void saveUserToken(String token){
    SharedPrefsHelper.saveData(key:PrefsKeys.tokenKey,value:  token);
  }
}

