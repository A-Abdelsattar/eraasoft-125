import 'package:flutter/cupertino.dart';

class ProductsResponseModel {
  int? status;
  String? message;
  Data? data;

  ProductsResponseModel.fromJson(Map<String,dynamic>json){
    debugPrint("from json${json.toString()}");
    status=json["status"];
    message=json["message"];
    data=Data.fromJson(json["data"]);
  }
}


class Data {
  List<Book>? books;

  Data.fromJson(Map<String,dynamic>json){
    debugPrint("from json data${json.toString()}");

    if(json["products"]!=null){
       books = <Book>[];
     json["products"].forEach((v){
       var b=Book.fromJson(v);
       books?.add(b);
     });
    }
  }
}



class Book {
  int? id;
  String? name;
  String? description;
  String? price;
  int? discount;
  double? priceAfterDiscount;
  int? stock;
  String? image;
  String? category;


  Book.fromJson(Map<String,dynamic> json){
    debugPrint("from json books${json.toString()}");

    id=json["id"];
    name=json["name"];
    description=json["description"];
    price=json["price"];
    discount=json["discount"];
    priceAfterDiscount=json["price_after_discount"];
    stock=json["stock"];
    image=json["image"];
    category=json["category"];
  }

}






