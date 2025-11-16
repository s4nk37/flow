///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:slang/generated.dart';
import 'strings.g.dart';

// Path: <root>
class TranslationsGuIn implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsGuIn({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
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

	late final TranslationsGuIn _root = this; // ignore: unused_field

	@override 
	TranslationsGuIn $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsGuIn(meta: meta ?? this.$meta);

	// Translations
	@override String get tasks => 'કાર્યો';
	@override String get add_task => 'કાર્ય ઉમેરો';
	@override String get update_task => 'કાર્ય અપડેટ કરો';
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
	@override late final _TranslationsLoginGuIn login = _TranslationsLoginGuIn._(_root);
	@override String get settings => 'સેટિંગ્સ';
	@override String get change_language => 'ભાષા બદલો';
	@override String get change_theme => 'થીમ બદલો';
	@override String get English => 'English';
	@override String get Gujarati => 'ગુજરાતી';
	@override String get Hindi => 'हिंदी';
}

// Path: login
class _TranslationsLoginGuIn implements TranslationsLoginEn {
	_TranslationsLoginGuIn._(this._root);

	final TranslationsGuIn _root; // ignore: unused_field

	// Translations
	@override String get success => 'સફળતાપૂર્વક પ્રવેશ કર્યો';
	@override String get fail => 'લૉગિન નિષ્ફળ';
	@override String get login => 'લૉગિન';
}

/// The flat map containing all translations for locale <gu-IN>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsGuIn {
	dynamic _flatMapFunction(String path) {
		return _flatMapFunction$0(path);
	}

	dynamic _flatMapFunction$0(String path) {
		return switch (path) {
			'tasks' => 'કાર્યો',
			'add_task' => 'કાર્ય ઉમેરો',
			'update_task' => 'કાર્ય અપડેટ કરો',
			'task_name' => 'કાર્યનું નામ',
			'description' => 'વર્ણન',
			'status' => 'સ્થિતિ',
			'created_at' => 'બનાવવામાં આવેલ',
			'updated_at' => 'અપડેટ કરવામાં આવેલ',
			'actions' => 'ક્રિયાઓ',
			'edit' => 'સંપાદિત કરો',
			'delete' => 'કાઢી નાંખો',
			'Language' => 'ભાષા',
			'english' => 'અંગ્રેજી',
			'reminder' => 'અનુસ્મરણ',
			'cancel' => 'રદ કરો',
			'ok' => 'ઠીક છે',
			'theme' => 'થીમ',
			'light' => 'પ્રકાશ',
			'dark' => 'અંધકાર',
			'save' => 'સાચવો',
			'no_tasks' => 'હજી સુધી કોઈ કાર્યો નથી',
			'unknown_error' => 'અજ્ઞાત ભૂલ',
			'no_internet' => 'કોઈ ઇન્ટરનેટ કનેક્શન નથી',
			'please_enter_task_name' => 'કૃપા કરીને કાર્યનું નામ દાખલ કરો',
			'delete_task' => 'કાર્ય કાઢી નાખો',
			'delete_task_confirm' => 'શું તમે આ કાર્યને કાઢી નાખવા માંગો છો?',
			'delete_task_success' => 'કાર્ય સફળતાપૂર્વક કાઢી નાખવામાં આવ્યું',
			'delete_task_fail' => 'કાર્ય કાઢી નાખવામાં નિષ્ફળ',
			'add_task_success' => 'કાર્ય સફળતાપૂર્વક ઉમેરવામાં આવ્યું',
			'add_task_fail' => 'કાર્ય ઉમેરવામાં નિષ્ફળ',
			'edit_task_success' => 'કાર્ય સફળતાપૂર્વક સંપાદિત થયું',
			'edit_task_fail' => 'કાર્ય સંપાદિત કરવામાં નિષ્ફળ',
			'logout' => 'લૉગ આઉટ',
			'email' => 'ઇમેઇલ',
			'password' => 'પાસવર્ડ',
			'login_fail' => 'લૉગિન નિષ્ફળ',
			'login_success' => 'સફળતાપૂર્વક પ્રવેશ કર્યો',
			'register' => 'નોંધણી કરો',
			'register_fail' => 'નોંધણી નિષ્ફળ',
			'register_success' => 'સફળતાપૂર્વક નોંધણી કરાઈ',
			'email_required' => 'ઇમેઇલ જરૂરી છે',
			'password_required' => 'પાસવર્ડ જરૂરી છે',
			'email_invalid' => 'ઇમેઇલ અમાન્ય છે',
			'password_invalid' => 'પાસવર્ડ અમાન્ય છે',
			'email_exists' => 'ઇમેઇલ પહેલેથી અસ્તિત્વમાં છે',
			'email_not_exists' => 'ઇમેઇલ અસ્તિત્વમાં નથી',
			'password_incorrect' => 'પાસવર્ડ ખોટો છે',
			'password_length' => 'પાસવર્ડ ઓછામાં ઓછા 6 અક્ષરોનો હોવો જોઈએ',
			'check_your_internet' => 'તમારા ઇન્ટરનેટ કનેક્શનને તપાસો',
			'email_not_found' => 'ઇમેઇલ મળ્યો નથી',
			'reset_password' => 'પાસવર્ડ રીસેટ કરો',
			'reset_password_success' => 'પાસવર્ડ રીસેટ ઇમેઇલ સફળતાપૂર્વક મોકલવામાં આવ્યો',
			'reset_password_fail' => 'પાસવર્ડ રીસેટ ઇમેઇલ મોકલવામાં નિષ્ફળ',
			'reset_password_email' => 'પાસવર્ડ રીસેટ ઇમેઇલ',
			'reset_password_email_sent' => 'પાસવર્ડ રીસેટ ઇમેઇલ મોકલવામાં આવ્યો',
			'reset_password_email_sent_description' => 'અમે તમારો પાસવર્ડ રીસેટ કરવા માટે ઇમેઇલ મોકલ્યો છે',
			'reset_password_email_sent_description2' => 'કૃપા કરીને તમારું ઇમેઇલ તપાસો',
			'login.success' => 'સફળતાપૂર્વક પ્રવેશ કર્યો',
			'login.fail' => 'લૉગિન નિષ્ફળ',
			'login.login' => 'લૉગિન',
			'settings' => 'સેટિંગ્સ',
			'change_language' => 'ભાષા બદલો',
			'change_theme' => 'થીમ બદલો',
			'English' => 'English',
			'Gujarati' => 'ગુજરાતી',
			'Hindi' => 'हिंदी',
			_ => null,
		};
	}
}

