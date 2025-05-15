import 'dart:io';

import 'package:flutter/material.dart';
import 'package:my_sample/feature/provider/model/bookmark.dart';
import 'package:my_sample/feature/provider/states/bookmarks_states.dart';
import 'package:my_sample/generated/l10n.dart';
import 'package:provider/provider.dart';

class BookmarkPage extends StatelessWidget {
  const BookmarkPage({super.key});

  @override
  Widget build(BuildContext context) {
    // 如果有多個 provider，則可以使用 MultiProvider
    return ChangeNotifierProvider(
      create: (_) => BookmarksState(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          centerTitle: Platform.isIOS,
          title: Text(MyLocalizations.of(context).example_provider_title),
        ),
        body: CustomScrollView(
          slivers: [
            const BookmarkListWidget(),
            SliverToBoxAdapter(
              child: const BookmarkAddWidget(),
            ),
          ],
        ),
      ),
    );
  }
}

class BookmarkListWidget extends StatelessWidget {
  const BookmarkListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // 當 state 有變化時，會自動 rebuild
    final bookmarksState = Provider.of<BookmarksState>(context);
    return SliverList.separated(
      itemCount: bookmarksState.getBookmarks().length,
        itemBuilder: (context, index) {
          final bookmark = bookmarksState.getBookmarks()[index];
          return ListTile(
            title: Text(bookmark.title),
            subtitle: Text(bookmark.subtitle),
          );
        },
        separatorBuilder: (context, index) {
          return const Divider();
        },
    );
  }
}

class BookmarkAddWidget extends StatelessWidget {
  const BookmarkAddWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final bookmarksState = Provider.of<BookmarksState>(context);
    final index = bookmarksState.getBookmarks().length;
    return ElevatedButton(
      onPressed: () {
        // 當按下按鈕時，會新增一個 bookmark，觸發狀態變化
        bookmarksState.addBookmark(Bookmark(title: 'New Bookmark $index', subtitle: 'Subtitle $index'));
      },
      child: Text(MyLocalizations.of(context).example_provider_add),
    );
  }
}