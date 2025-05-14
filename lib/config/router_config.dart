import 'package:go_router/go_router.dart';
import 'package:my_sample/config/app_config.dart';
import 'package:my_sample/feature/home.dart';
import 'package:my_sample/feature/set_state/set_state_page.dart';

final router = GoRouter(
  initialLocation: '/',
  navigatorKey: AppConfig.rootNavigatorKey,
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) {
        return const Home();
      },
      routes: [
        GoRoute(
          path: 'set_state',
          builder: (context, state) {
            return const SetStatePage();
          },
        ),
      ],
    )
  ],
);
