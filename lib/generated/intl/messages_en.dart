// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
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
  String get localeName => 'en';

  static String m0(userName) => "Hello ${userName}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "appTitle": MessageLookupByLibrary.simpleMessage("Flutter Demo"),
    "example_inherited_widget_content": MessageLookupByLibrary.simpleMessage(
      "Enter your username:",
    ),
    "example_inherited_widget_content2": m0,
    "example_inherited_widget_title": MessageLookupByLibrary.simpleMessage(
      "InheritedWidget Example",
    ),
    "example_inherited_widget_title2": MessageLookupByLibrary.simpleMessage(
      "Welcome",
    ),
    "example_notifier_content": MessageLookupByLibrary.simpleMessage(
      "You have pushed the button this many times:",
    ),
    "example_notifier_title": MessageLookupByLibrary.simpleMessage(
      "Notifier Example",
    ),
    "example_provider_add": MessageLookupByLibrary.simpleMessage(
      "Add Bookmark",
    ),
    "example_provider_title": MessageLookupByLibrary.simpleMessage(
      "Provider Example",
    ),
    "example_riverpod_title": MessageLookupByLibrary.simpleMessage(
      "Riverpod Example",
    ),
    "example_set_state_content": MessageLookupByLibrary.simpleMessage(
      "You have pushed the button this many times:",
    ),
    "example_set_state_title": MessageLookupByLibrary.simpleMessage(
      "SetState Example",
    ),
  };
}
