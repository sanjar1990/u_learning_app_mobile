import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning_app/common/widgets/flutter_toast.dart';
import 'package:ulearning_app/pages/register/bloc/register_bloc.dart';

class RegisterController{
  final BuildContext context;

  RegisterController({required this.context});
  Future<void> handleEmailRegister() async {
    final state=context.read<RegisterBloc>().state;
    String userName=state.userName;
    String email=state.email;
    String password=state.password;
    String rePassword=state.rePassword;
    if(userName.isEmpty){
      toastInfo(msg: 'User name cannot be empty!');
      return;
    }
    if(email.isEmpty){
      toastInfo(msg: 'Email cannot be empty!');
      return;
    }
    if(password.isEmpty){
      toastInfo(msg: 'Password cannot be empty!');
      return;
    }
    if(rePassword.isEmpty){
      toastInfo(msg: 'Password not match!');
      return;
    }
    if(password!=rePassword){
      toastInfo(msg: 'Password not match!');
      return;
    }
    try{
      final credential=await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
   if(credential.user!=null){
     await credential.user?.sendEmailVerification();
     await credential.user?.updateDisplayName(userName);
  toastInfo(msg: 'The verification email was sent to your email address! verify it and sign in');
   Navigator.of(context).pop();
   }
    }on FirebaseAuthException catch(e){
      if(e.code=='weak-password'){
        toastInfo(msg: 'Password is too week');
      }
    toastInfo(msg: e.code);
    }
  }
}