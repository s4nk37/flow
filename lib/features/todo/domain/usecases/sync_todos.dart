import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/todo.dart';
import '../repositories/todo_repository.dart';

class SyncTodos implements Usecase<List<Todo>, NoParams> {
  SyncTodos(this.repository);
  final TodoRepository repository;

  @override
  Future<Either<Failure, List<Todo>>> call(NoParams params) async {
    return await repository.syncTodos();
  }
}
