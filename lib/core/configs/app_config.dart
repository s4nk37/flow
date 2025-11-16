import 'package:logger/logger.dart';
import 'package:uuid/uuid.dart';

const String kAppName = 'Flow';
const String kAppFont = 'Source Code Pro';
const String kLocaleEnglish = 'en';
const String kLocaleGujarati = 'guIn';
const String kLocaleHindi = 'hiIn';

/// The key to store the app theme in the shared preferences
const String kThemeModeKey = 'app_theme';

/// The key to store the cached todos in the shared preferences
const String kCachedTodosKey = 'CACHED_TODOS';
var logger = Logger(printer: PrettyPrinter(methodCount: 0));

// Translations provider
// late Translations t;

///UUID

const uuid = Uuid();
