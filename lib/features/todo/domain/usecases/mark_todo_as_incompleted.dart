import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flow/core/errors/failures.dart';
import 'package:flow/core/usecases/usecase.dart';

import '../repositories/todo_repository.dart';

class MarkTodoAsIncompleted
    implements Usecase<NoParams, MarkTodoAsIncompletedParams> {
  final TodoRepository repository;

  MarkTodoAsIncompleted(this.repository);

  @override
  Future<Either<Failure, NoParams>> call(
      MarkTodoAsIncompletedParams params) async {
    return await repository.markTodoAsIncompleted(params.id);
  }
}

class MarkTodoAsIncompletedParams extends Equatable {
  final int id;

  const MarkTodoAsIncompletedParams(this.id);

  @override
  List<Object?> get props => [id];
}
