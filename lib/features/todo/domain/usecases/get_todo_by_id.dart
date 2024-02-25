import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flow/core/errors/failures.dart';
import 'package:flow/core/usecases/usecase.dart';
import 'package:flow/features/todo/domain/repositories/todo_repository.dart';

import '../entities/todo.dart';

class GetTodoById implements Usecase<Todo, Params> {
  final TodoRepository repository;

  GetTodoById(this.repository);

  @override
  Future<Either<Failure, Todo>> call(Params params) async {
    return await repository.getTodoById(params.id);
  }
}

class Params extends Equatable {
  final int id;

  const Params(this.id);

  @override
  List<Object?> get props => [id];
}
