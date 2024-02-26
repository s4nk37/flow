import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flow/core/errors/failures.dart';
import 'package:flow/core/usecases/usecase.dart';
import 'package:flow/features/todo/domain/repositories/todo_repository.dart';

import '../entities/todo.dart';

class UpdateTodo implements Usecase<NoParams, UpdateTodoParams> {
  final TodoRepository repository;

  UpdateTodo(this.repository);

  @override
  Future<Either<Failure, NoParams>> call(UpdateTodoParams params) async {
    return await repository.updateTodo(params.todo);
  }
}

class UpdateTodoParams extends Equatable {
  final Todo todo;

  const UpdateTodoParams(this.todo);
  @override
  List<Object?> get props => [todo];
}
