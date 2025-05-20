import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:my_sample/config/app_config.dart';
import 'package:my_sample/feature/bloc/bookmark_bloc_page.dart';
import 'package:my_sample/feature/cubit/bookmark_cubit_page.dart';
import 'package:my_sample/feature/home.dart';
import 'package:my_sample/feature/hooks/hooks_page.dart';
import 'package:my_sample/feature/inherited_widget/inherited_widget.dart';
import 'package:my_sample/feature/provider/bookmark_page.dart';
import 'package:my_sample/feature/riverpod/bookmark_riverpod_page.dart';
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
        GoRoute(
          path: 'notifier_page',
          builder: (context, state) => NotifierPage(),
        ),
        GoRoute(
          path: 'provider',
          builder: (context, state) => const BookmarkPage(),
        ),
        GoRoute(
          path: 'riverpod',
          builder: (context, state) {
            return ProviderScope(child: const BookmarkRiverpodPage());
          },
        ),
        GoRoute(
          path: 'bloc',
          builder: (context, state) {
            return const BookmarkBlocPage();
          },
        ),
        GoRoute(
          path: 'cubit',
          builder: (context, state) {
            return const BookmarkCubitPage();
          },
        ),
        GoRoute(
          path: 'hooks',
          builder: (context, state) {
            return const HooksPage();
          },
        ),
      ],
    ),
  ],
);
