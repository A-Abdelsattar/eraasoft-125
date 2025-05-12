import 'package:bloc/bloc.dart';
import 'package:book_store/features/profile/data/models/profile_model.dart';
import 'package:book_store/features/profile/data/repo/profile_repo.dart';
import 'package:meta/meta.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());




  getProfileData()async{

    emit(ProfileLoading());
    final response=await ProfileRepo.getProfile();
    if(response is ProfileModel){
      emit(ProfileSuccess(response));
    }else{

    }
  }
}
