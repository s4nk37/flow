import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:logger/logger.dart';
import 'package:uuid/uuid.dart';

// Application Configuration

abstract class AppConfig {
  static String get baseUrl {
    // Returns the value of BASE_URL from the loaded .env file
    return dotenv.env['API_BASE_URL'] ?? 'http://192.168.31.203:8000';
  }
}

const String kAppName = 'Flow';
const String kAppFont = 'Source Code Pro';
const String kLocaleEnglish = 'en';
const String kLocaleGujarati = 'guIn';
const String kLocaleHindi = 'hiIn';

/// The key to store the app theme in the shared preferences
const String kThemeModeKey = 'app_theme';

/// The key to store the cached todos in the shared preferences
const String kCachedTodosKey = 'CACHED_TODOS';
const String kPendingTodosKey = 'PENDING_TODOS';
var logger = Logger(printer: PrettyPrinter(methodCount: 0));

// Translations provider
// late Translations t;

///UUID

const uuid = Uuid();




