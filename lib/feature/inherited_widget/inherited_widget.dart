import 'dart:io';

import 'package:flutter/material.dart';
import 'package:my_sample/feature/inherited_widget/model/user.dart';
import 'package:my_sample/feature/inherited_widget/user_header.dart';
import 'package:my_sample/feature/inherited_widget/user_widget.dart';
import 'package:my_sample/generated/l10n.dart';

class MyInheritedWidget extends StatefulWidget {
  const MyInheritedWidget({super.key});

  @override
  State<MyInheritedWidget> createState() => _MyInheritedWidgetState();
}

class _MyInheritedWidgetState extends State<MyInheritedWidget> {
  final _controller = TextEditingController();
  String _userName = '';

  @override
  void initState() {
    super.initState();
    _controller.addListener(_updateUserName);
  }

  @override
  void dispose() {
    _controller.removeListener(_updateUserName);
    _controller.dispose();
    super.dispose();
  }

  _updateUserName() {
    setState(() {
      _userName = _controller.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        centerTitle: Platform.isIOS,
        title: Text(MyLocalizations.of(context).example_set_state_title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                MyLocalizations.of(context).example_inherited_widget_content,
                style: const TextStyle(fontSize: 20, color: Colors.black),
              ),
              SizedBox(height: 16),
              TextField(
                controller: _controller,
                style: const TextStyle(color: Colors.black),
                decoration: const InputDecoration(
                  labelText: '請輸入文字',
                  hintText: '在這裡輸入',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.text_fields),
                  suffixIcon: Icon(Icons.clear),
                ),
              ),
              SizedBox(height: 16),
              // UserWidget 底下的 Widget 都可以共享 user
              UserHeader(
                  user: User(name: _userName),
                  child: UserWidget()),
            ],
          ),
        ),
      ),
    );
  }
}
