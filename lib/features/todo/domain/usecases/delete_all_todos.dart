import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/todo_repository.dart';

class DeleteAllTodos implements Usecase<NoParams, NoParams> {
  final TodoRepository repository;

  DeleteAllTodos(this.repository);

  @override
  Future<Either<Failure, NoParams>> call(NoParams params) async {
    return await repository.deleteAllTodos();
  }
}
