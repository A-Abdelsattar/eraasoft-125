

import 'package:book_store/book_store.dart';
import 'package:book_store/core/helpers/app_contstants.dart';
import 'package:book_store/core/services/local/shared_prefs_helper/shared_prefs_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefsHelper.init();
  runApp(BookStore());
}