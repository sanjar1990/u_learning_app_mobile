import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/pages/register/bloc/register_bloc.dart';
import 'package:ulearning_app/pages/register/bloc/register_event.dart';
import 'package:ulearning_app/pages/register/bloc/register_state.dart';
import 'package:ulearning_app/pages/register/register_controller.dart';

import '../common_widgets.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return   BlocBuilder<RegisterBloc,RegisterState>(builder: (context, state){return
      Container(
      color: Colors.white,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: buildAppBar('Sign Up'),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h,),
              Center(child: reusableText('Enter your details below & free sign up')),
              Container(
                margin: EdgeInsets.only(top: 36.h),
                padding: EdgeInsets.only(left: 25.w, right: 25.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    reusableText('User name'),
                    buildTextField('Enter your user name', 'user','user', TextInputType.text,
                            (value){
                          context.read<RegisterBloc>().add(UserNameEvent(value));
                        }),
                    reusableText('Email'),
                    buildTextField('Enter your email address', 'email','user', TextInputType.emailAddress,
                            (value){
                            context.read<RegisterBloc>().add(EmailEvent(value));
                        }),
                    reusableText('Password'),
                    buildTextField('Enter your password', 'password','lock', TextInputType.text,
                            (value){
                    context.read<RegisterBloc>().add(PasswordEvent(value));
                        }),
                    reusableText('Confirm Password'),
                    buildTextField('Enter your confirm password', 'password','lock', TextInputType.text,
                            (value){
                      context.read<RegisterBloc>().add(RePasswordEvent(value));
                        }),
                    reusableText('By creating an account you have to agree with our terms & conditions '),
                  ],
                ),
              ),

              buildLogInAndRegButton('Sign Up','login',(){
            RegisterController(context: context).handleEmailRegister();
              }),
            ],),
        ),
      ),
    );});
  }
}
