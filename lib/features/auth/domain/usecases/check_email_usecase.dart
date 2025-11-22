import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/auth_repository.dart';

class CheckEmail implements Usecase<bool, CheckEmailParams> {
  CheckEmail(this.repository);
  final AuthRepository repository;

  @override
  Future<Either<Failure, bool>> call(CheckEmailParams params) async {
    return await repository.checkEmail(params.email);
  }
}

class CheckEmailParams extends Equatable {
  const CheckEmailParams({required this.email});
  final String email;

  @override
  List<Object> get props => [email];
}
