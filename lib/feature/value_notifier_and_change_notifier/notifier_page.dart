import 'dart:io';

import 'package:flutter/material.dart';
import 'package:my_sample/generated/l10n.dart';

class NotifierPage extends StatelessWidget {
  NotifierPage({super.key});

  final ValueNotifier<int> _counter = ValueNotifier<int>(0);

  void _incrementCounter() {
    _counter.value++;
  }

  final CounterModel _counterModel = CounterModel();

  void _incrementCounter2() {
    _counterModel.incrementCounter();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        centerTitle: Platform.isIOS,
        title: Text(MyLocalizations.of(context).example_notifier_title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            // 使用 ValueNotifier
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(right: 4.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      MyLocalizations.of(context).example_notifier_content,
                      style: const TextStyle(fontSize: 20, color: Colors.black),
                    ),
                    SizedBox(height: 16),
                    ValueListenableBuilder<int>(
                      valueListenable: _counter,
                      builder: (context, value, child) {
                        return Text(
                          '$value',
                          style: const TextStyle(
                            fontSize: 26,
                            color: Colors.blue,
                            fontWeight: FontWeight.w700,
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 16),
                    TextButton(
                      onPressed: _incrementCounter,
                      child: Text('ValueNotifier Click!'),
                    ),
                  ],
                ),
              ),
            ),
            // 使用 ChangeNotifier
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(left: 4.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      MyLocalizations.of(context).example_notifier_content,
                      style: const TextStyle(fontSize: 20, color: Colors.black),
                    ),
                    SizedBox(height: 16),
                    AnimatedBuilder(
                      animation: _counterModel,
                      builder: (BuildContext context, Widget? child) {
                        return Text(
                          'AnimatedBuilder ${_counterModel.counter}',
                          style: const TextStyle(
                            fontSize: 26,
                            color: Colors.blue,
                            fontWeight: FontWeight.w700,
                          ),
                        );
                      },
                    ),
                    ListenableBuilder(
                      listenable: _counterModel,
                      builder: (BuildContext context, Widget? child) {
                        return Text(
                          'ListenableBuilder ${_counterModel.counter}',
                          style: const TextStyle(
                            fontSize: 26,
                            color: Colors.blue,
                            fontWeight: FontWeight.w700,
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 16),
                    TextButton(
                      onPressed: _incrementCounter2,
                      child: Text('ChangeNotifier Click!'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CounterModel extends ChangeNotifier {
  int _counter = 0;

  int get counter => _counter;

  void incrementCounter() {
    _counter++;
    notifyListeners(); // 通知所有監聽者
  }
}
