import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:my_sample/feature/provider/model/bookmark.dart';

class BookmarkController extends GetxController {
  // 使用 RxList 使書籤列表變為響應式的
  var bookmarks = <Bookmark>[].obs;

  // 模擬初始載入時的延遲和狀態
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    _fetchInitialBookmarks();
  }

  Future<void> _fetchInitialBookmarks() async {
    try {
      isLoading.value = true;
      // 模擬 API 呼叫
      await Future.delayed(const Duration(seconds: 1));
      // 初始為空列表
      bookmarks.assignAll([]); // 清空並賦值一個新列表 (如果需要)
      print("Bookmarks fetched/initialized.");
    } catch (e) {
      print("Error fetching bookmarks: $e");
    } finally {
      isLoading.value = false;
    }
  }

  // 添加書籤的方法
  void addBookmark(Bookmark newBookmark) {
    bookmarks.add(newBookmark); // RxList 會自動通知監聽者更新
  }
}