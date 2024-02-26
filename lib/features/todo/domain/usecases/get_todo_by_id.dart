import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flow/core/errors/failures.dart';
import 'package:flow/core/usecases/usecase.dart';
import 'package:flow/features/todo/domain/repositories/todo_repository.dart';

import '../entities/todo.dart';

class GetTodoById implements Usecase<Todo, GetTodoByIdParams> {
  final TodoRepository repository;

  GetTodoById(this.repository);

  @override
  Future<Either<Failure, Todo>> call(GetTodoByIdParams params) async {
    return await repository.getTodoById(params.id);
  }
}

class GetTodoByIdParams extends Equatable {
  final int id;

  const GetTodoByIdParams(this.id);

  @override
  List<Object?> get props => [id];
}
