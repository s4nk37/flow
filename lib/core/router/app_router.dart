import 'package:go_router/go_router.dart';

import '../../features/todo/presentation/pages/home_page.dart';
import '../../features/todo/presentation/pages/settings_page.dart';

class AppRouter {
  AppRouter._();

  static const String homePage = 'homepage';
  static const String homePagePath = '/';

  static const String settingsPage = 'settingsPage';
  static const String settingsPath = '/settings';

  static GoRouter get router => _router;

  // GoRouter configuration
  static final _router = GoRouter(
    initialLocation: homePagePath,
    routes: [
      GoRoute(
        name: homePage,
        path: homePagePath,
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
          path: AppRouter.settingsPath,
          name: AppRouter.settingsPage,
          builder: (context, state) => const SettingsPage()),
    ],
  );
}
