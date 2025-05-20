import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_sample/feature/bloc/bookmark_bloc.dart';
import 'package:my_sample/feature/provider/model/bookmark.dart';
import 'package:my_sample/generated/l10n.dart';

class BookmarkBlocPage extends StatelessWidget {
  const BookmarkBlocPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BookmarkBloc>(
      create: (context) => BookmarkBloc(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          centerTitle: Platform.isIOS,
          title: Text(MyLocalizations.of(context).example_bloc_title),
        ),
        body: CustomScrollView(
          slivers: [
            const BookmarkListBlocWidget(),
            SliverToBoxAdapter(child: const BookmarkAddBlocWidget()),
          ],
        ),
      ),
    );
  }
}

class BookmarkListBlocWidget extends StatelessWidget {
  const BookmarkListBlocWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // 使用 BlocBuilder 來監聽 BookmarkBloc 的狀態變化並重建 UI
    return BlocBuilder<BookmarkBloc, BookmarkState>(
      builder: (context, state) {
        // 與 Cubit 版本類似，使用 state.when 處理不同狀態
        return state.when(
          initial: () => const SliverToBoxAdapter(
              child: Center(child: Text("正在初始化..."))),
          loading: () => const SliverToBoxAdapter(
              child: Center(child: CircularProgressIndicator())),
          loaded: (bookmarks) {
            if (bookmarks.list.isEmpty) {
              return SliverToBoxAdapter(
                child: SizedBox.shrink(),
              );
            }
            return SliverList.separated(
              itemCount: bookmarks.list.length,
              itemBuilder: (context, index) {
                final bookmark = bookmarks.list[index];
                return ListTile(
                  title: Text(bookmark.title),
                  subtitle: Text(bookmark.subtitle),
                );
              },
              separatorBuilder: (context, index) {
                return const Divider();
              },
            );
          },
          error: (message) => SliverToBoxAdapter(
              child: Center(child: Text('錯誤: $message'))),
        );
      },
    );
  }
}

class BookmarkAddBlocWidget extends StatelessWidget {
  const BookmarkAddBlocWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var state = context.watch<BookmarkBloc>().state;
    final bool canAdd = state is Loaded;
    final int currentLength = canAdd ? state.bookmarks.list.length : 0;

    return ElevatedButton(
      onPressed: canAdd
          ? () {
        final index = currentLength;
        final newBookmark = Bookmark(
          title: 'New Bookmark $index',
          subtitle: 'Subtitle $index',
        );
        // 向 Bloc 發送 AddBookmarkEvent 事件
        context.read<BookmarkBloc>().add(AddBookmark(newBookmark));
      }
          : null,
      child: Text(MyLocalizations.of(context).example_provider_add),
    );
  }
}