part of 'bookmark_cubit.dart';

@freezed
class BookmarkState with _$BookmarkState {
  const factory BookmarkState.initial() = Initial;
  const factory BookmarkState.loading() = Loading;
  const factory BookmarkState.loaded(Boomarks bookmarks) = Loaded;
  const factory BookmarkState.error(String message) = Error;
}
