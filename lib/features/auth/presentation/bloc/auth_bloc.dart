import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/usecases/usecase.dart';
import '../../domain/entities/user.dart';
import '../../domain/usecases/check_email_usecase.dart';
import '../../domain/usecases/get_current_user_usecase.dart';
import '../../domain/usecases/login_usecase.dart';
import '../../domain/usecases/logout_usecase.dart';
import '../../domain/usecases/register_usecase.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({
    required this.login,
    required this.register,
    required this.checkEmail,
    required this.logout,
    required this.getCurrentUser,
  }) : super(AuthInitial()) {
    on<AuthCheckRequested>(_onAuthCheckRequested);
    on<AuthLogin>(_onAuthLogin);
    on<AuthRegister>(_onAuthRegister);
    on<AuthCheckEmail>(_onAuthCheckEmail);
    on<AuthLogout>(_onAuthLogout);
  }

  final Login login;
  final Register register;
  final CheckEmail checkEmail;
  final Logout logout;
  final GetCurrentUser getCurrentUser;

  Future<void> _onAuthCheckRequested(
    AuthCheckRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    final result = await getCurrentUser(NoParams());
    result.fold(
      (failure) => emit(AuthUnauthenticated()),
      (user) => emit(AuthAuthenticated(user: user)),
    );
  }

  Future<void> _onAuthLogin(AuthLogin event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final result = await login(event.params);
    result.fold(
      (failure) => emit(AuthError(message: failure.toString())),
      (user) => emit(AuthAuthenticated(user: user)),
    );
  }

  Future<void> _onAuthRegister(
    AuthRegister event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    final result = await register(event.params);
    result.fold(
      (failure) => emit(AuthError(message: failure.toString())),
      (user) => emit(AuthAuthenticated(user: user)),
    );
  }

  Future<void> _onAuthLogout(AuthLogout event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    await logout(NoParams());
    emit(AuthUnauthenticated());
  }

  Future<void> _onAuthCheckEmail(
    AuthCheckEmail event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    final result = await checkEmail(CheckEmailParams(email: event.email));
    result.fold(
      (failure) => emit(AuthError(message: failure.toString())),
      (exists) => emit(AuthEmailChecked(exists: exists, email: event.email)),
    );
  }
}
