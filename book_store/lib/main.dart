

import 'package:book_store/book_store.dart';
import 'package:book_store/core/services/local/shared_prefs_helper/shared_prefs_helper.dart';
import 'package:book_store/core/services/network/dio_helper/dio_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/services/bloc_observer.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefsHelper.init();
  DioHelper.init();
  Bloc.observer = MyBlocObserver();


  runApp(BookStore());


}

