import 'package:flutter/material.dart';
import 'package:my_sample/feature/inherited_widget/model/user.dart';

class UserHeader extends InheritedWidget {
  final User user;

  const UserHeader({
    super.key,
    required this.user,
    required super.child,
  });

  // 定義一個方便子樹中的widget獲取共享數據的方法
  static UserHeader? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<UserHeader>();
  }

  @override
  bool updateShouldNotify(UserHeader oldWidget) {
    return oldWidget.user != user;
  }
}

