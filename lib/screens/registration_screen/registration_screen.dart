import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hac_project/screens/registration_screen/cubit/registration_cubit.dart';
import 'package:hac_project/theme/tdp_colors.dart';
import 'package:hac_project/theme/tdp_text_styles.dart';
import 'package:hac_project/widgets/tdp_button.dart';

class RegistrationScree extends StatelessWidget {
  const RegistrationScree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegistrationCubit, RegistrationState>(
      builder: (context, state) {
        return Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Регистрация",
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
                onPressed: () {
                  context.read<RegistrationCubit>().register(
                        username: state.username.text,
                        password: state.password.text,
                      );
                },
                child: Text(
                  "Зарегистрироваться",
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
