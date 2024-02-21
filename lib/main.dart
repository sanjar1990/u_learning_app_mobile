import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ulearning_app/common/routes/pages.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
 // providers: AppBlocProviders.allBlocProviders,
 providers: [...AppPages.allBlocProviders(context)],
      child:ScreenUtilInit(
        builder: (context,child)=> MaterialApp(
          builder: FToastBuilder(),
          debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              appBarTheme: AppBarTheme(
                elevation: 0,
                backgroundColor: Colors.white
              ),
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            // home: const ApplicationPage(),
            // initialRoute: '/',
          onGenerateRoute: AppPages.generateRouteSettings,
          // routes: {
          //   'myHomePage':(context)=>const MyHomePage(title: ''),
          //   'signIn':(context)=>const SignIn(),
          //   'register':(context)=>const Register(),
          // },
        ),
      )



    );
  }
}


