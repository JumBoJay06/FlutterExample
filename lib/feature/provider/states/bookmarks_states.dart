import 'package:flutter/material.dart';
import 'package:my_sample/feature/provider/model/bookmark.dart';

class BookmarksState extends ChangeNotifier {
  final List<Bookmark> _bookmarks = List.empty(growable: true);

  List<Bookmark> getBookmarks() {
    return _bookmarks;
  }

  void addBookmark(Bookmark bookmark) {
    _bookmarks.add(bookmark);
    notifyListeners();
  }
}