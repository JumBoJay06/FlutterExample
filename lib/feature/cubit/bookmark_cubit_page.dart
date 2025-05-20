import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_sample/feature/cubit/bookmark_cubit.dart';
import 'package:my_sample/feature/provider/model/bookmark.dart';
import 'package:my_sample/generated/l10n.dart';

class BookmarkCubitPage extends StatelessWidget {
  const BookmarkCubitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      // 建立並提供 BookmarkCubit
      create: (_) => BookmarkCubit(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          centerTitle: Platform.isIOS,
          title: Text(MyLocalizations.of(context).example_cubit_title),
        ),
        body: const CustomScrollView(
          slivers: [
            BookmarkListCubitWidget(),
            SliverToBoxAdapter(child: BookmarkAddCubitWidget()),
          ],
        ),
      ),
    );
  }
}

class BookmarkListCubitWidget extends StatelessWidget {
  const BookmarkListCubitWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // 使用 BlocBuilder 來監聽 BookmarkCubit 的狀態變化並重建 UI
    return BlocBuilder<BookmarkCubit, BookmarkState>(
      builder: (context, state) {
        // 使用 state.when 來處理不同的狀態
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

class BookmarkAddCubitWidget extends StatelessWidget {
  const BookmarkAddCubitWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // 也可以從 context 來監聽 BookmarkCubit 的狀態變化
    var state = context.watch<BookmarkCubit>().state;
    // 只有在 'loaded' 狀態下才能新增書籤
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
        // 呼叫 Cubit 的 addBookmark 方法
        context.read<BookmarkCubit>().addBookmark(newBookmark);
      }
          : null, // 如果不是 loaded 狀態，則禁用按鈕
      child: Text(MyLocalizations.of(context).example_provider_add),
    );
  }
}