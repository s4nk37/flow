/// Generated file. Do not edit.
///
/// Original: assets/translations/i18n
/// To regenerate, run: `dart run slang`
///
/// Locales: 2
/// Strings: 130 (65 per locale)
///
/// Built on 2024-03-03 at 21:06 UTC

// coverage:ignore-file
// ignore_for_file: type=lint

import 'package:flutter/widgets.dart';
import 'package:slang/builder/model/node.dart';
import 'package:slang_flutter/slang_flutter.dart';
export 'package:slang_flutter/slang_flutter.dart';

const AppLocale _baseLocale = AppLocale.en;

/// Supported locales, see extension methods below.
///
/// Usage:
/// - LocaleSettings.setLocale(AppLocale.en) // set locale
/// - Locale locale = AppLocale.en.flutterLocale // get flutter locale from enum
/// - if (LocaleSettings.currentLocale == AppLocale.en) // locale check
enum AppLocale with BaseAppLocale<AppLocale, Translations> {
	en(languageCode: 'en', build: Translations.build),
	guIn(languageCode: 'gu', countryCode: 'IN', build: _StringsGuIn.build);

	const AppLocale({required this.languageCode, this.scriptCode, this.countryCode, required this.build}); // ignore: unused_element

	@override final String languageCode;
	@override final String? scriptCode;
	@override final String? countryCode;
	@override final TranslationBuilder<AppLocale, Translations> build;

	/// Gets current instance managed by [LocaleSettings].
	Translations get translations => LocaleSettings.instance.translationMap[this]!;
}

/// Method A: Simple
///
/// No rebuild after locale change.
/// Translation happens during initialization of the widget (call of t).
/// Configurable via 'translate_var'.
///
/// Usage:
/// String a = t.someKey.anotherKey;
/// String b = t['someKey.anotherKey']; // Only for edge cases!
Translations get t => LocaleSettings.instance.currentTranslations;

/// Method B: Advanced
///
/// All widgets using this method will trigger a rebuild when locale changes.
/// Use this if you have e.g. a settings page where the user can select the locale during runtime.
///
/// Step 1:
/// wrap your App with
/// TranslationProvider(
/// 	child: MyApp()
/// );
///
/// Step 2:
/// final t = Translations.of(context); // Get t variable.
/// String a = t.someKey.anotherKey; // Use t variable.
/// String b = t['someKey.anotherKey']; // Only for edge cases!
class TranslationProvider extends BaseTranslationProvider<AppLocale, Translations> {
	TranslationProvider({required super.child}) : super(settings: LocaleSettings.instance);

	static InheritedLocaleData<AppLocale, Translations> of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context);
}

/// Method B shorthand via [BuildContext] extension method.
/// Configurable via 'translate_var'.
///
/// Usage (e.g. in a widget's build method):
/// context.t.someKey.anotherKey
extension BuildContextTranslationsExtension on BuildContext {
	Translations get t => TranslationProvider.of(this).translations;
}

/// Manages all translation instances and the current locale
class LocaleSettings extends BaseFlutterLocaleSettings<AppLocale, Translations> {
	LocaleSettings._() : super(utils: AppLocaleUtils.instance);

	static final instance = LocaleSettings._();

	// static aliases (checkout base methods for documentation)
	static AppLocale get currentLocale => instance.currentLocale;
	static Stream<AppLocale> getLocaleStream() => instance.getLocaleStream();
	static AppLocale setLocale(AppLocale locale, {bool? listenToDeviceLocale = false}) => instance.setLocale(locale, listenToDeviceLocale: listenToDeviceLocale);
	static AppLocale setLocaleRaw(String rawLocale, {bool? listenToDeviceLocale = false}) => instance.setLocaleRaw(rawLocale, listenToDeviceLocale: listenToDeviceLocale);
	static AppLocale useDeviceLocale() => instance.useDeviceLocale();
	@Deprecated('Use [AppLocaleUtils.supportedLocales]') static List<Locale> get supportedLocales => instance.supportedLocales;
	@Deprecated('Use [AppLocaleUtils.supportedLocalesRaw]') static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
	static void setPluralResolver({String? language, AppLocale? locale, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver}) => instance.setPluralResolver(
		language: language,
		locale: locale,
		cardinalResolver: cardinalResolver,
		ordinalResolver: ordinalResolver,
	);
}

