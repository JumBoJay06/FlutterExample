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
        centerTitle: Platform.isAndroid,
        title: Text(MyLocalizations.of(context).appTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Card(
              child: ListTile(
                title: Text(MyLocalizations.of(context).example_set_state_title),
                onTap: () {
                  // 使用 GoRouter 進行導航
                  context.go('/set_state');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

}