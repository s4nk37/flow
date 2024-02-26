import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/todo.dart';
import '../repositories/todo_repository.dart';

class AddTodo implements Usecase<NoParams, AddTodoParams> {
  final TodoRepository repository;

  AddTodo(this.repository);

  @override
  Future<Either<Failure, NoParams>> call(AddTodoParams params) async {
    return await repository.addTodo(params.todo);
  }
}

class AddTodoParams extends Equatable {
  final Todo todo;

  const AddTodoParams(this.todo);
  @override
  List<Object?> get props => [];
}
