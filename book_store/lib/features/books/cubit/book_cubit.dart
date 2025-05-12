import 'package:bloc/bloc.dart';
import 'package:book_store/features/books/data/models/products_response_model.dart';
import 'package:book_store/features/books/data/repo/book_repo.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'book_state.dart';

class BookCubit extends Cubit<BookState> {
  BookCubit() : super(BookInitial());



  ProductsResponseModel? responseModel;
  getBooks()async{
    emit(GetBooksLoading());
    final response=await BookRepo.getAllBooks();
    if(response is DioException){
      emit(GetBooksError(response.response?.data["message"]));
    }else if(response is Response){
      debugPrint("emit succcess data${response.data.toString()}");
      responseModel=ProductsResponseModel.fromJson(response.data);
      debugPrint("emit succcess respnse model${responseModel?.status}");

      emit(GetBooksSuccess(responseModel?.data?.books??[]));
    }else{
      emit(GetBooksError("nou found, please try again!"));
    }
  }
  booksFilter()async{
    emit(GetBooksLoading());

    final response=await BookRepo.booksFilter(max: startValue,min: endValue);
    if(response is DioException){
      emit(GetBooksError(response.response?.data["message"]));
    }else if(response is Response){
      debugPrint("emit succcess data${response.data.toString()}");
      responseModel=ProductsResponseModel.fromJson(response.data);
      debugPrint("emit succcess respnse model${responseModel?.status}");

      emit(GetBooksSuccess(responseModel?.data?.books??[]));
    }else{
      emit(GetBooksError("nou found, please try again!"));
    }
  }


  ProductsResponseModel? searchResponse;


  booksSearch(String name)async{
    emit(SearchLoading());

    final response=await BookRepo.booksSearch(name);
    if(response is DioException){
      emit(SearchError(response.response?.data["message"]));
    }else if(response is Response){
      searchResponse=ProductsResponseModel.fromJson(response.data);

      emit(SearchSuccess(searchResponse?.data?.books??[]));
    }else{
      emit(SearchError("nou found, please try again!"));
    }
  }


  double startValue=10;
  double endValue=200;
  changeValues(RangeValues value){
    startValue=value.start;
    endValue=value.end;
    emit(ChangeSliderValue());
  }

addToCart({required int productId})async{
    final response=await BookRepo.addToCart(productId: productId);
    if(response is DioException){}
    else if(response is Response){
      emit(AddToCartSuccess(response.data["message"]??" "));
    }
}


}
