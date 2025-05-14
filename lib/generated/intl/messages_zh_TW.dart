// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a zh_TW locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'zh_TW';

  static String m0(userName) => "你好 ${userName}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "appTitle": MessageLookupByLibrary.simpleMessage("Flutter 範例"),
    "example_inherited_widget_content": MessageLookupByLibrary.simpleMessage(
      "輸入使用者名稱:",
    ),
    "example_inherited_widget_content2": m0,
    "example_inherited_widget_title": MessageLookupByLibrary.simpleMessage(
      "InheritedWidget 範例",
    ),
    "example_inherited_widget_title2": MessageLookupByLibrary.simpleMessage(
      "歡迎",
    ),
    "example_notifier_content": MessageLookupByLibrary.simpleMessage(
      "你按下按鈕的次數：",
    ),
    "example_notifier_title": MessageLookupByLibrary.simpleMessage(
      "Notifier 範例",
    ),
    "example_provider_title": MessageLookupByLibrary.simpleMessage(
      "Provider 範例",
    ),
    "example_set_state_content": MessageLookupByLibrary.simpleMessage(
      "你按下按鈕的次數：",
    ),
    "example_set_state_title": MessageLookupByLibrary.simpleMessage(
      "SetState 範例",
    ),
  };
}
