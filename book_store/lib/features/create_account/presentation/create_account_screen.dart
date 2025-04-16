import 'package:book_store/core/widgets/custom_app_bar.dart';
import 'package:book_store/core/widgets/custom_app_button.dart';
import 'package:book_store/core/widgets/custom_text_form_field_with_title.dart';
import 'package:book_store/features/create_account/cubit/create_account_cubit.dart';
import 'package:book_store/features/test_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  var nameController=TextEditingController();
  var emailController=TextEditingController();
  var passwordController=TextEditingController();
  var confirmationPassController=TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmationPassController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Log in",),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0.w),
        child: BlocConsumer<CreateAccountCubit, CreateAccountState>(
          listener: (context, state) {
            debugPrint("State of Create Account ${state.toString()}");
            if(state is CreateAccountSuccess){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>TestScreen()));
            }else if(state is CreateAccountError){
              debugPrint("error");
            }
          },
          builder: (context, state) {
            return Column(
              children: [
                CustomTextFormFieldWithTitle(
                controller: nameController
                ,title: "Name",
                  hintText: "Name",
                ),
                CustomTextFormFieldWithTitle(
                controller: emailController
                ,title: "Email",
                  hintText: "example@gmail.com",
                ),
                CustomTextFormFieldWithTitle(
                controller: passwordController
                ,title: "Password",
                  hintText: "**********",
                ),
                CustomTextFormFieldWithTitle(
                controller: confirmationPassController
                ,title: "Confirm password",
                  hintText: "**********",
                ),
                if(state is CreateAccountLoading)
                  LinearProgressIndicator(),
                CustomAppButton(
                    onTap: () {
                      context.read<CreateAccountCubit>().createAccount(name: nameController.text,
                          email: emailController.text,
                          password: passwordController.text,
                          confirmationPassword: confirmationPassController.text);
                    }
                    , title: "Create Account")
              ],
            );
          },
        ),
      ),
    );
  }
}
