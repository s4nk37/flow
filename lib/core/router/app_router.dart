import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/auth/presentation/pages/email_input_page.dart';
import '../../features/auth/presentation/pages/password_login_page.dart';
import '../../features/auth/presentation/pages/signup_page.dart';

import '../../features/todo/presentation/pages/home_page.dart';
import '../../features/todo/presentation/pages/settings_page.dart';

class AppRouter {
  AppRouter._();

  // Route names
  static const String loginPage = 'login';
  static const String emailInputPage = 'emailInput';
  static const String passwordLoginPage = 'passwordLogin';
  static const String signupPage = 'signup';

  static const String homePage = 'home';
  static const String settingsPage = 'settings';

  // Paths
  static const String loginPath = '/';
  static const String emailInputPath = '/email';
  static const String passwordLoginPath = '/password-login';
  static const String signupPath = '/signup';

  static const String homePath = '/home';
  static const String settingsPath = '/settings';

  static GoRouter get router => _router;

  static final _router = GoRouter(
    initialLocation: AppRouter.homePath,
    routes: [

      /// LOGIN PAGE
      GoRoute(
        name: loginPage,
        path: loginPath,
        builder: (context, state) => const LoginPage(),
      ),

      /// EMAIL INPUT PAGE
      GoRoute(
        name: emailInputPage,
        path: emailInputPath,
        builder: (context, state) => const EmailInputPage(),
      ),

      /// PASSWORD LOGIN PAGE (requires email)
      GoRoute(
        name: passwordLoginPage,
        path: passwordLoginPath,
        builder: (context, state) {
          final email = state.extra as String;
          return PasswordLoginPage(email: email);
        },
      ),

      /// SIGNUP PAGE (requires email)
      GoRoute(
        name: signupPage,
        path: signupPath,
        builder: (context, state) {
          final email = state.extra as String;
          return SignupPage(email: email);
        },
      ),

      /// HOME PAGE
      GoRoute(
        name: homePage,
        path: homePath,
        builder: (context, state) => const HomePage(),
      ),

      /// SETTINGS
      GoRoute(
        name: settingsPage,
        path: settingsPath,
        builder: (context, state) => const SettingsPage(),
      ),
    ],
  );
}
