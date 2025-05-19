import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_sample/feature/provider/model/bookmark.dart';

part 'boomarks.freezed.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class Boomarks with _$Boomarks {
  const factory Boomarks({
    required List<Bookmark> list,
  }) = _Bookmarks;
}