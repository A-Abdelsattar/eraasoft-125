part of 'create_account_cubit.dart';

@immutable
sealed class CreateAccountState {}

final class CreateAccountInitial extends CreateAccountState {}

final class CreateAccountLoading extends CreateAccountState {}
final class CreateAccountSuccess extends CreateAccountState {}
final class CreateAccountError extends CreateAccountState {
  final String errorMessage;

  CreateAccountError(this.errorMessage);
}
