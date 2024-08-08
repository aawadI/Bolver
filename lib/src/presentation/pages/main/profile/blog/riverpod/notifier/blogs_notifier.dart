import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/blogs_state.dart';
import '../../../../../../../models/data/blog_data.dart';
import '../../../../../../../repository/repository.dart';

class BlogsNotifier extends StateNotifier<BlogsState> {
  final BlogsRepository _blogsRepository;
  int _page = 0;
  bool _hasMore = true;

  BlogsNotifier(this._blogsRepository) : super(const BlogsState());

  Future<void> fetchMoreBlogs() async {
    if (!_hasMore) {
      return;
    }
    state = state.copyWith(isMoreLoading: true);
    final response = await _blogsRepository.getBlogs(++_page, 'blog');
    response.when(
      success: (data) {
        final List<BlogData> newBlogs = data.data ?? [];
        List<BlogData> blogs = List.from(state.blogs);
        blogs.addAll(newBlogs);
        state = state.copyWith(blogs: blogs, isMoreLoading: false);
        _hasMore = newBlogs.length >= 15;
      },
      failure: (fail) {
        _page--;
        state = state.copyWith(isMoreLoading: false);
        debugPrint('===> fetch more blogs fail $fail');
      },
    );
  }

  Future<void> initialFetchBlogs() async {
    if (state.blogs.isNotEmpty) {
      return;
    }
    _page = 0;
    _hasMore = true;
    state = state.copyWith(isLoading: true);
    final response = await _blogsRepository.getBlogs(++_page, 'blog');
    response.when(
      success: (data) {
        final List<BlogData> blogs = data.data ?? [];
        state = state.copyWith(blogs: blogs, isLoading: false);
        _hasMore = blogs.length >= 15;
      },
      failure: (fail) {
        state = state.copyWith(isLoading: false);
        _page--;
        debugPrint('===> initial fetch blogs fail $fail');
      },
    );
  }
}
