import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hac_project/screens/dashboard/dashboard.dart';
import 'package:hac_project/screens/login_screen/cubit/login_cubit.dart';
import 'package:hac_project/theme/tdp_colors.dart';
import 'package:hac_project/theme/tdp_text_styles.dart';
import 'package:hac_project/widgets/tdp_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Авторизация",
                style: TdpTextStyle.large(TdpColors.blue),
              ),
              const SizedBox(height: 32),
              TextField(
                controller: state.username,
                decoration: const InputDecoration(hintText: "Имя пользователя"),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: state.password,
                decoration: const InputDecoration(hintText: "Пароль"),
              ),
              const SizedBox(height: 32),
              TdpButton(
                onPressed: () async {
                  await context.read<LoginCubit>().login(
                        username: state.username.text,
                        password: state.password.text,
                      );
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => Dashboard()),
                    (route) => false,
                  );
                },
                child: Text(
                  "Войти",
                  style: TdpTextStyle.title2(TdpColors.white),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
