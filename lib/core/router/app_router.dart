import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/todo/presentation/pages/home_page.dart';
import '../../features/todo/presentation/pages/settings_page.dart';

class AppRouter {
  AppRouter._();

  static const String loginPage = 'loginPage';
  static const String loginPagePath = '/';

  static const String homePage = 'homepage';
  static const String homePagePath = '/homePage';

  static const String settingsPage = 'settingsPage';
  static const String settingsPath = '/settings';

  static GoRouter get router => _router;

  // GoRouter configuration
  static final _router = GoRouter(
    initialLocation: homePagePath,
    routes: [
      GoRoute(
        name: loginPage,
        path: loginPagePath,
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        name: homePage,
        path: homePagePath,
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: AppRouter.settingsPath,
        name: AppRouter.settingsPage,
        builder: (context, state) => const SettingsPage(),
      ),
    ],
  );
}
