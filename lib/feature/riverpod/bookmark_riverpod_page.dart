import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_sample/feature/riverpod/provider/bookmark_provider.dart';
import 'package:my_sample/feature/provider/model/bookmark.dart' as model;
import 'package:my_sample/generated/l10n.dart';

// 這邊不會用到 Riverpod 就沒有繼承 ConsumerWidget
class BookmarkRiverpodPage extends StatelessWidget {
  const BookmarkRiverpodPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        centerTitle: Platform.isIOS,
        title: Text(MyLocalizations.of(context).example_riverpod_title),
      ),
      body: CustomScrollView(
        slivers: [
          const BookmarkListWidget(),
          SliverToBoxAdapter(child: const BookmarkAddWidget()),
        ],
      ),
    );
  }
}

class BookmarkListWidget extends ConsumerWidget {
  const BookmarkListWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 當 state 有變化時，會自動 rebuild
    final bookmarksState = ref.watch(bookmarkProvider);
    // 因為是用 AsyncNotifierProvider，內建下面三個狀態可以用
    return bookmarksState.when(
      data:
          (data) => SliverList.separated(
            itemCount: data.length,
            itemBuilder: (context, index) {
              final bookmark = data[index];
              return ListTile(
                title: Text(bookmark.title),
                subtitle: Text(bookmark.subtitle),
              );
            },
            separatorBuilder: (context, index) {
              return const Divider();
            },
          ),
      error: (err, stack) => SliverToBoxAdapter(child: Text('Error')),
      loading:
          () => SliverToBoxAdapter(child: Center(child: const CircularProgressIndicator())),
    );
  }
}

class BookmarkAddWidget extends ConsumerWidget {
  const BookmarkAddWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bookmarksState = ref.watch(bookmarkProvider);
    return bookmarksState.when(
      data:
          (data) => ElevatedButton(
            onPressed: () {
              // 當按下按鈕時，會新增一個 bookmark，觸發狀態變化
              final index = data.length;
              final bookmark = model.Bookmark(
                title: 'New Bookmark $index',
                subtitle: 'Subtitle $index',
              );
              ref.read(bookmarkProvider.notifier).addBookmark(bookmark);
            },
            child: Text(MyLocalizations.of(context).example_provider_add),
          ),
      error: (err, stack) => Text('Error'),
      loading: () => SizedBox.shrink(),
    );
  }
}
