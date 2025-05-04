import 'package:book_store/core/helpers/spacing.dart';
import 'package:book_store/features/login/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/widgets/custom_app_bar.dart';
import '../../../core/widgets/custom_app_button.dart';
import '../../../core/widgets/custom_text_form_field_with_title.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();
  var passController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Log in",
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0.w),
        child: SingleChildScrollView(
          child: BlocListener<LoginCubit, LoginState>(
            listener: (context, state) {
              if (state is LoginLoading) {
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          backgroundColor: Colors.transparent,
                          content: Center(child: CircularProgressIndicator()),
                        ));
              } else if (state is LoginSuccess) {
                Navigator.pop(context);
                  Navigator.pushNamedAndRemoveUntil(context, "/bottomNav", (route) => false,);
              } else if (state is LoginError) {
                Navigator.pop(context);
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          content: Text(state.errorMessage),
                        ));
              }
            },
            child: Column(
              children: [
                CustomTextFormFieldWithTitle(
                  controller: emailController,
                  validator: (value) {
                    if (value?.trim() == null || value!.trim().isEmpty) {
                      return "email is required";
                    }
                  },
                  title: "Email",
                  hintText: "example@gmail.com",
                ),
                CustomTextFormFieldWithTitle(
                  controller: passController,
                  validator: (value) {
                    if (value?.trim() == null || value!.trim().isEmpty) {
                      return "password is required";
                    } else if (value.length < 8) {
                      return "password must be 8 char";
                    }
                  },
                  title: "Password",
                  hintText: "**********",
                ),
                CustomAppButton(
                    onTap: () {
                      context.read<LoginCubit>().login(
                          email: emailController.text,
                          pass: passController.text);
                    },
                    title: "Login")
              ],
            ),
          ),
        ),
      ),
    );
  }
}




/*
l h
s
o
* */