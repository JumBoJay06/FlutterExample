import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:my_sample/generated/l10n.dart';

class HooksPage extends HookConsumerWidget {
  const HooksPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 1. 使用 useState 管理計時器顯示的秒數
    final seconds = useState(0);
    // 2. 使用 useState 管理計時器是否正在運行的狀態
    final isRunning = useState(false); // 初始設計時器為停止狀態

    // 3. useEffect 用於處理計時器的啟動和停止副作用
    useEffect(() {
      Timer? timer; // 將 timer 宣告在 effect 函數作用域內

      if (isRunning.value) {
        // 當 isRunning 為 true 時，啟動計時器
        debugPrint('useEffect: Timer started because isRunning is true.');
        timer = Timer.periodic(const Duration(seconds: 1), (t) {
          seconds.value = t.tick; // 更新秒數
          debugPrint('Timer tick: ${t.tick}');
        });
      } else {
        // 當 isRunning 為 false 時，確保計時器是停止的 (或者說，不要啟動新的)
        debugPrint('useEffect: Timer is not started or was stopped because isRunning is false.');
        // 如果計時器之前已經啟動並且需要在 isRunning 變為 false 時立即重置秒數，
        // 可以在這裡處理，但此範例中，我們主要依賴清理函數。
        // seconds.value = 0; // 例如，如果希望停止時秒數歸零
      }

      // 清理函數 (Cleanup function)
      // 這個函數會在以下情況執行：
      //  - 當 isRunning.value 改變，導致 useEffect 重新執行之前。
      //  - 當 HookWidget 被銷毀 (dispose) 時。
      return () {
        if (timer != null) {
          debugPrint('useEffect cleanup: Cancelling timer. Current isRunning: ${isRunning.value}, Seconds was: ${seconds.value}');
          timer.cancel(); // 取消計時器，防止內存洩漏
        } else {
          debugPrint('useEffect cleanup: No active timer to cancel. Current isRunning: ${isRunning.value}');
        }
      };
    }, [isRunning.value]); // 依賴項列表：只有 isRunning.value 改變時，effect 才會重新執行

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        centerTitle: Platform.isIOS,
        title: Text(MyLocalizations.of(context).example_hooks_title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Seconds: ${seconds.value}',
              style: const TextStyle(fontSize: 18, color: Colors.black),
            ),
            const SizedBox(height: 20),
            Text(
              'Timer is: ${isRunning.value ? "Running" : "Stopped"}',
              style: const TextStyle(fontSize: 18, color: Colors.black),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    isRunning.value = true; // 啟動計時器
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  child: const Text('Start'),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    isRunning.value = false; // 停止計時器
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: const Text('Stop'),
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}