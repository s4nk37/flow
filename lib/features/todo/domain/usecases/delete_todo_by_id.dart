import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flow/core/errors/failures.dart';
import 'package:flow/core/usecases/usecase.dart';

import '../repositories/todo_repository.dart';

class DeleteTodoById implements Usecase<NoParams, DeleteTodoByIdParams> {
  final TodoRepository repository;

  DeleteTodoById(this.repository);

  @override
  Future<Either<Failure, NoParams>> call(DeleteTodoByIdParams params) async {
    return await repository.deleteTodoById(params.id);
  }
}

class DeleteTodoByIdParams extends Equatable {
  final int id;

  const DeleteTodoByIdParams(this.id);

  @override
  List<Object?> get props => [id];
}
