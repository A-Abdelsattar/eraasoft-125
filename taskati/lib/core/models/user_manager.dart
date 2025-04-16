import 'package:hive/hive.dart';
import 'package:taskati/core/models/user_model.dart';

class UserManager{
  UserManager._(){
    _getUserData();
  }
  static final UserManager instance = UserManager._();


  UserModel? userData;
  _getUserData(){
    userData=Hive.box<UserModel>("user").values.first as UserModel?;
  }

  saveUserData(UserModel user){
    Hive.box<UserModel>("user").add(user);

  }
}