/// Provides utility functions without any side effects.
class AppLocaleUtils extends BaseAppLocaleUtils<AppLocale, Translations> {
	AppLocaleUtils._() : super(baseLocale: _baseLocale, locales: AppLocale.values);

	static final instance = AppLocaleUtils._();

	// static aliases (checkout base methods for documentation)
	static AppLocale parse(String rawLocale) => instance.parse(rawLocale);
	static AppLocale parseLocaleParts({required String languageCode, String? scriptCode, String? countryCode}) => instance.parseLocaleParts(languageCode: languageCode, scriptCode: scriptCode, countryCode: countryCode);
	static AppLocale findDeviceLocale() => instance.findDeviceLocale();
	static List<Locale> get supportedLocales => instance.supportedLocales;
	static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
}

// translations

// Path: <root>
class Translations implements BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	// Translations
	String get tasks => 'Tasks';
	String get add_task => 'Add task';
	String get edit_task => 'Edit task';
	String get task_name => 'Task name';
	String get description => 'Description';
	String get status => 'Status';
	String get created_at => 'Created at';
	String get updated_at => 'Updated at';
	String get actions => 'Actions';
	String get edit => 'Edit';
	String get delete => 'Delete';
	String get Language => 'Language';
	String get english => 'English';
	String get reminder => 'Reminder';
	String get cancel => 'Cancel';
	String get ok => 'Ok';
	String get theme => 'Theme';
	String get light => 'Light';
	String get dark => 'Dark';
	String get save => 'Save';
	String get no_tasks => 'No tasks yet';
	String get no_internet => 'No internet connection';
	String get please_enter_task_name => 'Please enter task name';
	String get unknown_error => 'Unknown error';
	String get delete_task => 'Delete task';
	String get delete_task_confirm => 'Are you sure you want to delete this task?';
	String get delete_task_success => 'Task deleted successfully';
	String get delete_task_fail => 'Task deleted failed';
	String get add_task_success => 'Task added successfully';
	String get add_task_fail => 'Task added failed';
	String get edit_task_success => 'Task edited successfully';
	String get edit_task_fail => 'Task edited failed';
	String get logout => 'Logout';
	String get email => 'Email';
	String get password => 'Password';
	String get login_fail => 'Login failed';
	String get login_success => 'Logged in successfully';
	String get register => 'Register';
	String get register_fail => 'Register failed';
	String get register_success => 'Registered successfully';
	String get email_required => 'Email is required';
	String get password_required => 'Password is required';
	String get email_invalid => 'Email is invalid';
	String get password_invalid => 'Password is invalid';
	String get email_exists => 'Email already exists';
	String get email_not_exists => 'Email not exists';
	String get password_incorrect => 'Password is incorrect';
	String get password_length => 'Password must be at least 6 characters';
	String get check_your_internet => 'Check your internet connection';
	String get email_not_found => 'Email not found';
	String get reset_password => 'Reset password';
	String get reset_password_success => 'Reset password email sent successfully';
	String get reset_password_fail => 'Reset password email sent failed';
	String get reset_password_email => 'Reset password email';
	String get reset_password_email_sent => 'Reset password email sent';
	String get reset_password_email_sent_description => 'We have sent an email to reset your password';
	String get reset_password_email_sent_description2 => 'Please check your email';
	late final _StringsLoginEn login = _StringsLoginEn._(_root);
	String get settings => 'Settings';
	String get change_language => 'Change language';
	String get change_theme => 'Change theme';
	String get English => 'English';
	String get Gujarati => 'ગુજરાતી';
}

// Path: login
class _StringsLoginEn {
	_StringsLoginEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get success => 'Logged in successfully';
	String get fail => 'Logged in failed';
	String get login => 'Login';
}

