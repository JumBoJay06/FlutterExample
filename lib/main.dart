import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:my_sample/config/router_config.dart';
import 'package:my_sample/generated/l10n.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const appLocalizationDelegate = AppLocalizationDelegate(); // 你自己 App 的本地化代理
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1),
      ),
      localizationsDelegates: const [
        appLocalizationDelegate,
        GlobalMaterialLocalizations.delegate, // Material Components 的本地化
        GlobalWidgetsLocalizations.delegate,  // Widgets (如文字方向) 的本地化
        GlobalCupertinoLocalizations.delegate, // Cupertino Components 的本地化 (如果使用)
      ],
      // 3. 設定支援的語言列表
      supportedLocales: appLocalizationDelegate.supportedLocales,
    );
  }
}
