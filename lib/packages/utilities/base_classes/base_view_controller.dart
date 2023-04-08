import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

///T is the view model state
///controller handles UI events and logic,
///it is used for complex screens

///VIEW ONLY CONTROLLER, DOESNOT CARE ABOUT STATE HANDLING, but has a copy of the state. It has [use cases] as members
///to execute, and a [stream controller(s)], which will update according to the use case output,
///and all the listeners must obey the changes.
///extending state controller is just for accessing [mounted]
///

abstract class ViewController<T> extends StateController
    with WidgetsBindingObserver, RouteAware {
  final Reader read;

  final StateProvider<T>? viewModelPvdr;

  ViewController(this.read, {this.viewModelPvdr}) : super(null) {
    addObserver(this);
  }

  T get viewModel => read(viewModelPvdr!);
  set viewModel(T viewModel) => _viewModelState = viewModel;

  set _viewModelState(T updatedViewModel) {
    viewModelStateCtrl.state = updatedViewModel;
  }

  @protected
  StateController<T> get viewModelStateCtrl => read(viewModelPvdr!.notifier);

  @protected
  void addObserver(WidgetsBindingObserver observer) =>
      WidgetsBinding.instance.addObserver(observer);
  @protected
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.inactive:
        onInActive();
        break;
      case AppLifecycleState.paused:
        onPaused();
        break;
      case AppLifecycleState.resumed:
        onRefresh();
        break;
      case AppLifecycleState.detached:
        onDetached();
        break;
    }
  }

  @protected
  void onInActive() {}
  @protected
  void onPaused() {}

  Future<void> onRefresh() async {}
  @protected
  void onDetached() {}
}

final RouteObserver<ModalRoute> routeObserver = RouteObserver<ModalRoute>();

abstract class AsyncViewController<T> extends ViewController<AsyncValue<T>> {
  AsyncViewController(super.read, {super.viewModelPvdr});

  T get viewModelAsData => viewModel.value!;

  void setAsyncViewModelState(T updatedViewModel) {
    viewModelStateCtrl.state = AsyncData(updatedViewModel);
  }

  void emitLoading() => viewModel = const AsyncLoading();
  void emitData(T data) => viewModel = AsyncData(data);
  Future<bool> emitError(Error e) async {
    viewModel = AsyncError(e);
    return false;
  }
}

mixin PageViewController<T> on ViewController<T> {
  void onNext() {
    setPage(pageViewModel.currentPage + 1);
  }

  void onPageChanged(int value) {
    setPage(value);
  }

  void setPage(int value) {
    pageViewModel = pageViewModel.copyWith(currentPage: value);
  }

  StateController<PageViewModel> get pageStateCtrl =>
      read(pageModelPvdr.notifier);
  PageViewModel get pageViewModel => pageStateCtrl.state;
  set pageViewModel(PageViewModel model) => pageStateCtrl.state = model;
}

class PageViewModel {
  final int currentPage;
  final int numberOfPages;
  const PageViewModel({
    this.currentPage = 0,
    required this.numberOfPages,
  });

  bool get isLastPage => currentPage == numberOfPages - 1;

  @override
  List<Object?> get props => [currentPage, numberOfPages];

  PageViewModel copyWith({
    int? currentPage,
    int? numberOfPages,
  }) {
    return PageViewModel(
      currentPage: currentPage ?? this.currentPage,
      numberOfPages: numberOfPages ?? this.numberOfPages,
    );
  }
}

final pageModelPvdr =
    StateProvider((ref) => const PageViewModel(numberOfPages: 0));
