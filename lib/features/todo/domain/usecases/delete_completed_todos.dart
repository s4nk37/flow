import 'package:dartz/dartz.dart';
import 'package:flow/core/errors/failures.dart';
import 'package:flow/core/usecases/usecase.dart';

import '../repositories/todo_repository.dart';

class DeleteCompletedTodos implements Usecase<NoParams,NoParams>{ 
  final TodoRepository repository;

  DeleteCompletedTodos(this.repository);

  @override
  Future<Either<Failure, NoParams>> call(NoParams params) async{
    return await repository.deleteCompletedTodos();
  }

}