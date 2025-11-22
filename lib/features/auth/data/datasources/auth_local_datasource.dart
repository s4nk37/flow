import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/errors/exceptions.dart';
import '../models/user_model.dart';

const String kCachedUserKey = 'CACHED_USER';

abstract class AuthLocalDataSource {
  Future<void> cacheUser(UserModel user);
  Future<UserModel> getLastUser();
  Future<void> clearUser();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  AuthLocalDataSourceImpl({required this.sharedPreferences});
  final SharedPreferences sharedPreferences;

  @override
  Future<void> cacheUser(UserModel user) {
    return sharedPreferences.setString(
      kCachedUserKey,
      jsonEncode(user.toJson()),
    );
  }

  @override
  Future<UserModel> getLastUser() {
    final jsonString = sharedPreferences.getString(kCachedUserKey);
    if (jsonString != null) {
      return Future.value(UserModel.fromJson(jsonDecode(jsonString)));
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> clearUser() {
    return sharedPreferences.remove(kCachedUserKey);
  }
}
