import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/blogs_state.dart';
import '../notifier/blogs_notifier.dart';
import '../../../../../../../core/di/dependency_manager.dart';

final blogsProvider = StateNotifierProvider<BlogsNotifier, BlogsState>(
  (ref) => BlogsNotifier(blogsRepository),
);
