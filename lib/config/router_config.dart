import 'package:go_router/go_router.dart';
import 'package:my_sample/config/app_config.dart';
import 'package:my_sample/feature/home.dart';
import 'package:my_sample/feature/inherited_widget/inherited_widget.dart';
import 'package:my_sample/feature/provider/bookmark_page.dart';
import 'package:my_sample/feature/set_state/set_state_page.dart';
import 'package:my_sample/feature/value_notifier_and_change_notifier/notifier_page.dart';

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
        GoRoute(
          path: 'inherited_widget',
          builder: (context, state) {
            return const MyInheritedWidget();
          },
        ),
        GoRoute(path: 'notifier_page', builder: (context, state) => NotifierPage()),
        GoRoute(
          path: 'provider',
          builder: (context, state) => const BookmarkPage()
        ),
      ],
    )
  ],
);
