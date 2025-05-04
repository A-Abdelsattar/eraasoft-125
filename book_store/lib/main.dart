

import 'dart:convert';

import 'package:book_store/book_store.dart';
import 'package:book_store/core/helpers/app_contstants.dart';
import 'package:book_store/core/services/local/shared_prefs_helper/prefs_keys.dart';
import 'package:book_store/core/services/local/shared_prefs_helper/shared_prefs_helper.dart';
import 'package:book_store/core/services/network/dio_helper/dio_helper.dart';
import 'package:book_store/features/books/data/models/products_response_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefsHelper.init();
  DioHelper.init();


  runApp(BookStore());


}

