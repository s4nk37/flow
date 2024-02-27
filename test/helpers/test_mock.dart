import 'package:flow/core/network/network_info.dart';
import 'package:flow/features/todo/data/datasources/todo_local_datasource.dart';
import 'package:flow/features/todo/data/datasources/todo_remote_datasource.dart';
import 'package:flow/features/todo/domain/repositories/todo_repository.dart';
import 'package:mockito/annotations.dart';

@GenerateNiceMocks(
  [
    MockSpec<TodoRepository>(),
    MockSpec<TodoRemoteDataSource>(),
    MockSpec<TodoLocalDataSource>(),
    MockSpec<NetworkInfo>(),
  ],
)
void main() {}
