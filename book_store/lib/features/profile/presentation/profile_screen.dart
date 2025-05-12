import 'package:book_store/core/helpers/spacing.dart';
import 'package:book_store/core/services/local/shared_prefs_helper/prefs_keys.dart';
import 'package:book_store/core/services/local/shared_prefs_helper/shared_prefs_helper.dart';
import 'package:book_store/core/widgets/custom_app_button.dart';
import 'package:book_store/core/widgets/custom_image.dart';
import 'package:book_store/features/profile/cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit()..getProfileData(),
      child: Column(
        children: [
          BlocBuilder<ProfileCubit,ProfileState>(builder: (context,state){

           if(state is ProfileSuccess){
             return Column(
               children: [
                 verticalSpace(50),
                 CustomImage(imageUrl: state.profileModel.data?.image??""),
                 Text(state.profileModel.data?.name??""),
                 Text(state.profileModel.data?.email??""),
               ],
             );
           }else{
             return CircularProgressIndicator();
           }
          }),
          SizedBox(height: 200,),
          CustomAppButton(title: "Logout",
            onTap: () {
              SharedPrefsHelper.removeData(PrefsKeys.tokenKey);
              Navigator.pushNamedAndRemoveUntil(
                context, "/splash", (route) => false,);
            },
          )
        ],
      ),
    );
  }
}
