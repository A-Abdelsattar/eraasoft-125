import 'package:book_store/core/services/local/shared_prefs_helper/shared_prefs_helper.dart';
import 'package:book_store/features/create_account/data/repo/create_account_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/services/local/shared_prefs_helper/prefs_keys.dart';

part 'create_account_state.dart';

class CreateAccountCubit extends Cubit<CreateAccountState> {
  CreateAccountCubit() : super(CreateAccountInitial());


  createAccount(
      {required String name,
      required String email,
      required String password,
      required String confirmationPassword}) async{
    emit(CreateAccountLoading());
    debugPrint("Create Account Calling");
    final response=await CreateAccountRepo.createAccount(
        name: name,
        email: email,
        password: password,
        confirmationPassword: confirmationPassword);
    if(response["status"]==201){
      _saveUserToken(response["data"]["token"]);
      emit(CreateAccountSuccess());
    }else{
      emit(CreateAccountError());
    }
  }

 void _saveUserToken(String token){

    SharedPrefsHelper.saveData(key:PrefsKeys.tokenKey,value:  token);
  }
}
