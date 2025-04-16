
import 'package:hive_flutter/adapters.dart';

part 'user_model.g.dart';

@HiveType(typeId: 1)
class UserModel{
  @HiveField(0)
  String? name;
  @HiveField(1)
  String path;

  UserModel(this.name, this.path);
}