///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

part of 'strings.g.dart';

// Path: <root>
typedef TranslationsEn = Translations; // ignore: unused_element
class Translations implements BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
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

	Translations $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => Translations(meta: meta ?? this.$meta);

	// Translations

	/// en: 'Tasks'
	String get tasks => 'Tasks';

	/// en: 'Add task'
	String get add_task => 'Add task';

	/// en: 'Update task'
	String get update_task => 'Update task';

	/// en: 'Task name'
	String get task_name => 'Task name';

	/// en: 'Description'
	String get description => 'Description';

	/// en: 'Status'
	String get status => 'Status';

	/// en: 'Created at'
	String get created_at => 'Created at';

	/// en: 'Updated at'
	String get updated_at => 'Updated at';

	/// en: 'Actions'
	String get actions => 'Actions';

	/// en: 'Edit'
	String get edit => 'Edit';

	/// en: 'Delete'
	String get delete => 'Delete';

	/// en: 'Language'
	String get Language => 'Language';

	/// en: 'English'
	String get english => 'English';

	/// en: 'Reminder'
	String get reminder => 'Reminder';

	/// en: 'Cancel'
	String get cancel => 'Cancel';

	/// en: 'Ok'
	String get ok => 'Ok';

	/// en: 'Theme'
	String get theme => 'Theme';

	/// en: 'Light'
	String get light => 'Light';

	/// en: 'Dark'
	String get dark => 'Dark';

	/// en: 'System'
	String get system => 'System';

	/// en: 'Save'
	String get save => 'Save';

	/// en: 'No tasks yet'
	String get no_tasks => 'No tasks yet';

	/// en: 'No internet connection'
	String get no_internet => 'No internet connection';

	/// en: 'Please enter task name'
	String get please_enter_task_name => 'Please enter task name';

	/// en: 'Unknown error'
	String get unknown_error => 'Unknown error';

	/// en: 'Delete task'
	String get delete_task => 'Delete task';

	/// en: 'Are you sure you want to delete this task?'
	String get delete_task_confirm => 'Are you sure you want to delete this task?';

	/// en: 'Task deleted successfully'
	String get delete_task_success => 'Task deleted successfully';

	/// en: 'Task deleted failed'
	String get delete_task_fail => 'Task deleted failed';

	/// en: 'Task added successfully'
	String get add_task_success => 'Task added successfully';

	/// en: 'Task added failed'
	String get add_task_fail => 'Task added failed';

	/// en: 'Task edited successfully'
	String get edit_task_success => 'Task edited successfully';

	/// en: 'Task edited failed'
	String get edit_task_fail => 'Task edited failed';

	/// en: 'Logout'
	String get logout => 'Logout';

	/// en: 'Are you sure you want to logout?'
	String get logout_confirmation => 'Are you sure you want to logout?';

	/// en: 'Account'
	String get account => 'Account';

	/// en: 'Email'
	String get email => 'Email';

	/// en: 'Password'
	String get password => 'Password';

	/// en: 'Login failed'
	String get login_fail => 'Login failed';

	/// en: 'Logged in successfully'
	String get login_success => 'Logged in successfully';

	/// en: 'Register'
	String get register => 'Register';

	/// en: 'Register failed'
	String get register_fail => 'Register failed';

	/// en: 'Registered successfully'
	String get register_success => 'Registered successfully';

	/// en: 'Email is required'
	String get email_required => 'Email is required';

	/// en: 'Password is required'
	String get password_required => 'Password is required';

	/// en: 'Email is invalid'
	String get email_invalid => 'Email is invalid';

	/// en: 'Password is invalid'
	String get password_invalid => 'Password is invalid';

	/// en: 'Email already exists'
	String get email_exists => 'Email already exists';

	/// en: 'Email not exists'
	String get email_not_exists => 'Email not exists';

	/// en: 'Password is incorrect'
	String get password_incorrect => 'Password is incorrect';

	/// en: 'Password must be at least 6 characters'
	String get password_length => 'Password must be at least 6 characters';

	/// en: 'Check your internet connection'
	String get check_your_internet => 'Check your internet connection';

	/// en: 'Email not found'
	String get email_not_found => 'Email not found';

	/// en: 'Reset password'
	String get reset_password => 'Reset password';

	/// en: 'Reset password email sent successfully'
	String get reset_password_success => 'Reset password email sent successfully';

	/// en: 'Reset password email sent failed'
	String get reset_password_fail => 'Reset password email sent failed';

	/// en: 'Reset password email'
	String get reset_password_email => 'Reset password email';

	/// en: 'Reset password email sent'
	String get reset_password_email_sent => 'Reset password email sent';

	/// en: 'We have sent an email to reset your password'
	String get reset_password_email_sent_description => 'We have sent an email to reset your password';

	/// en: 'Please check your email'
	String get reset_password_email_sent_description2 => 'Please check your email';

	late final TranslationsLoginEn login = TranslationsLoginEn._(_root);

	/// en: 'Settings'
	String get settings => 'Settings';

	/// en: 'Change language'
	String get change_language => 'Change language';

	/// en: 'Change theme'
	String get change_theme => 'Change theme';

	/// en: 'English'
	String get English => 'English';

	/// en: 'Gujarati'
	String get Gujarati => 'Gujarati';

	/// en: 'Hindi'
	String get Hindi => 'Hindi';
}

