import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hac_project/reposutories/auth_reposytory.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository _authRepository;

  AuthCubit({
    required AuthRepository authRepository,
  })  : _authRepository = authRepository,
        super(AuthState());

  Future<void> login({
    required String username,
    required String password,
    bool isRegisteredUser = true,
  }) async {
    final String token;
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    if (isRegisteredUser) {
      token = await _authRepository.login(
        username: username,
        password: password,
      );
    } else {
      token = await _authRepository.createUser(
        username: username,
        password: password,
      );
    }

    await prefs.setString('auth_token', token);
  }

  Future<void> logout() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.remove('auth_token');
  }
}
