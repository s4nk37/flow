import 'package:logger/logger.dart';

const String kAppName = 'Flow';
const String kAppFont = 'Source Code Pro';

/// The key to store the app theme in the shared preferences
const String kThemeModeKey = "app_theme";

/// The key to store the cached todos in the shared preferences
const String kCachedTodosKey = "CACHED_TODOS";
var logger = Logger(
  printer: PrettyPrinter(
    methodCount: 0,
  ),
);