// Path: login
class TranslationsLoginEn {
	TranslationsLoginEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Logged in successfully'
	String get success => 'Logged in successfully';

	/// en: 'Logged in failed'
	String get fail => 'Logged in failed';

	/// en: 'Login'
	String get login => 'Login';
}

/// The flat map containing all translations for locale <en>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on Translations {
	dynamic _flatMapFunction(String path) {
		return _flatMapFunction$0(path);
	}

	dynamic _flatMapFunction$0(String path) {
		return switch (path) {
			'tasks' => 'Tasks',
			'add_task' => 'Add task',
			'update_task' => 'Update task',
			'task_name' => 'Task name',
			'description' => 'Description',
			'status' => 'Status',
			'created_at' => 'Created at',
			'updated_at' => 'Updated at',
			'actions' => 'Actions',
			'edit' => 'Edit',
			'delete' => 'Delete',
			'Language' => 'Language',
			'english' => 'English',
			'reminder' => 'Reminder',
			'cancel' => 'Cancel',
			'ok' => 'Ok',
			'theme' => 'Theme',
			'light' => 'Light',
			'dark' => 'Dark',
			'system' => 'System',
			'save' => 'Save',
			'no_tasks' => 'No tasks yet',
			'no_internet' => 'No internet connection',
			'please_enter_task_name' => 'Please enter task name',
			'unknown_error' => 'Unknown error',
			'delete_task' => 'Delete task',
			'delete_task_confirm' => 'Are you sure you want to delete this task?',
			'delete_task_success' => 'Task deleted successfully',
			'delete_task_fail' => 'Task deleted failed',
			'add_task_success' => 'Task added successfully',
			'add_task_fail' => 'Task added failed',
			'edit_task_success' => 'Task edited successfully',
			'edit_task_fail' => 'Task edited failed',
			'logout' => 'Logout',
			'logout_confirmation' => 'Are you sure you want to logout?',
			'account' => 'Account',
			'email' => 'Email',
			'password' => 'Password',
			'login_fail' => 'Login failed',
			'login_success' => 'Logged in successfully',
			'register' => 'Register',
			'register_fail' => 'Register failed',
			'register_success' => 'Registered successfully',
			'email_required' => 'Email is required',
			'password_required' => 'Password is required',
			'email_invalid' => 'Email is invalid',
			'password_invalid' => 'Password is invalid',
			'email_exists' => 'Email already exists',
			'email_not_exists' => 'Email not exists',
			'password_incorrect' => 'Password is incorrect',
			'password_length' => 'Password must be at least 6 characters',
			'check_your_internet' => 'Check your internet connection',
			'email_not_found' => 'Email not found',
			'reset_password' => 'Reset password',
			'reset_password_success' => 'Reset password email sent successfully',
			'reset_password_fail' => 'Reset password email sent failed',
			'reset_password_email' => 'Reset password email',
			'reset_password_email_sent' => 'Reset password email sent',
			'reset_password_email_sent_description' => 'We have sent an email to reset your password',
			'reset_password_email_sent_description2' => 'Please check your email',
			'login.success' => 'Logged in successfully',
			'login.fail' => 'Logged in failed',
			'login.login' => 'Login',
			'settings' => 'Settings',
			'change_language' => 'Change language',
			'change_theme' => 'Change theme',
			'English' => 'English',
			'Gujarati' => 'Gujarati',
			'Hindi' => 'Hindi',
			_ => null,
		};
	}
}

