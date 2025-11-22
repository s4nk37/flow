part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthAuthenticated extends AuthState {
  const AuthAuthenticated({required this.user});
  final User user;

  @override
  List<Object> get props => [user];
}

class AuthUnauthenticated extends AuthState {}

class AuthError extends AuthState {
  const AuthError({required this.message});
  final String message;

  @override
  List<Object> get props => [message];
}

class AuthEmailChecked extends AuthState {
  const AuthEmailChecked({required this.exists, required this.email});
  final bool exists;
  final String email;

  @override
  List<Object> get props => [exists, email];
}
