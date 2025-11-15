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
class TranslationsHiIn implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsHiIn({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.hiIn,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <hi-IN>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	late final TranslationsHiIn _root = this; // ignore: unused_field

	@override 
	TranslationsHiIn $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsHiIn(meta: meta ?? this.$meta);

	// Translations
	@override String get tasks => 'कार्य';
	@override String get add_task => 'कार्य जोड़ें';
	@override String get update_task => 'कार्य अपडेट करें';
	@override String get task_name => 'कार्य का नाम';
	@override String get description => 'विवरण';
	@override String get status => 'स्थिति';
	@override String get created_at => 'बनाया गया';
	@override String get updated_at => 'अपडेट किया गया';
	@override String get actions => 'कार्रवाइयाँ';
	@override String get edit => 'संपादित करें';
	@override String get delete => 'हटाएं';
	@override String get Language => 'भाषा';
	@override String get english => 'अंग्रेज़ी';
	@override String get reminder => 'स्मारक';
	@override String get cancel => 'रद्द करें';
	@override String get ok => 'ठीक है';
	@override String get theme => 'थीम';
	@override String get light => 'प्रकाश';
	@override String get dark => 'अंधेरा';
	@override String get save => 'सहेजें';
	@override String get no_tasks => 'अभी तक कोई कार्य नहीं';
	@override String get no_internet => 'कोई इंटरनेट कनेक्शन नहीं';
	@override String get please_enter_task_name => 'कृपया कार्य का नाम दर्ज करें';
	@override String get unknown_error => 'अज्ञात त्रुटि';
	@override String get delete_task => 'कार्य हटाएं';
	@override String get delete_task_confirm => 'क्या आप वाकई इस कार्य को हटाना चाहते हैं?';
	@override String get delete_task_success => 'कार्य सफलतापूर्वक हटा दिया गया';
	@override String get delete_task_fail => 'कार्य हटाने में विफल';
	@override String get add_task_success => 'कार्य सफलतापूर्वक जोड़ा गया';
	@override String get add_task_fail => 'कार्य जोड़ने में विफल';
	@override String get edit_task_success => 'कार्य सफलतापूर्वक संपादित किया गया';
	@override String get edit_task_fail => 'कार्य संपादित करने में विफल';
	@override String get logout => 'लॉगआउट';
	@override String get email => 'ईमेल';
	@override String get password => 'पासवर्ड';
	@override String get login_fail => 'लॉगिन विफल';
	@override String get login_success => 'सफलतापूर्वक लॉगिन किया गया';
	@override String get register => 'रजिस्टर';
	@override String get register_fail => 'रजिस्टर करने में विफल';
	@override String get register_success => 'सफलतापूर्वक रजिस्टर किया गया';
	@override String get email_required => 'ईमेल आवश्यक है';
	@override String get password_required => 'पासवर्ड आवश्यक है';
	@override String get email_invalid => 'ईमेल अमान्य है';
	@override String get password_invalid => 'पासवर्ड अमान्य है';
	@override String get email_exists => 'ईमेल पहले से मौजूद है';
	@override String get email_not_exists => 'ईमेल मौजूद नहीं है';
	@override String get password_incorrect => 'पासवर्ड गलत है';
	@override String get password_length => 'पासवर्ड कम से कम 6 अक्षरों का होना चाहिए';
	@override String get check_your_internet => 'अपना इंटरनेट कनेक्शन जांचें';
	@override String get email_not_found => 'ईमेल नहीं मिला';
	@override String get reset_password => 'पासवर्ड रीसेट करें';
	@override String get reset_password_success => 'पासवर्ड रीसेट ईमेल सफलतापूर्वक भेजा गया';
	@override String get reset_password_fail => 'पासवर्ड रीसेट ईमेल भेजने में विफल';
	@override String get reset_password_email => 'पासवर्ड रीसेट ईमेल';
	@override String get reset_password_email_sent => 'पासवर्ड रीसेट ईमेल भेजा गया';
	@override String get reset_password_email_sent_description => 'हमने आपको पासवर्ड रीसेट करने के लिए एक ईमेल भेजा है';
	@override String get reset_password_email_sent_description2 => 'कृपया अपना ईमेल देखें';
	@override late final _TranslationsLoginHiIn login = _TranslationsLoginHiIn._(_root);
	@override String get settings => 'सेटिंग्स';
	@override String get change_language => 'भाषा बदलें';
	@override String get change_theme => 'थीम बदलें';
	@override String get English => 'English';
	@override String get Gujarati => 'ગુજરાતી';
	@override String get Hindi => 'हिंदी';
}

// Path: login
class _TranslationsLoginHiIn implements TranslationsLoginEn {
	_TranslationsLoginHiIn._(this._root);

	final TranslationsHiIn _root; // ignore: unused_field

	// Translations
	@override String get success => 'सफलतापूर्वक लॉगिन किया गया';
	@override String get fail => 'लॉगिन विफल';
	@override String get login => 'लॉगिन';
}

/// The flat map containing all translations for locale <hi-IN>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsHiIn {
	dynamic _flatMapFunction(String path) {
		return _flatMapFunction$0(path);
	}

	dynamic _flatMapFunction$0(String path) {
		return switch (path) {
			'tasks' => 'कार्य',
			'add_task' => 'कार्य जोड़ें',
			'update_task' => 'कार्य अपडेट करें',
			'task_name' => 'कार्य का नाम',
			'description' => 'विवरण',
			'status' => 'स्थिति',
			'created_at' => 'बनाया गया',
			'updated_at' => 'अपडेट किया गया',
			'actions' => 'कार्रवाइयाँ',
			'edit' => 'संपादित करें',
			'delete' => 'हटाएं',
			'Language' => 'भाषा',
			'english' => 'अंग्रेज़ी',
			'reminder' => 'स्मारक',
			'cancel' => 'रद्द करें',
			'ok' => 'ठीक है',
			'theme' => 'थीम',
			'light' => 'प्रकाश',
			'dark' => 'अंधेरा',
			'save' => 'सहेजें',
			'no_tasks' => 'अभी तक कोई कार्य नहीं',
			'no_internet' => 'कोई इंटरनेट कनेक्शन नहीं',
			'please_enter_task_name' => 'कृपया कार्य का नाम दर्ज करें',
			'unknown_error' => 'अज्ञात त्रुटि',
			'delete_task' => 'कार्य हटाएं',
			'delete_task_confirm' => 'क्या आप वाकई इस कार्य को हटाना चाहते हैं?',
			'delete_task_success' => 'कार्य सफलतापूर्वक हटा दिया गया',
			'delete_task_fail' => 'कार्य हटाने में विफल',
			'add_task_success' => 'कार्य सफलतापूर्वक जोड़ा गया',
			'add_task_fail' => 'कार्य जोड़ने में विफल',
			'edit_task_success' => 'कार्य सफलतापूर्वक संपादित किया गया',
			'edit_task_fail' => 'कार्य संपादित करने में विफल',
			'logout' => 'लॉगआउट',
			'email' => 'ईमेल',
			'password' => 'पासवर्ड',
			'login_fail' => 'लॉगिन विफल',
			'login_success' => 'सफलतापूर्वक लॉगिन किया गया',
			'register' => 'रजिस्टर',
			'register_fail' => 'रजिस्टर करने में विफल',
			'register_success' => 'सफलतापूर्वक रजिस्टर किया गया',
			'email_required' => 'ईमेल आवश्यक है',
			'password_required' => 'पासवर्ड आवश्यक है',
			'email_invalid' => 'ईमेल अमान्य है',
			'password_invalid' => 'पासवर्ड अमान्य है',
			'email_exists' => 'ईमेल पहले से मौजूद है',
			'email_not_exists' => 'ईमेल मौजूद नहीं है',
			'password_incorrect' => 'पासवर्ड गलत है',
			'password_length' => 'पासवर्ड कम से कम 6 अक्षरों का होना चाहिए',
			'check_your_internet' => 'अपना इंटरनेट कनेक्शन जांचें',
			'email_not_found' => 'ईमेल नहीं मिला',
			'reset_password' => 'पासवर्ड रीसेट करें',
			'reset_password_success' => 'पासवर्ड रीसेट ईमेल सफलतापूर्वक भेजा गया',
			'reset_password_fail' => 'पासवर्ड रीसेट ईमेल भेजने में विफल',
			'reset_password_email' => 'पासवर्ड रीसेट ईमेल',
			'reset_password_email_sent' => 'पासवर्ड रीसेट ईमेल भेजा गया',
			'reset_password_email_sent_description' => 'हमने आपको पासवर्ड रीसेट करने के लिए एक ईमेल भेजा है',
			'reset_password_email_sent_description2' => 'कृपया अपना ईमेल देखें',
			'login.success' => 'सफलतापूर्वक लॉगिन किया गया',
			'login.fail' => 'लॉगिन विफल',
			'login.login' => 'लॉगिन',
			'settings' => 'सेटिंग्स',
			'change_language' => 'भाषा बदलें',
			'change_theme' => 'थीम बदलें',
			'English' => 'English',
			'Gujarati' => 'ગુજરાતી',
			'Hindi' => 'हिंदी',
			_ => null,
		};
	}
}

