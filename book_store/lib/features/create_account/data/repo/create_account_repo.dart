import 'package:book_store/core/services/network/dio_helper/dio_helper.dart';
import 'package:book_store/core/services/network/dio_helper/end_points.dart';
import 'package:book_store/features/create_account/data/models/create_account_request_data.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class CreateAccountRepo {


  static Future createAccount(
      {required CreateAccountRequestData userData}) async {

    try {
      final response = await DioHelper.postData(endPoint:EndPoints.createAccount, data: {
        "name": userData.name,
        "email": userData.email,
        "password": userData.password,
        "password_confirmation": userData.confirmPassword
      });
      if (response?.statusCode == 201) {
        return response?.data;
      } else {
        print("here");
        return null;
      }
    } catch (e) {
      return e;
    }
  }
}
