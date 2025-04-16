import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class CreateAccountRepo {
  static Dio? _dio;

  static  createAccount(
      {required String name,
      required String email,
      required String password,
      required String confirmationPassword}) async {
    _dio = Dio(BaseOptions(
        baseUrl: "https://codingarabic.online/api/",
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json"
        },));

   try{
     final response= await _dio?.post("register", data: {
       "name": name,
       "email": email,
       "password": password,
       "password_confirmation": confirmationPassword
     });
     if(response?.statusCode==201){
       return response?.data;
     }else{
       return null;
     }

   }catch(e){
     return e;
   }
  }
}
