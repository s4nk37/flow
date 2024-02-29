import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/todo.dart';
import '../repositories/todo_repository.dart';

class SaveTodos implements Usecase<NoParams, SaveTodosParams> {
  final TodoRepository repository;

  SaveTodos(this.repository);

  @override
  Future<Either<Failure, NoParams>> call(params) async {
    return await repository.saveTodos(params.todos);
  }
}

class SaveTodosParams extends Equatable {
  final List<Todo> todos;

  const SaveTodosParams(this.todos);

  @override
  List<Object?> get props => [todos];
}
