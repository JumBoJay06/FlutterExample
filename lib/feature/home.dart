import 'package:flutter/material.dart';
import 'package:my_sample/generated/l10n.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(MyLocalizations.of(context).appTitle),
      ),
      body: Center(
        child: Text('Welcome to the Home Page!'),
      ),
    );
  }

}