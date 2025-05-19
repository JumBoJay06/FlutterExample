import 'package:my_sample/feature/riverpod/model/boomarks.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:my_sample/feature/provider/model/bookmark.dart' as model;

part 'bookmark_provider.g.dart';

@riverpod
class Bookmark extends _$Bookmark {
  @override
  Future<Boomarks> build() async {
    await Future.delayed(Duration(seconds: 1));
    return Boomarks(list: List.empty(growable: true));
  }

  void addBookmark(model.Bookmark bookmark) {
    final bookmarks = state.valueOrNull;
    if (bookmarks != null) {
      final newList = List<model.Bookmark>.from(bookmarks.list)..add(bookmark);
      state = AsyncValue.data(Boomarks(list: newList));
    }
  }
}
