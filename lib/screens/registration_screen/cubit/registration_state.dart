part of 'registration_cubit.dart';

@immutable
class RegistrationState {
  final TextEditingController _username;
  final TextEditingController _password;

  const RegistrationState({
    required TextEditingController username,
    required TextEditingController password,
  })  : _username = username,
        _password = password;

  TextEditingController get username => _username;

  TextEditingController get password => _password;

  RegistrationState copyWith({
    TextEditingController? username,
    TextEditingController? password,
  }) {
    return RegistrationState(
      username: username ?? _username,
      password: password ?? _password,
    );
  }
}