// Path: <root>
class _StringsGuIn implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsGuIn.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.guIn,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <gu-IN>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	@override late final _StringsGuIn _root = this; // ignore: unused_field

	// Translations
	@override String get tasks => 'કાર્યો';
	@override String get add_task => 'કાર્ય ઉમેરો';
	@override String get edit_task => 'કાર્ય સંપાદિત કરો';
	@override String get task_name => 'કાર્યનું નામ';
	@override String get description => 'વર્ણન';
	@override String get status => 'સ્થિતિ';
	@override String get created_at => 'બનાવવામાં આવેલ';
	@override String get updated_at => 'અપડેટ કરવામાં આવેલ';
	@override String get actions => 'ક્રિયાઓ';
	@override String get edit => 'સંપાદિત કરો';
	@override String get delete => 'કાઢી નાંખો';
	@override String get Language => 'ભાષા';
	@override String get english => 'અંગ્રેજી';
	@override String get reminder => 'અનુસ્મરણ';
	@override String get cancel => 'રદ કરો';
	@override String get ok => 'ઠીક છે';
	@override String get theme => 'થીમ';
	@override String get light => 'પ્રકાશ';
	@override String get dark => 'અંધકાર';
	@override String get save => 'સાચવો';
	@override String get no_tasks => 'હજી સુધી કોઈ કાર્યો નથી';
	@override String get unknown_error => 'અજ્ઞાત ભૂલ';
	@override String get no_internet => 'કોઈ ઇન્ટરનેટ કનેક્શન નથી';
	@override String get please_enter_task_name => 'કૃપા કરીને કાર્યનું નામ દાખલ કરો';
	@override String get delete_task => 'કાર્ય કાઢી નાખો';
	@override String get delete_task_confirm => 'શું તમે આ કાર્યને કાઢી નાખવા માંગો છો?';
	@override String get delete_task_success => 'કાર્ય સફળતાપૂર્વક કાઢી નાખવામાં આવ્યું';
	@override String get delete_task_fail => 'કાર્ય કાઢી નાખવામાં નિષ્ફળ';
	@override String get add_task_success => 'કાર્ય સફળતાપૂર્વક ઉમેરવામાં આવ્યું';
	@override String get add_task_fail => 'કાર્ય ઉમેરવામાં નિષ્ફળ';
	@override String get edit_task_success => 'કાર્ય સફળતાપૂર્વક સંપાદિત થયું';
	@override String get edit_task_fail => 'કાર્ય સંપાદિત કરવામાં નિષ્ફળ';
	@override String get logout => 'લૉગ આઉટ';
	@override String get email => 'ઇમેઇલ';
	@override String get password => 'પાસવર્ડ';
	@override String get login_fail => 'લૉગિન નિષ્ફળ';
	@override String get login_success => 'સફળતાપૂર્વક પ્રવેશ કર્યો';
	@override String get register => 'નોંધણી કરો';
	@override String get register_fail => 'નોંધણી નિષ્ફળ';
	@override String get register_success => 'સફળતાપૂર્વક નોંધણી કરાઈ';
	@override String get email_required => 'ઇમેઇલ જરૂરી છે';
	@override String get password_required => 'પાસવર્ડ જરૂરી છે';
	@override String get email_invalid => 'ઇમેઇલ અમાન્ય છે';
	@override String get password_invalid => 'પાસવર્ડ અમાન્ય છે';
	@override String get email_exists => 'ઇમેઇલ પહેલેથી અસ્તિત્વમાં છે';
	@override String get email_not_exists => 'ઇમેઇલ અસ્તિત્વમાં નથી';
	@override String get password_incorrect => 'પાસવર્ડ ખોટો છે';
	@override String get password_length => 'પાસવર્ડ ઓછામાં ઓછા 6 અક્ષરોનો હોવો જોઈએ';
	@override String get check_your_internet => 'તમારા ઇન્ટરનેટ કનેક્શનને તપાસો';
	@override String get email_not_found => 'ઇમેઇલ મળ્યો નથી';
	@override String get reset_password => 'પાસવર્ડ રીસેટ કરો';
	@override String get reset_password_success => 'પાસવર્ડ રીસેટ ઇમેઇલ સફળતાપૂર્વક મોકલવામાં આવ્યો';
	@override String get reset_password_fail => 'પાસવર્ડ રીસેટ ઇમેઇલ મોકલવામાં નિષ્ફળ';
	@override String get reset_password_email => 'પાસવર્ડ રીસેટ ઇમેઇલ';
	@override String get reset_password_email_sent => 'પાસવર્ડ રીસેટ ઇમેઇલ મોકલવામાં આવ્યો';
	@override String get reset_password_email_sent_description => 'અમે તમારો પાસવર્ડ રીસેટ કરવા માટે ઇમેઇલ મોકલ્યો છે';
	@override String get reset_password_email_sent_description2 => 'કૃપા કરીને તમારું ઇમેઇલ તપાસો';
	@override late final _StringsLoginGuIn login = _StringsLoginGuIn._(_root);
	@override String get settings => 'સેટિંગ્સ';
	@override String get change_language => 'ભાષા બદલો';
	@override String get change_theme => 'થીમ બદલો';
	@override String get English => 'English';
	@override String get Gujarati => 'ગુજરાતી';
}

