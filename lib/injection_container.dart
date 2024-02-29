import 'package:dio/dio.dart';
import 'package:flow/core/utils/theme/cubit/theme_cubit.dart';
import 'package:flow/features/todo/data/datasources/todo_local_datasource.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/network/network_info.dart';
import 'core/utils/theme/app_theme.dart';
import 'features/todo/data/datasources/todo_remote_datasource.dart';
import 'features/todo/data/repositories/todo_repository_impl.dart';
import 'features/todo/domain/repositories/todo_repository.dart';
import 'features/todo/domain/usecases/save_todos.dart';
import 'features/todo/presentation/bloc/todo_bloc.dart';
import 'features/todo/domain/usecases/get_todos.dart' as usecase;

final sl = GetIt.instance;
Future<void> init() async {
  /// Features - Todos
  //Bloc
  sl.registerFactory(() => TodoBloc(getTodos: sl(), saveTodos: sl()));
  //Use cases
  sl.registerLazySingleton(() => usecase.GetTodos(sl()));
  sl.registerLazySingleton(() => SaveTodos(sl()));
  //Repository
  sl.registerLazySingleton<TodoRepository>(() => TodoRepositoryImpl(
        localDataSource: sl(),
        remoteDataSource: sl(),
        networkInfo: sl(),
      ));
  // Data sources
  sl.registerLazySingleton<TodoRemoteDataSource>(
      () => TodoRemoteDataSourceImpl(dio: sl()));
  sl.registerLazySingleton<TodoLocalDataSource>(
      () => TodoLocalDataSourceImpl(sharedPreferences: sl()));

  /// Core

  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
  // sl.registerFactory<ThemeCubit>(() => ThemeCubit());
  sl.registerSingleton(ThemeCubit());

  /// External
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
  sl.registerSingleton(sharedPreferences);
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => InternetConnectionChecker());
  await sl.registerSingleton(AppTheme.initialize(sl()));
}
