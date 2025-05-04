import 'package:book_store/core/services/local/shared_prefs_helper/shared_prefs_helper.dart';
import 'package:book_store/features/create_account/data/repo/create_account_repo.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/helpers/app_functions.dart';
import '../../../core/services/local/shared_prefs_helper/prefs_keys.dart';
import '../data/models/create_account_request_data.dart';

part 'create_account_state.dart';

class CreateAccountCubit extends Cubit<CreateAccountState> {
  CreateAccountCubit() : super(CreateAccountInitial());

  String? errorMessage;

  createAccount({required CreateAccountRequestData userData}) async {
    errorMessage = null;
    emit(CreateAccountLoading());
    debugPrint("Create Account Calling");
    final response = await CreateAccountRepo.createAccount(userData: userData);

    if (response is DioException) {
      print("dio error////");
      print(response.response?.data["errors"]["email"][0].toString());
      errorMessage = response.response?.data["errors"]["email"][0].toString();
      emit(CreateAccountError(
          response.response?.data["errors"]["email"][0].toString() ?? ""));
    } else if (response["status"] == 201) {
      AppFunctions.saveUserToken(response.data["data"]["token"]);
      emit(CreateAccountSuccess());
    }

    //     .then((value){
    //  if(value!=null){
    //    _saveUserToken(value["data"]["token"]);
    //    emit(CreateAccountSuccess());
    //  }
    // }).catchError((error){
    //   print("dio error////");
    //   print(error.toString());
    //   if(error is DioException){
    //     print("dio error////");
    //     print(error.toString());
    //
    //   }
    //   emit(CreateAccountError());
    //
    // });
  }
}
