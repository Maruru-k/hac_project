import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hac_project/reposutories/auth_reposytory.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository _authRepository;

  AuthCubit({
    required AuthRepository authRepository,
  })  : _authRepository = authRepository,
        super(const AuthState(
          status: AuthStatus.initial,
        ));

  Future<bool> isAuth() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final String? token = prefs.getString('auth_token');

    emit(state.copyWith(
      isAuth: token != null,
      status: token == null ? AuthStatus.loaded : null,
    ));
    return token != null;
  }

  Future<void> goToAuth() async {
    emit(state.copyWith(status: AuthStatus.loaded));
  }

  Future<void> login({
    required String username,
    required String password,
    bool isRegisteredUser = true,
  }) async {
    final String token;
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    emit(state.copyWith(status: AuthStatus.loading));
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
    emit(state.copyWith(status: AuthStatus.loaded));
    FlutterNativeSplash.remove();
  }

  Future<void> logout() async {
    emit(state.copyWith(status: AuthStatus.loading));
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.remove('auth_token');
    emit(state.copyWith(status: AuthStatus.loaded));
  }
}