// Path: login
class _StringsLoginGuIn implements _StringsLoginEn {
	_StringsLoginGuIn._(this._root);

	@override final _StringsGuIn _root; // ignore: unused_field

	// Translations
	@override String get success => 'સફળતાપૂર્વક પ્રવેશ કર્યો';
	@override String get fail => 'લૉગિન નિષ્ફળ';
	@override String get login => 'લૉગિન';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.

extension on Translations {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'tasks': return 'Tasks';
			case 'add_task': return 'Add task';
			case 'edit_task': return 'Edit task';
			case 'task_name': return 'Task name';
			case 'description': return 'Description';
			case 'status': return 'Status';
			case 'created_at': return 'Created at';
			case 'updated_at': return 'Updated at';
			case 'actions': return 'Actions';
			case 'edit': return 'Edit';
			case 'delete': return 'Delete';
			case 'Language': return 'Language';
			case 'english': return 'English';
			case 'reminder': return 'Reminder';
			case 'cancel': return 'Cancel';
			case 'ok': return 'Ok';
			case 'theme': return 'Theme';
			case 'light': return 'Light';
			case 'dark': return 'Dark';
			case 'save': return 'Save';
			case 'no_tasks': return 'No tasks yet';
			case 'no_internet': return 'No internet connection';
			case 'please_enter_task_name': return 'Please enter task name';
			case 'unknown_error': return 'Unknown error';
			case 'delete_task': return 'Delete task';
			case 'delete_task_confirm': return 'Are you sure you want to delete this task?';
			case 'delete_task_success': return 'Task deleted successfully';
			case 'delete_task_fail': return 'Task deleted failed';
			case 'add_task_success': return 'Task added successfully';
			case 'add_task_fail': return 'Task added failed';
			case 'edit_task_success': return 'Task edited successfully';
			case 'edit_task_fail': return 'Task edited failed';
			case 'logout': return 'Logout';
			case 'email': return 'Email';
			case 'password': return 'Password';
			case 'login_fail': return 'Login failed';
			case 'login_success': return 'Logged in successfully';
			case 'register': return 'Register';
			case 'register_fail': return 'Register failed';
			case 'register_success': return 'Registered successfully';
			case 'email_required': return 'Email is required';
			case 'password_required': return 'Password is required';
			case 'email_invalid': return 'Email is invalid';
			case 'password_invalid': return 'Password is invalid';
			case 'email_exists': return 'Email already exists';
			case 'email_not_exists': return 'Email not exists';
			case 'password_incorrect': return 'Password is incorrect';
			case 'password_length': return 'Password must be at least 6 characters';
			case 'check_your_internet': return 'Check your internet connection';
			case 'email_not_found': return 'Email not found';
			case 'reset_password': return 'Reset password';
			case 'reset_password_success': return 'Reset password email sent successfully';
			case 'reset_password_fail': return 'Reset password email sent failed';
			case 'reset_password_email': return 'Reset password email';
			case 'reset_password_email_sent': return 'Reset password email sent';
			case 'reset_password_email_sent_description': return 'We have sent an email to reset your password';
			case 'reset_password_email_sent_description2': return 'Please check your email';
			case 'login.success': return 'Logged in successfully';
			case 'login.fail': return 'Logged in failed';
			case 'login.login': return 'Login';
			case 'settings': return 'Settings';
			case 'change_language': return 'Change language';
			case 'change_theme': return 'Change theme';
			case 'English': return 'English';
			case 'Gujarati': return 'ગુજરાતી';
			default: return null;
		}
	}
}

