part of 'auth_cubit.dart';

enum AuthStatus {
  initial,
  loading,
  loaded,
}

@immutable
class AuthState {
  final AuthStatus _status;
  final bool? _isAuth;

  const AuthState({
    required AuthStatus status,
    bool? isAuth,
  })  : _status = status,
        _isAuth = isAuth;

  AuthStatus get status => _status;

  bool? get isAuth => _isAuth;

  AuthState copyWith({
    AuthStatus? status,
    bool? isAuth,
  }) {
    return AuthState(
      status: status ?? _status,
      isAuth: isAuth ?? _isAuth,
    );
  }
}
