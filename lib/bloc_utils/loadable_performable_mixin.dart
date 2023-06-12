import 'dart:async';

import 'package:store/loadings/loading_manager.dart';

import 'cancelable_performer.dart';

mixin LoadablePerformable<State> on CancelablePerformer<State> {
  LoadingManager get loadingManager;

  Future<T> performWithLoading<T>(
      {required Future<T> future,
      LoadingConfig config = const LoadingConfig(),
      FutureOr<dynamic> Function()? onCancel}) async {
    future = loadingManager.startLoading(
      future: future,
      config: config,
      onCancel: onCancel,
    );
    future = perform(future: future);
    return future;
  }
}
