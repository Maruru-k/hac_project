import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hac_project/block/auth_cubit.dart';

part 'registration_state.dart';

class RegistrationCubit extends Cubit<RegistrationState> {
  final AuthCubit _authCubit;

  RegistrationCubit({
    required AuthCubit authCubit,
  })  : _authCubit = authCubit,
        super(
          RegistrationState(
            username: TextEditingController(),
            password: TextEditingController(),
          ),
        );

  void register({
    required String username,
    required String password,
  }) {
    _authCubit.login(
      username: username,
      password: password,
      isRegisteredUser: false,
    );
  }
}
