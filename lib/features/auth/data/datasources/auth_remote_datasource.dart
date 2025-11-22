import 'package:dio/dio.dart';
import '../../../../core/configs/app_config.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/network/api_endpoints.dart';
import '../models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> login(String email, String password);
  Future<UserModel> register(String name, String email, String password);
  Future<bool> checkEmail(String email);
  void setToken(String token);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  AuthRemoteDataSourceImpl({required this.dio});
  final Dio dio;

  @override
  void setToken(String token) {
    logger.d('Restoring token: $token');
    dio.options.headers['Authorization'] = 'Bearer $token';
  }

  @override
  Future<UserModel> login(String email, String password) async {
    try {
      // 1. Call Login to get tokens
      final response = await dio.post(
        ApiEndpoints.login,
        data: {'email': email, 'password': password},
      );

      if (response.statusCode == 200) {
        final responseData = response.data['data'];
        final accessToken = responseData['access_token'];
        final refreshToken = responseData['refresh_token'];
        
        // 2. Set token for subsequent requests
        dio.options.headers['Authorization'] = 'Bearer $accessToken';
        
        // 3. Call Get Current User to get profile details
        final userResponse = await dio.get(ApiEndpoints.getCurrentUser);
        
        if (userResponse.statusCode == 200) {
           // Combine profile data with tokens
           final userData = userResponse.data['data'];
           userData['access_token'] = accessToken;
           userData['refresh_token'] = refreshToken;
           
           return UserModel.fromJson(userData);
        } else {
          throw ServerException();
        }
      } else {
        throw ServerException();
      }
    } on DioException catch (e) {
      logger.e(e);
      if (e.response != null && e.response?.data != null) {
        final data = e.response?.data;
        if (data is Map<String, dynamic> && data.containsKey('message')) {
           throw ServerException(message: data['message']);
        }
      }
      throw ServerException();
    } on Exception catch(e) {
      logger.e(e);
      throw ServerException();
    }
  }

  @override
  Future<UserModel> register(String name, String email, String password) async {
    try {
      // 1. Register the user
      final response = await dio.post(
        ApiEndpoints.register,
        data: {'name': name, 'email': email, 'password': password},
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        // 2. Auto-login to get tokens
        return await login(email, password);
      } else {
        throw ServerException();
      }
    } on DioException catch (e) {
      logger.e(e);
      if (e.response != null && e.response?.data != null) {
        final data = e.response?.data;
        if (data is Map<String, dynamic> && data.containsKey('message')) {
           throw ServerException(message: data['message']);
        }
      }
      throw ServerException();
    } on Exception catch(e) {
      logger.e(e);
      throw ServerException();
    }
  }

  @override
  Future<bool> checkEmail(String email) async {
    try {
      final response = await dio.post(
        ApiEndpoints.checkEmail,
        data: {'email': email},
      );

      if (response.statusCode == 200) {
        return response.data['data']['exists'] as bool;
      } else {
        throw ServerException();
      }
    } on DioException catch (e) {
      logger.e(e);
      throw ServerException();
    } on Exception catch(e) {
      logger.e(e);
      throw ServerException();
    }
  }
}
