import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/todo.dart';
import '../repositories/todo_repository.dart';

class SaveTodos implements Usecase<NoParams, SaveTodosParams> {
  SaveTodos(this.repository);
  final TodoRepository repository;

  @override
  Future<Either<Failure, NoParams>> call(params) async {
    return await repository.saveTodos(params.todos);
  }
}

class SaveTodosParams extends Equatable {
  const SaveTodosParams(this.todos);
  final List<Todo> todos;

  @override
  List<Object?> get props => [todos];
}
