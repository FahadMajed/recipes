import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'base_view_controller.dart';

abstract class View extends ConsumerStatefulWidget {
  final bool observeRoute;

  const View({
    this.observeRoute = false,
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState();
}

abstract class ViewState<V extends View, ViewModel,
    Controller extends ViewController<ViewModel>> extends ConsumerState<V> {
  final ProviderBase<ViewModel> viewModelPvdr;
  final ProviderBase<Controller> controllerPvdr;

  ViewState(this.viewModelPvdr, this.controllerPvdr) {
    if (mounted) {
      WidgetsBinding.instance.addObserver(ref.read(controllerPvdr));
    }
  }
  @override
  @mustCallSuper
  void didChangeDependencies() {
    if (widget.observeRoute) {
      routeObserver.subscribe(viewController, ModalRoute.of(context)!);
    }

    super.didChangeDependencies();
  }

  Widget buildView();

  @override
  void initState() {
    super.initState();
  }

  ViewModel get viewModel => ref.read(viewModelPvdr);
  Controller get viewController => ref.read(controllerPvdr);

  @override
  Widget build(BuildContext context) {
    ref.watch(viewModelPvdr);
    viewController;

    return buildView();
  }
}

abstract class Vieww<ViewModel, Controller extends ViewController<ViewModel>>
    extends ConsumerStatefulWidget {
  final bool observeRoute;
  final ProviderBase<ViewModel> viewModelPvdr;
  final ProviderBase<Controller> controllerPvdr;
  const Vieww(
    this.viewModelPvdr,
    this.controllerPvdr, {
    this.observeRoute = false,
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState();
}

abstract class ViewwState<V extends Vieww<ViewModel, Controller>, ViewModel,
    Controller extends ViewController<ViewModel>> extends ConsumerState<V> {
  ViewwState() {
    if (mounted) {
      WidgetsBinding.instance.addObserver(ref.read(widget.controllerPvdr));
    }
  }
  @override
  @mustCallSuper
  void didChangeDependencies() {
    if (widget.observeRoute) {
      routeObserver.subscribe(viewController, ModalRoute.of(context)!);
    }

    super.didChangeDependencies();
  }

  Widget buildView();

  @override
  void initState() {
    super.initState();
  }

  ViewModel get viewModel => ref.read(widget.viewModelPvdr);
  Controller get viewController => ref.read(widget.controllerPvdr);

  @override
  Widget build(BuildContext context) {
    ref.watch(widget.viewModelPvdr);
    viewController;

    return buildView();
  }
}
