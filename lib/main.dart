import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hac_project/block/auth_cubit.dart';
import 'package:hac_project/custom_scroll_behavior.dart';
import 'package:hac_project/reposutories/auth_reposytory.dart';
import 'package:hac_project/screens/dashboard/dashboard.dart';
import 'package:hac_project/screens/login_screen/cubit/login_cubit.dart';
import 'package:hac_project/screens/registration_screen/cubit/registration_cubit.dart';
import 'package:hac_project/screens/splash_screen/splash_screen.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      scrollBehavior: MyCustomScrollBehavior(),
      home: MultiRepositoryProvider(
        providers: [
          RepositoryProvider(
            create: (context) => AuthRepository(),
          ),
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => AuthCubit(
                authRepository: context.read<AuthRepository>(),
              ),
            ),
            BlocProvider(
              create: (context) => RegistrationCubit(
                authCubit: context.read<AuthCubit>(),
              ),
            ),
            BlocProvider(
              create: (context) => LoginCubit(
                authCubit: context.read<AuthCubit>(),
              ),
            ),
          ],
          child: SplashScreen(),
        ),
      ),
    );
  }
}
