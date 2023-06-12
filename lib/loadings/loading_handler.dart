import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nested/nested.dart';
import 'dart:io';

import '../global_key_provider/navigation_context_getter.dart';
import 'loading_manager.dart';

class DefaultLoadingIndicator extends StatelessWidget {
  const DefaultLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Platform.isIOS
          ? const CupertinoActivityIndicator()
          : const CircularProgressIndicator(),
    );
  }
}

abstract class LoadingWidgetBuilderDelegate {
  Widget buildLoadingIndicator(BuildContext context, LoadingConfig config);
}

class DefaultLoadingWidgetBuilderDelegate
    implements LoadingWidgetBuilderDelegate {
  @override
  Widget buildLoadingIndicator(BuildContext context, LoadingConfig config) {
    return const DefaultLoadingIndicator();
  }
}

class LoadingHandler extends SingleChildStatelessWidget {
  const LoadingHandler({
    super.key,
    this.navigatorKey,
    super.child,
  });

  final GlobalKey<NavigatorState>? navigatorKey;

  @protected
  SingleChildWidget createScope(BuildContext context) {
    return const LoadingManagerScope();
  }

  @protected
  SingleChildWidget createHandlerWidget(BuildContext context) {
    return LoadingHandlerWidget(
      navigatorKey: navigatorKey,
      delegate: DefaultLoadingWidgetBuilderDelegate(),
    );
  }

  @override
  Widget buildWithChild(BuildContext context, Widget? child) {
    return Nested(
      children: [
        createScope(context),
        createHandlerWidget(context),
      ],
      child: child,
    );
  }
}

class LoadingManagerScope extends SingleChildStatelessWidget {
  const LoadingManagerScope({super.key});

  @override
  Widget buildWithChild(BuildContext context, Widget? child) {
    return BlocProvider<LoadingManager>(
      create: (context) => LoadingManager(),
      child: child,
    );
  }
}

class LoadingHandlerWidget extends SingleChildStatefulWidget {
  const LoadingHandlerWidget({
    Key? key,
    super.child,
    required this.delegate,
    this.navigatorKey,
  }) : super(key: key);
  final LoadingWidgetBuilderDelegate delegate;
  final GlobalKey<NavigatorState>? navigatorKey;

  @override
  State<LoadingHandlerWidget> createState() => _LoadingHandlerWidgetState();
}

class _LoadingHandlerWidgetState extends SingleChildState<LoadingHandlerWidget>
    with GlobalKeyNavigationContextGetter {
  final Map<int, Route<dynamic>> _mapDialogRoute = {};

  Future<void> showLoadingDialog({
    required BuildContext context,
    bool barrierDismissible = true,
    Color? barrierColor = Colors.black54,
    String? barrierLabel,
    bool useSafeArea = true,
    bool useRootNavigator = true,
    RouteSettings? routeSettings,
    Offset? anchorPoint,
    required bool cancelable,
    required Widget loadingIndicator,
    required int dialogId,
  }) async {
    final CapturedThemes themes = InheritedTheme.capture(
      from: context,
      to: Navigator.of(
        context,
        rootNavigator: useRootNavigator,
      ).context,
    );
    final route = DialogRoute(
      context: context,
      builder: (context) => WillPopScope(
        onWillPop: () async => cancelable,
        child: loadingIndicator,
      ),
      barrierColor: barrierColor,
      barrierDismissible: barrierDismissible,
      barrierLabel: barrierLabel,
      useSafeArea: useSafeArea,
      settings: routeSettings,
      themes: themes,
      anchorPoint: anchorPoint,
    );
    _mapDialogRoute[dialogId] = route;
    await Navigator.of(context, rootNavigator: useRootNavigator).push(route);
  }

  void hide(BuildContext context, {required int dialogId}) {
    final loadingRoute = _mapDialogRoute[dialogId];
    if (loadingRoute?.navigator != null) {
      Navigator.of(context).removeRoute(loadingRoute!);
    }
    _mapDialogRoute.remove(dialogId);
  }

  @override
  Widget buildWithChild(BuildContext context, Widget? child) {
    return BlocListener<LoadingManager, LoadingState>(
      listener: (context, state) async {
        if (state is! EventDrivenLoadingState) return;
        final resolvedNavigatorContext =
            getNavigatorContext(context, navigatorKey: widget.navigatorKey);
        if (state.showing) {
          final manager = context.read<LoadingManager>();
          await showLoadingDialog(
            context: resolvedNavigatorContext,
            loadingIndicator: widget.delegate
                .buildLoadingIndicator(resolvedNavigatorContext, state.config),
            cancelable: state.config.cancelable,
            dialogId: state.operationId,
          );
          manager.cancelLoading(operationId: state.operationId);
        } else {
          hide(resolvedNavigatorContext, dialogId: state.operationId);
        }
      },
      child: child,
    );
  }
}
