import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flow/core/errors/failures.dart';
import 'package:flow/core/usecases/usecase.dart';

import '../repositories/todo_repository.dart';

class MarkTodoAsCompleted
    implements Usecase<NoParams, MarkTodoAsCompletedParams> {
  final TodoRepository repository;

  MarkTodoAsCompleted(this.repository);

  @override
  Future<Either<Failure, NoParams>> call(
      MarkTodoAsCompletedParams params) async {
    return await repository.markTodoAsCompleted(params.id);
  }
}

class MarkTodoAsCompletedParams extends Equatable {
  final int id;

  const MarkTodoAsCompletedParams(this.id);

  @override
  List<Object?> get props => [id];
}
