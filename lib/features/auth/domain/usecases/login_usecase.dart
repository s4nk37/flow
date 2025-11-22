import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/user.dart';
import '../repositories/auth_repository.dart';

class Login implements Usecase<User, LoginParams> {
  Login(this.repository);
  final AuthRepository repository;

  @override
  Future<Either<Failure, User>> call(LoginParams params) async {
    return await repository.login(params.email, params.password);
  }
}

class LoginParams extends Equatable {
  const LoginParams({required this.email, required this.password});
  final String email;
  final String password;

  @override
  List<Object> get props => [email, password];
}
