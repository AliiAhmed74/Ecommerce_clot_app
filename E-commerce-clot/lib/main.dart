import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_training/Categories_Screens/hoodies.dart';
import 'package:project_training/controller/forgetpass/forgetpass_cubit.dart';
import 'package:project_training/controller/onbaording/onboarding_cubit.dart';
import 'package:project_training/controller/signin/signin_cubit.dart';
import 'package:project_training/controller/signup/signup_cubit.dart';
import 'package:project_training/core/shared/sharedPref.dart';
import 'package:project_training/features/poductPage.dart';
import 'package:project_training/firebase_options.dart';
import 'package:project_training/homePage1.dart';
import 'package:project_training/view/splash/splash_screen.dart';
import 'package:project_training/views/orders_2/orders_2.dart';

void main()async {
   WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.cacheInitialization();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => SigninCubit()),
            BlocProvider(create: (_) => SignupCubit()),
            BlocProvider(create: (_) => ForgetpassCubit()),
            BlocProvider(create: (_) => OnboardingCubit()),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const SplashScreen(),
          ),
        );
      }
    );
  }
}