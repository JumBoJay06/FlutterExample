part of 'bookmark_bloc.dart';

@freezed
class BookmarkEvent with _$BookmarkEvent {
  const factory BookmarkEvent.init() = _Init;
  const factory BookmarkEvent.addBookmark(Bookmark bookmark) = AddBookmark;
}
