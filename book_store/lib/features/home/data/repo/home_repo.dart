
import 'package:book_store/core/services/network/dio_helper/dio_helper.dart';
import 'package:book_store/core/services/network/dio_helper/end_points.dart';
import 'package:book_store/features/books/data/models/products_response_model.dart';

class HomeRepo{



 static Future<ProductsResponseModel?> getNewArrivalsList()async{
    try{
      final response=await DioHelper.getData(endPoint: EndPoints.newArrivals);
      if(response?.statusCode==200){
        return ProductsResponseModel.fromJson(response?.data);
      }else{
        return null;
      }
    }catch(e){
      return null;
    }
  }

 static Future<ProductsResponseModel?> getBestSellerList()async{
   try{
     final response=await DioHelper.getData(endPoint: EndPoints.bestSeller);
     if(response?.statusCode==200){
       return ProductsResponseModel.fromJson(response?.data);
     }else{
       return null;
     }
   }catch(e){
     return null;
   }
 }
}