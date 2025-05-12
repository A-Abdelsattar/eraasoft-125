import 'package:book_store/core/services/network/dio_helper/dio_helper.dart';
import 'package:book_store/features/profile/data/models/profile_model.dart';

class ProfileRepo{
  

 static Future<ProfileModel?> getProfile()async{
    try{
      final response=await DioHelper.getData(endPoint: "profile");
      if(response?.statusCode==200){
        return ProfileModel.fromJson(response?.data);
      }else{
        return null;
      }
    }catch(e){
      return null;
    }
  }
}