extension on _StringsGuIn {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'tasks': return 'કાર્યો';
			case 'add_task': return 'કાર્ય ઉમેરો';
			case 'edit_task': return 'કાર્ય સંપાદિત કરો';
			case 'task_name': return 'કાર્યનું નામ';
			case 'description': return 'વર્ણન';
			case 'status': return 'સ્થિતિ';
			case 'created_at': return 'બનાવવામાં આવેલ';
			case 'updated_at': return 'અપડેટ કરવામાં આવેલ';
			case 'actions': return 'ક્રિયાઓ';
			case 'edit': return 'સંપાદિત કરો';
			case 'delete': return 'કાઢી નાંખો';
			case 'Language': return 'ભાષા';
			case 'english': return 'અંગ્રેજી';
			case 'reminder': return 'અનુસ્મરણ';
			case 'cancel': return 'રદ કરો';
			case 'ok': return 'ઠીક છે';
			case 'theme': return 'થીમ';
			case 'light': return 'પ્રકાશ';
			case 'dark': return 'અંધકાર';
			case 'save': return 'સાચવો';
			case 'no_tasks': return 'હજી સુધી કોઈ કાર્યો નથી';
			case 'unknown_error': return 'અજ્ઞાત ભૂલ';
			case 'no_internet': return 'કોઈ ઇન્ટરનેટ કનેક્શન નથી';
			case 'please_enter_task_name': return 'કૃપા કરીને કાર્યનું નામ દાખલ કરો';
			case 'delete_task': return 'કાર્ય કાઢી નાખો';
			case 'delete_task_confirm': return 'શું તમે આ કાર્યને કાઢી નાખવા માંગો છો?';
			case 'delete_task_success': return 'કાર્ય સફળતાપૂર્વક કાઢી નાખવામાં આવ્યું';
			case 'delete_task_fail': return 'કાર્ય કાઢી નાખવામાં નિષ્ફળ';
			case 'add_task_success': return 'કાર્ય સફળતાપૂર્વક ઉમેરવામાં આવ્યું';
			case 'add_task_fail': return 'કાર્ય ઉમેરવામાં નિષ્ફળ';
			case 'edit_task_success': return 'કાર્ય સફળતાપૂર્વક સંપાદિત થયું';
			case 'edit_task_fail': return 'કાર્ય સંપાદિત કરવામાં નિષ્ફળ';
			case 'logout': return 'લૉગ આઉટ';
			case 'email': return 'ઇમેઇલ';
			case 'password': return 'પાસવર્ડ';
			case 'login_fail': return 'લૉગિન નિષ્ફળ';
			case 'login_success': return 'સફળતાપૂર્વક પ્રવેશ કર્યો';
			case 'register': return 'નોંધણી કરો';
			case 'register_fail': return 'નોંધણી નિષ્ફળ';
			case 'register_success': return 'સફળતાપૂર્વક નોંધણી કરાઈ';
			case 'email_required': return 'ઇમેઇલ જરૂરી છે';
			case 'password_required': return 'પાસવર્ડ જરૂરી છે';
			case 'email_invalid': return 'ઇમેઇલ અમાન્ય છે';
			case 'password_invalid': return 'પાસવર્ડ અમાન્ય છે';
			case 'email_exists': return 'ઇમેઇલ પહેલેથી અસ્તિત્વમાં છે';
			case 'email_not_exists': return 'ઇમેઇલ અસ્તિત્વમાં નથી';
			case 'password_incorrect': return 'પાસવર્ડ ખોટો છે';
			case 'password_length': return 'પાસવર્ડ ઓછામાં ઓછા 6 અક્ષરોનો હોવો જોઈએ';
			case 'check_your_internet': return 'તમારા ઇન્ટરનેટ કનેક્શનને તપાસો';
			case 'email_not_found': return 'ઇમેઇલ મળ્યો નથી';
			case 'reset_password': return 'પાસવર્ડ રીસેટ કરો';
			case 'reset_password_success': return 'પાસવર્ડ રીસેટ ઇમેઇલ સફળતાપૂર્વક મોકલવામાં આવ્યો';
			case 'reset_password_fail': return 'પાસવર્ડ રીસેટ ઇમેઇલ મોકલવામાં નિષ્ફળ';
			case 'reset_password_email': return 'પાસવર્ડ રીસેટ ઇમેઇલ';
			case 'reset_password_email_sent': return 'પાસવર્ડ રીસેટ ઇમેઇલ મોકલવામાં આવ્યો';
			case 'reset_password_email_sent_description': return 'અમે તમારો પાસવર્ડ રીસેટ કરવા માટે ઇમેઇલ મોકલ્યો છે';
			case 'reset_password_email_sent_description2': return 'કૃપા કરીને તમારું ઇમેઇલ તપાસો';
			case 'login.success': return 'સફળતાપૂર્વક પ્રવેશ કર્યો';
			case 'login.fail': return 'લૉગિન નિષ્ફળ';
			case 'login.login': return 'લૉગિન';
			case 'settings': return 'સેટિંગ્સ';
			case 'change_language': return 'ભાષા બદલો';
			case 'change_theme': return 'થીમ બદલો';
			case 'English': return 'English';
			case 'Gujarati': return 'ગુજરાતી';
			default: return null;
		}
	}
}
