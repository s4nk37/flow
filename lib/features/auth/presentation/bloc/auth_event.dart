part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthLogin extends AuthEvent {
  const AuthLogin({required this.params});
  final LoginParams params;

  @override
  List<Object> get props => [params];
}

class AuthRegister extends AuthEvent {
  const AuthRegister({required this.params});
  final RegisterParams params;

  @override
  List<Object> get props => [params];
}

class AuthLogout extends AuthEvent {}

class AuthCheckRequested extends AuthEvent {}

class AuthCheckEmail extends AuthEvent {
  const AuthCheckEmail({required this.email});
  final String email;

  @override
  List<Object> get props => [email];
}
