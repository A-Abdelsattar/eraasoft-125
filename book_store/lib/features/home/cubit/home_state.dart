part of 'home_cubit.dart';



@immutable
sealed class HomeState{}


final class InitialState extends HomeState{}


final class NewArrivalsSuccess extends HomeState{
  final List<Book> books;

  NewArrivalsSuccess(this.books);
}
final class NewArrivalsError extends HomeState{}
final class NewArrivalsLoading extends HomeState{}


final class BestSellerSuccess extends HomeState{
  final List<Book> books;

  BestSellerSuccess(this.books);
}
final class BestSellerError extends HomeState{}
final class BestSellerLoading extends HomeState{}
