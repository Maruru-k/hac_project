import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hac_project/block/auth_cubit.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthCubit _authCubit;

  LoginCubit({required AuthCubit authCubit})
      : _authCubit = authCubit,
        super(
          LoginState(
            username: TextEditingController(),
            password: TextEditingController(),
          ),
        );

  void login({
    required String username,
    required String password,
  }) {
    _authCubit.login(
      username: username,
      password: password,
      isRegisteredUser: true,
    );
  }
}
