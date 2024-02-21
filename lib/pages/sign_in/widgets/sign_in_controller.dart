import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning_app/common/widgets/flutter_toast.dart';
import 'package:ulearning_app/pages/sign_in/block/signin_bloc.dart';

class SignInController{
  final BuildContext context;
  const SignInController({required this.context});

  Future<void> handleSignIn(String type) async {
    try{
      if(type=='email'){
        final state=context.read<SignInBloc>().state;
        String emailAddress=state.email;
        String password=state.password;
        if(emailAddress.isEmpty){
        toastInfo(msg: 'You need to fill email address');
        }
        if(password.isEmpty){
          toastInfo(msg: 'You need to fill password');

        }
        try{
          final credentials= await FirebaseAuth.instance
              .signInWithEmailAndPassword(email: emailAddress, password: password);
          if(credentials.user==null){
            toastInfo(msg: 'Profile not found!');

          }
          if(!credentials.user!.emailVerified){
            toastInfo(msg: 'You need to verify email address!');
          }
          var user=credentials.user;

          if(user!=null){

          }else{
            final uuid=user!.uid;
            print('UUID+++++++++++++++++++++: $uuid');
          }
        }on FirebaseAuthException catch(e){
          if(e.code=='user-not-found'){
            toastInfo(msg: 'User not found');
          }else if(e.code=='wrong-password'){
            toastInfo(msg: 'Wrong password is provider');
          }else if(e.code=='invalid-email'){
            toastInfo(msg: 'Your email format is incorrect');
          }
          toastInfo(msg: e.code);
        }

      }
    }catch(e){
      toastInfo(msg: e.toString());
    }
  }
}