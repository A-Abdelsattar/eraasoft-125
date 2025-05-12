import 'package:book_store/core/services/network/dio_helper/dio_helper.dart';
import 'package:book_store/core/services/network/dio_helper/end_points.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class BookRepo{



  static Future getAllBooks()async{
    try{
      final response=await DioHelper.getData(endPoint: EndPoints.books);
      debugPrint("try ${response.toString()}");
      if(response?.statusCode==200){
        return response;
      }else{
        return null;
      }

    }catch(e){
      debugPrint("catch ${e.toString()}");

      return null;
    }
  }
  static Future booksFilter({double? min, double?max})async{
    try{
      final response=await DioHelper.getData(endPoint: EndPoints.booksFilter,
      query: {
        "max":min?.toStringAsFixed(2),
        "min":max?.toStringAsFixed(2)
      }
      );

      debugPrint("try ${response.toString()}");
      if(response?.statusCode==200){
        return response;
      }else{
        return null;
      }

    }catch(e){
      debugPrint("catch ${e.toString()}");

      return null;
    }
  }


  static Future booksSearch(String name)async{
    try{
      final response=await DioHelper.getData(endPoint: EndPoints.booksSearch,
          query: {
            "name":name
          }
      );

      if(response?.statusCode==200){
        return response;
      }else{
        return null;
      }

    }catch(e){
      debugPrint("catch ${e.toString()}");

      return null;
    }
  }


  static Future<Response? > addToCart({required int productId})async{
    try{
      final response=await DioHelper.postData(endPoint: EndPoints.addToCart,
      data: {
        "product_id":productId
      }
      );
      if(response?.statusCode==201){
        return response;
      }else{
        return null;
      }
    }catch(e){
      return null;

    }
    }
}