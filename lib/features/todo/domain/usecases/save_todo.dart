import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/todo.dart';
import '../repositories/todo_repository.dart';

class SaveTodo implements Usecase<NoParams, SaveTodoParams> {
  SaveTodo(this.repository);
  final TodoRepository repository;

  @override
  Future<Either<Failure, NoParams>> call(params) async {
    return await repository.saveTodo(params.todo);
  }
}

class SaveTodoParams extends Equatable {
  const SaveTodoParams(this.todo);
  final Todo todo;

  @override
  List<Object?> get props => [todo];
}
