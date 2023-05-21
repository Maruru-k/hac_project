part of 'login_cubit.dart';

@immutable
class LoginState {
  final TextEditingController _username;
  final TextEditingController _password;

  const LoginState({
    required TextEditingController username,
    required TextEditingController password,
  })  : _username = username,
        _password = password;

  TextEditingController get username => _username;

  TextEditingController get password => _password;

  LoginState copyWith({
    TextEditingController? username,
    TextEditingController? password,
  }) {
    return LoginState(
      username: username ?? _username,
      password: password ?? _password,
    );
  }
}
