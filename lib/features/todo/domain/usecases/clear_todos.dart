import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/todo_repository.dart';

class ClearTodos implements Usecase<NoParams, NoParams> {
  ClearTodos(this.repository);
  final TodoRepository repository;

  @override
  Future<Either<Failure, NoParams>> call(NoParams params) async {
    return await repository.clearTodos();
  }
}
