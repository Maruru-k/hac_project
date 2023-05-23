import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hac_project/block/auth_cubit.dart';
import 'package:hac_project/screens/dashboard/dashboard.dart';

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

  Future<void> login({
    required String username,
    required String password,
  }) async {
    await _authCubit.login(
      username: username,
      password: password,
      isRegisteredUser: true,
    );
  }
}
