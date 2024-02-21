import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning_app/common/routes/names.dart';
import 'package:ulearning_app/pages/application/application_page.dart';
import 'package:ulearning_app/pages/register/bloc/register_bloc.dart';
import 'package:ulearning_app/pages/register/register.dart';
import 'package:ulearning_app/pages/sign_in/block/signin_bloc.dart';
import 'package:ulearning_app/pages/sign_in/sign_in.dart';
import 'package:ulearning_app/pages/welcome/bloc/welcome_blocs.dart';
import 'package:ulearning_app/pages/welcome/welcome.dart';

class AppPages {
  static List<PageEntity> routes(){
    return [
      PageEntity(
        route: AppRoutes.INITIAL,
        page: const Welcome(),
        bloc: BlocProvider(create: (_) => WelcomeBloc()),
      ),
      PageEntity(
        route: AppRoutes.APPLICATION,
        page: const ApplicationPage(),
        bloc: BlocProvider(create: (_) => WelcomeBloc()),
      ),
      PageEntity(
        route: AppRoutes.SIGNIN,
        page: const SignIn(),
        bloc: BlocProvider(create: (_) => SignInBloc()),
      ),
      PageEntity(
        route: AppRoutes.REGISTER,
        page: const Register(),
        bloc: BlocProvider(create: (_) => RegisterBloc()),
      ),
    ];
  }

  static List<dynamic> allBlocProviders(BuildContext context){
    List<dynamic>blocProviders=<dynamic>[];
    for(var bloc in routes()){
    blocProviders.add(bloc.bloc);
    }
    return blocProviders;
  }
  static MaterialPageRoute generateRouteSettings(RouteSettings settings){
    if(settings.name!=null){
      var result=routes().where((element) => element.route==settings.name);
      if(result.isNotEmpty){
        return MaterialPageRoute(builder: (_)=>result.first.page, settings:settings);
      }
    }
    return MaterialPageRoute(builder: (_)=>const SignIn(), settings:  settings);
  }
}

class PageEntity {
  String route;
  Widget page;
  dynamic bloc;

  PageEntity({required this.route, required this.page,  this.bloc});
}
