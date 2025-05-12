part of 'profile_cubit.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}
final class ProfileSuccess extends ProfileState {
  final ProfileModel profileModel;

  ProfileSuccess(this.profileModel);
}
final class ProfileError extends ProfileState {}
final class ProfileLoading extends ProfileState {}
