import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning_app/pages/sign_in/block/signin_event.dart';
import 'package:ulearning_app/pages/sign_in/block/signin_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState>{
  SignInBloc(): super(const SignInState()){
    on<EmailEvent>(_emailEvent);

    on<PasswordEvent>((event, emit){
    emit(state.copyWith(password: event.password));
    });
  }

  void _emailEvent(EmailEvent event, Emitter<SignInState> emit){
    emit(state.copyWith(email: event.email));
  }
}