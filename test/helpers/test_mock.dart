import 'package:flow/core/network/network_info.dart';
import 'package:flow/features/todo/data/datasources/todo_local_datasource.dart';
import 'package:flow/features/todo/data/datasources/todo_remote_datasource.dart';
import 'package:flow/features/todo/domain/repositories/todo_repository.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mockito/annotations.dart';

@GenerateNiceMocks(
  [
    MockSpec<TodoRepository>(),
    MockSpec<TodoRemoteDataSource>(),
    MockSpec<TodoLocalDataSource>(),
    MockSpec<NetworkInfo>(),
    MockSpec<InternetConnectionChecker>(),
    MockSpec<SharedPreferences>(),
  ],
)
void main() {}
