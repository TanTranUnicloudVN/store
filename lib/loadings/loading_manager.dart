import 'dart:async';

import 'package:async/async.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class LoadingState extends Equatable {
  const LoadingState();
  @override
  List<Object?> get props => [];
}

class InitialLoadingState extends LoadingState {
  const InitialLoadingState();
}

class EventDrivenLoadingState extends LoadingState {
  final bool showing;
  final LoadingConfig config;
  final int operationId;

  const EventDrivenLoadingState({
    this.showing = false,
    this.config = const LoadingConfig(),
    required this.operationId,
  });

  @override
  List<Object?> get props => [
        showing,
        operationId,
        config,
      ];
}

class LoadingConfig extends Equatable {
  final bool cancelable;

  const LoadingConfig({
    this.cancelable = false,
  });

  @override
  List<Object?> get props => [cancelable];
}

class LoadingManager extends Cubit<LoadingState> {
  LoadingManager() : super(const InitialLoadingState());

  int _nextOperationId = 0;

  int getNextOperationId() {
    return _nextOperationId++;
  }

  final Map<int, CancelableOperation<dynamic>> _mapOperation = {};

  Completer<dynamic>? _freeLoaderCompleter;

  void startFreeLoading({
    LoadingConfig config = const LoadingConfig(),
    FutureOr<dynamic> Function()? onCancel,
  }) {
    if (_freeLoaderCompleter != null) return;
    _freeLoaderCompleter = Completer<dynamic>();
    final freeLoadingFuture = _freeLoaderCompleter!.future;
    startLoading(
      future: freeLoadingFuture,
      config: config,
      onCancel: () {
        endFreeLoading();
        return onCancel?.call();
      },
    );
  }

  void endFreeLoading() {
    _freeLoaderCompleter?.complete(null);
    _freeLoaderCompleter = null;
  }

  Future<T> startLoading<T>({
    required Future<T> future,
    LoadingConfig config = const LoadingConfig(),
    FutureOr<dynamic> Function()? onCancel,
  }) async {
    final resolvedOperationId = getNextOperationId();

    final cancelableOperation =
        CancelableOperation.fromFuture(future, onCancel: () {
      emit(EventDrivenLoadingState(
          showing: false, operationId: resolvedOperationId));
      _mapOperation.remove(resolvedOperationId);
      return onCancel?.call();
    });
    _mapOperation[resolvedOperationId] = cancelableOperation;
    handleLoadingWithFuture(
      future: cancelableOperation.value,
      config: config,
      operationId: resolvedOperationId,
    );
    return cancelableOperation.value;
  }

  @protected
  void handleLoadingWithFuture({
    required Future<dynamic> future,
    required LoadingConfig config,
    required int operationId,
  }) async {
    emit(EventDrivenLoadingState(
      showing: true,
      config: config,
      operationId: operationId,
    ));
    return future.whenComplete(() {
      emit(EventDrivenLoadingState(
        showing: false,
        operationId: operationId,
      ));
      _mapOperation.remove(operationId);
    });
  }

  void cancelLoading({required int operationId}) {
    final operation = _mapOperation[operationId];
    if (operation != null) {
      operation.cancel();
      emit(EventDrivenLoadingState(
        showing: false,
        operationId: operationId,
      ));
      _mapOperation.remove(operationId);
    }
  }
}
