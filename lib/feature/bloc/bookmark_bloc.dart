import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_sample/feature/provider/model/bookmark.dart';
import 'package:my_sample/feature/riverpod/model/boomarks.dart';

part 'bookmark_event.dart';

part 'bookmark_state.dart';

part 'bookmark_bloc.freezed.dart';

class BookmarkBloc extends Bloc<BookmarkEvent, BookmarkState> {
  BookmarkBloc() : super(const BookmarkState.initial()) {
    // 註冊事件處理器，使用 freezed 產生的具體事件類型
    on<_Init>(_onInit); // _Init 是 BookmarkEvent.init() 的 freezed 產生類別
    on<AddBookmark>(
      _onAddBookmark,
    ); // _AddBookmark 是 BookmarkEvent.addBookmark() 的 freezed 產生類別

    // Bloc 建立時即發送 init 事件以載入初始書籤
    add(const BookmarkEvent.init());
  }

  Future<void> _onInit(
    _Init event, // 接收 freezed 產生的 _Init 事件
    Emitter<BookmarkState> emit,
  ) async {
    emit(const BookmarkState.loading());
    try {
      // 模擬延遲
      await Future.delayed(const Duration(seconds: 1));
      emit(BookmarkState.loaded(Boomarks(list: List.empty(growable: true))));
    } catch (e) {
      emit(BookmarkState.error("無法載入書籤: ${e.toString()}"));
    }
  }

  void _onAddBookmark(
    AddBookmark event, // 接收 freezed 產生的 _AddBookmark 事件
    Emitter<BookmarkState> emit,
  ) {
    final currentState = state;
    // 確保目前狀態是 _LoadedState
    if (currentState is Loaded) {
      final newList = List<Bookmark>.from(currentState.bookmarks.list)
        // 從 event.bookmark 獲取要新增的書籤
        ..add(event.bookmark);
      emit(BookmarkState.loaded(Boomarks(list: newList)));
    } else {
      // 如果書籤還沒載入或發生錯誤，可以選擇忽略、記錄錯誤或發出錯誤狀態
      print("無法新增書籤：書籤尚未載入或先前發生錯誤。");
      // 例如: emit(BookmarkState.error("無法新增書籤，請先載入列表。"));
    }
  }
}
