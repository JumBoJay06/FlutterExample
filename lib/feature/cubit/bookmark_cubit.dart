import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_sample/feature/provider/model/bookmark.dart';
import 'package:my_sample/feature/riverpod/model/boomarks.dart';

part 'bookmark_state.dart';
part 'bookmark_cubit.freezed.dart';

class BookmarkCubit extends Cubit<BookmarkState> {
  BookmarkCubit() : super(const BookmarkState.initial()) {
    // 對應於 Bloc 中的 BookmarkEvent.init()
    // Cubit 建立時即載入初始書籤
    _loadInitialBookmarks();
  }

  // 這個私有方法處理初始載入，類似 Bloc 中處理 InitEvent 的邏輯
  Future<void> _loadInitialBookmarks() async {
    emit(const BookmarkState.loading());
    try {
      // 模擬 Riverpod provider 或 Bloc 中的延遲
      await Future.delayed(const Duration(seconds: 1));
      // 初始為空列表
      emit(BookmarkState.loaded(Boomarks(list: List.empty(growable: true))));
    } catch (e) {
      emit(BookmarkState.error("無法載入書籤: ${e.toString()}"));
    }
  }

  // 這個公開方法對應於 Bloc 中的 BookmarkEvent.addBookmark()
  // UI 層會直接調用此方法
  void addBookmark(Bookmark bookmarkToAdd) {
    final currentState = state;
    // 確保目前狀態是 Loaded 才能添加
    // 這裡的 Loaded 是 freezed 為 BookmarkState.loaded() 產生的類別
    if (currentState is Loaded) {
      // 從目前狀態取得書籤列表，並加入新的書籤
      final newList = List<Bookmark>.from(currentState.bookmarks.list)
        ..add(bookmarkToAdd);
      // 發出新的 loaded 狀態
      emit(BookmarkState.loaded(Boomarks(list: newList)));
    } else {
      // 如果書籤還沒載入或發生錯誤，可以選擇忽略、記錄錯誤或發出錯誤狀態
      print("無法新增書籤：書籤尚未載入或先前發生錯誤。");
      // 例如: emit(BookmarkState.error("無法新增書籤，請先載入列表。"));
    }
  }
}
