import 'package:flutter/material.dart';

mixin ScrollLoadMoreMixin<T extends StatefulWidget> on State<T> {
  final ScrollController scrollMixinController = ScrollController();
  bool _isFetching = false;

  /// Override this to implement your own load more logic
  void onScrollLoadMore();

  bool get isBottom {
    if (!scrollMixinController.hasClients) return false;
    final maxScroll = scrollMixinController.position.maxScrollExtent;
    final currentScroll = scrollMixinController.offset;
    return currentScroll >= (maxScroll * 0.95);
  }

  @override
  void initState() {
    super.initState();
    scrollMixinController.addListener(() {
       if (isBottom && !_isFetching) {
        _isFetching = true;
        onScrollLoadMore();
      }
    });
  }

  void doneFetching() {
    _isFetching = false;
  }

  @override
  void dispose() {
    scrollMixinController.dispose();
    super.dispose();
  }
}
