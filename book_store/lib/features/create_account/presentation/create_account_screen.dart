import 'package:book_store/core/helpers/extentions.dart';
import 'package:book_store/core/widgets/custom_app_bar.dart';
import 'package:book_store/core/widgets/custom_app_button.dart';
import 'package:book_store/core/widgets/custom_text_form_field_with_title.dart';
import 'package:book_store/features/create_account/cubit/create_account_cubit.dart';
import 'package:book_store/features/create_account/data/models/create_account_request_data.dart';
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
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmationPassController = TextEditingController();
  var formKey = GlobalKey<FormState>();

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
      appBar: CustomAppBar(
        title: "Log in",
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0.w),
        child: BlocConsumer<CreateAccountCubit, CreateAccountState>(
          listener: (context, state) {
            debugPrint("State of Create Account ${state.toString()}");
            if (state is CreateAccountSuccess) {

              Navigator.pushNamedAndRemoveUntil(context, "/bottomNav", (route) => false,);

            } else if (state is CreateAccountError) {
              formKey.currentState?.validate();

              debugPrint(state.errorMessage);
              debugPrint( formKey.currentState?.validate().toString());

            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    CustomTextFormFieldWithTitle(
                      controller: nameController,
                      validator: (value) {
                        if (value?.trim() == null || value!.trim().isEmpty) {
                          return "name is required";
                        }
                      },
                      title: "Name",
                      hintText: "Name",
                    ),
                    CustomTextFormFieldWithTitle(
                      controller: emailController,
                      validator: (value) {
                        if (value?.trim() == null || value!.trim().isEmpty) {
                          return "email is required";
                        }else if(!emailController.text.toString().isValidEmail){
                          return "please enter a valid email";
                        }
                        else if(context.read<CreateAccountCubit>().errorMessage!=null){
                          return context.read<CreateAccountCubit>().errorMessage;
                        }
                      },
                      title: "Email",
                      hintText: "example@gmail.com",
                    ),
                    CustomTextFormFieldWithTitle(
                      controller: passwordController,
                      validator: (value) {
                        if (value?.trim() == null || value!.trim().isEmpty) {
                          return "password is required";
                        }else if(value.length<8){
                          return "password must be 8 char";
                        }
                      },
                      title: "Password",
                      hintText: "**********",
                    ),
                    CustomTextFormFieldWithTitle(
                      controller: confirmationPassController,
                      validator: (value) {
                        if (value?.trim() == null || value!.trim().isEmpty) {
                          return "confirmation password is required";
                        }else if(confirmationPassController.text!=passwordController.text){
                          return "confirmation password must be same as password";
                        }
                      },
                      title: "Confirm password",
                      hintText: "**********",
                    ),
                    if (state is CreateAccountLoading) LinearProgressIndicator(),
                    CustomAppButton(
                        onTap: () {
                          if(formKey.currentState?.validate()??false){
                            context.read<CreateAccountCubit>().createAccount(
                                userData: CreateAccountRequestData(
                                    name: nameController.text,
                                    email: emailController.text,
                                    password: passwordController.text,
                                    confirmPassword:
                                    confirmationPassController.text));

                          }
                        },
                        title: "Create Account")
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
