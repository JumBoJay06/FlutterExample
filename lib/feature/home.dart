import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_sample/generated/l10n.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        centerTitle: Platform.isIOS,
        title: Text(MyLocalizations.of(context).appTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Card(
              child: ListTile(
                title: Text(
                  MyLocalizations.of(context).example_set_state_title,
                ),
                onTap: () {
                  // 使用 GoRouter 進行導航
                  context.go('/set_state');
                },
              ),
            ),
            Card(
              child: ListTile(
                title: Text(
                  MyLocalizations.of(context).example_inherited_widget_title,
                ),
                onTap: () {
                  // 使用 GoRouter 進行導航
                  context.go('/inherited_widget');
                },
              ),
            ),
            Card(
              child: ListTile(
                title: Text(MyLocalizations.of(context).example_notifier_title),
                onTap: () {
                  // 使用 GoRouter 進行導航
                  context.go('/notifier_page');
                },
              ),
            ),
            Card(
              child: ListTile(
                title: Text(MyLocalizations.of(context).example_provider_title),
                onTap: () {
                  // 使用 GoRouter 進行導航
                  context.go('/provider');
                },
              ),
            ),
            Card(
              child: ListTile(
                title: Text(MyLocalizations.of(context).example_riverpod_title),
                onTap: () {
                  // 使用 GoRouter 進行導航
                  context.go('/riverpod');
                },
              ),
            ),
            Card(
              child: ListTile(
                title: Text(MyLocalizations.of(context).example_bloc_title),
                onTap: () {
                  // 使用 GoRouter 進行導航
                  context.go('/bloc');
                },
              ),
            ),
            Card(
              child: ListTile(
                title: Text(MyLocalizations.of(context).example_cubit_title),
                onTap: () {
                  // 使用 GoRouter 進行導航
                  context.go('/cubit');
                },
              ),
            ),
            Card(
              child: ListTile(
                title: Text(MyLocalizations.of(context).example_hooks_title),
                onTap: () {
                  // 使用 GoRouter 進行導航
                  context.go('/hooks');
                },
              ),
            ),
            Card(
              child: ListTile(
                title: Text(MyLocalizations.of(context).example_get_x_title),
                onTap: () {
                  // 使用 GoRouter 進行導航
                  context.go('/get_x');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
