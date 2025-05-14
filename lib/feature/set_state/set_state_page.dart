import 'package:flutter/material.dart';
import 'package:my_sample/generated/l10n.dart';

class SetStatePage extends StatefulWidget {
  const SetStatePage({super.key});

  @override
  State<SetStatePage> createState() => _SetStatePageState();
}

class _SetStatePageState extends State<SetStatePage> {
  int _counter = 0;

  void _incrementCounter() {
    // 會使整個頁面刷新
    setState(() {
      _counter++;
    });
  }

  /// 當畫面刷新時，
  /// 只會執行 build
  /// 其他生命週期都不會執行
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(MyLocalizations.of(context).example_set_state_title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                MyLocalizations.of(context).example_set_state_content,
                style: const TextStyle(fontSize: 20, color: Colors.black),
              ),
              SizedBox(height: 16),
              Text(
                '$_counter',
                style: const TextStyle(
                  fontSize: 26,
                  color: Colors.blue,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
