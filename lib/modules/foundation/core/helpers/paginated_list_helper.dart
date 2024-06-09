import 'dart:async';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

mixin PaginatedListHelper<T> on GetxController {
  final list$ = RxList<T>();

  StreamSubscription<List<T>>? _subscription;

  DocumentSnapshot? _lastDocumentSnapshot;

  final ScrollController scrollController = ScrollController();

  final int paginationLimit = 20;

  bool isLoading = false;

  StreamSubscription<List<T>>? initStream({
    required RxList<T> list$,
    DocumentSnapshot? startAfter,
    required int limit,
    required Function(List<T>) onNewData,
  });

  void _initializeStream() {
    isLoading = true;

    _subscription?.cancel();

    _subscription = initStream(
      list$: list$,
      startAfter: null,
      limit: paginationLimit,
      onNewData: _onNewData,
    );
  }

  void loadNextPage() {
    _subscription = initStream(
      list$: list$,
      startAfter: _lastDocumentSnapshot,
      limit: paginationLimit,
      onNewData: _onNewData,
    );
  }

  void _onNewData(List<T> newList) {
    if (list$.isNotEmpty) {
      _lastDocumentSnapshot = (list$.last as dynamic).documentSnapshot;
    }
    isLoading = false;
  }

  void _scrollListener() {
    if (!isLoading && scrollController.position.extentAfter < 300) {
      isLoading = true;
      loadNextPage();
    }
  }

  @override
  void onInit() {
    super.onInit();
    _initializeStream();

    scrollController.addListener(_scrollListener);
  }

  @override
  void onClose() {
    _subscription?.cancel();

    scrollController.removeListener(_scrollListener);
    scrollController.dispose();
    super.onClose();
  }
}
