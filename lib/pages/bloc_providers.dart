import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning_app/pages/register/bloc/register_bloc.dart';
import 'package:ulearning_app/pages/sign_in/block/signin_bloc.dart';
import 'package:ulearning_app/pages/welcome/bloc/welcome_blocs.dart';


class AppBlocProviders{
  static get allBlocProviders=>[
    BlocProvider(
      lazy: false,
      create:  (context)=>WelcomeBloc(),),

    BlocProvider(create:  (context)=>SignInBloc(),),
    BlocProvider(create:  (context)=>RegisterBloc(),)

  ];
}