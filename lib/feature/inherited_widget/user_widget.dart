import 'package:flutter/material.dart';
import 'package:my_sample/feature/inherited_widget/user_header.dart';
import 'package:my_sample/generated/l10n.dart';

class UserWidget extends StatelessWidget {
  const UserWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // 當資料有變化，這邊會 rebuild
    final userName = UserHeader.of(context)?.user.name ?? '';

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: Text(
          MyLocalizations.of(context).example_inherited_widget_content2(userName),
          style: const TextStyle(fontSize: 20, color: Colors.black),
        ),
      ),
    );
  }
}