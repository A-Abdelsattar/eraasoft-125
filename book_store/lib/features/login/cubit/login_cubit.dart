import 'package:bloc/bloc.dart';
import 'package:book_store/core/helpers/app_functions.dart';
import 'package:book_store/features/login/data/repo/login_repo.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  LoginRepo loginRepo=LoginRepo();

  login({required String email,required String pass})async{
    emit(LoginLoading());
    final response=await loginRepo.login(email: email, pass: pass);
    if(response is DioException){
      emit(LoginError(response.response?.data["message"]));

    }else if(response is Response){
      if(response.statusCode==200){
        debugPrint(response.data.toString());
        AppFunctions.saveUserToken(response.data["data"]["token"]);
        emit(LoginSuccess());
      }else{
        emit(LoginError(response.data["message"]));
      }
    }
  }

}
