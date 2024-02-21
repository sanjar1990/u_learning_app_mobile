import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/pages/sign_in/block/signin_bloc.dart';
import 'package:ulearning_app/pages/sign_in/block/signin_event.dart';
import 'package:ulearning_app/pages/sign_in/block/signin_state.dart';
import 'package:ulearning_app/pages/sign_in/widgets/sign_in_controller.dart';

import '../common_widgets.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc,SignInState>(builder: (context, state)=>
        Container(
          color: Colors.white,
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: buildAppBar('Log in'),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildThirdPartyLogin(context),
                  Center(child: reusableText('Or use your email account to login')),
                  Container(
                    margin: EdgeInsets.only(top: 36.h),
                    padding: EdgeInsets.only(left: 25.w, right: 25.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        reusableText('Email'),
                        buildTextField('Enter your email address', 'email','user', TextInputType.emailAddress,
                            (value){
                          context.read<SignInBloc>().add(EmailEvent(value));
                            }),
                        reusableText('Password'),
                        buildTextField('Enter your password', 'password','lock', TextInputType.text,
                            (value){
                          context.read<SignInBloc>().add(PasswordEvent(value));
                            }),
                      ],
                    ),
                  ),
                  forgotPassword(),
                  buildLogInAndRegButton('Log in', 'login',(){
                    SignInController(context: context).handleSignIn('email');
                  }),
                  buildLogInAndRegButton('Register','register',(){
                    Navigator.of(context).pushNamed('/register');
                  }),
                ],),
            ),
          ),
        ));
  }
}
