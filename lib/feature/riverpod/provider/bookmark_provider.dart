import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:my_sample/feature/provider/model/bookmark.dart' as model;

part 'bookmark_provider.g.dart';

@riverpod
class Bookmark extends _$Bookmark {
  @override
  Future<List<model.Bookmark>> build() async {
    await Future.delayed(Duration(seconds: 2));
    return List.empty(growable: true);
  }

  void addBookmark(model.Bookmark bookmark) {
    final list = state.value ?? List.empty(growable: true);
    list.add(bookmark);
    state = AsyncValue.data(list);
  }
}
