import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/user.dart';
import '../repositories/auth_repository.dart';

class Register implements Usecase<User, RegisterParams> {
  Register(this.repository);
  final AuthRepository repository;

  @override
  Future<Either<Failure, User>> call(RegisterParams params) async {
    return await repository.register(params.name, params.email, params.password);
  }
}

class RegisterParams extends Equatable {
  const RegisterParams({
    required this.name,
    required this.email,
    required this.password,
  });
  final String name;
  final String email;
  final String password;

  @override
  List<Object> get props => [name, email, password];
}
