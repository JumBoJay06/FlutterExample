import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:my_sample/feature/get_x/bookmark_controller.dart';
import 'package:my_sample/feature/provider/model/bookmark.dart';
import 'package:my_sample/generated/l10n.dart';

class BookmarkGetXPage extends StatelessWidget {
  const BookmarkGetXPage({super.key});

  @override
  Widget build(BuildContext context) {
    // 確保控制器已初始化。
    // 如果是第一次，Get.put() 會創建它，否則會找到現有的實例。
    Get.put(BookmarkController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent, // 來自 Riverpod 範例
        centerTitle: Platform.isIOS,       // 來自 Riverpod 範例
        title: Text(MyLocalizations.of(context).example_get_x_title), // MyLocalizations 的替代文字
      ),
      body: const CustomScrollView( // 使用 CustomScrollView，如同 Riverpod 範例
        slivers: [
          BookmarkListGetXWidget(),
          SliverToBoxAdapter(child: BookmarkAddGetXWidget()), // 來自 Riverpod 範例
        ],
      ),
    );
  }
}

// 用於顯示書籤列表的 Widget
class BookmarkListGetXWidget extends StatelessWidget {
  const BookmarkListGetXWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // 找到已經被 put 的控制器
    final BookmarkController controller = Get.find<BookmarkController>();

    return Obx(() { // Obx 監聽控制器中的響應式變更
      if (controller.isLoading.value) {
        // 模仿 Riverpod 範例中的載入狀態
        return const SliverToBoxAdapter(
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: CircularProgressIndicator(),
            ),
          ),
        );
      }

      return SliverList.separated(
        itemCount: controller.bookmarks.length,
        itemBuilder: (context, index) {
          final bookmark = controller.bookmarks[index];
          return ListTile(
            title: Text(bookmark.title),
            subtitle: Text(bookmark.subtitle),
          );
        },
        separatorBuilder: (context, index) {
          return const Divider();
        },
      );
    });
  }
}

// 「新增書籤」按鈕的 Widget
class BookmarkAddGetXWidget extends StatelessWidget {
  const BookmarkAddGetXWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final BookmarkController controller = Get.find<BookmarkController>();

    // 這裡使用 Obx 是為了保持一致性，並允許未來按鈕的 UI 依賴於控制器狀態。
    // 對於像這樣簡單的按鈕，如果其外觀不依賴於控制器狀態，
    // 可能並非嚴格需要 Obx 僅僅是為了調用一個方法。
    // 然而，Riverpod 範例中新增按鈕的顯示/狀態是依賴於主狀態的 .when。
    // 在這裡，如果控制器可用，我們總是顯示按鈕。
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(() { // 使用 Obx 以保持一致性並允許未來按鈕的狀態相關 UI
          final data = controller.bookmarks;
          final index = data.length;
          final bookmark = Bookmark(
            title: 'New Bookmark $index',
            subtitle: 'Subtitle $index',
          );
          return ElevatedButton(
            onPressed: controller.isLoading.value
                ? null // 如果正在載入則禁用按鈕 (可選，類似 Riverpod 載入時的 SizedBox.shrink)
                : () {
              // 新增書籤的邏輯在 controller.addBookmark() 中
              controller.addBookmark(bookmark);
            },
            // MyLocalizations.of(context).example_provider_add 的替代文字
            child: const Text('新增書籤'),
          );
        }
        )
    );
  }
}