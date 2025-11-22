abstract class ApiEndpoints {
  /// API Endpoints
  static String get todos => '/todos';
  static String get settings => '/settings';
  static String get auth => '/auth';
  static String get login => '$auth/login';
  static String get register => '$auth/register';
  static String get checkEmail => '$auth/check-email';
  static String get logout => '$auth/logout';
  static String get users => '/users';
  static String get getCurrentUser => '$users/me';
}
