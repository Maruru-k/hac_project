import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hac_project/block/auth_cubit.dart';
import 'package:hac_project/screens/dashboard/dashboard.dart';
import 'package:hac_project/screens/login_screen/login_screen.dart';
import 'package:hac_project/screens/registration_screen/registration_screen.dart';
import 'package:hac_project/theme/tdp_colors.dart';
import 'package:hac_project/theme/tdp_text_styles.dart';
import 'package:hac_project/widgets/tdp_button.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state.isAuth != null && state.isAuth!) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const Dashboard()),
            (route) => false,
          );
        } else {
          context.read<AuthCubit>().goToAuth();
        }
      },
      builder: (context, state) {
        if (state.status == AuthStatus.initial) {
          context.read<AuthCubit>().isAuth();
        }
        if (state.status == AuthStatus.loaded) {
          return Scaffold(
            backgroundColor: TdpColors.white,
            body: SafeArea(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TdpButton(
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RegistrationScree()),
                          (route) => false,
                        );
                      },
                      child: Text(
                        "Регистрация",
                        style: TdpTextStyle.title3(TdpColors.white),
                      ),
                    ),
                    const SizedBox(height: 16),
                    TdpButton(
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginScreen()),
                          (route) => false,
                        );
                      },
                      child: Text(
                        "Авторизация",
                        style: TdpTextStyle.title3(TdpColors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
