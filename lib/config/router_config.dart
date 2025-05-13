import 'package:go_router/go_router.dart';
import 'package:my_sample/config/app_config.dart';
import 'package:my_sample/feature/home.dart';

final router = GoRouter(
  initialLocation: '/',
  navigatorKey: AppConfig.rootNavigatorKey,
  routes: [
    GoRoute(
        path: '/',
      builder: (context, state) {
        return const Home();
      },
    )
  ],
);