import 'package:async/async.dart';
import 'package:bloc/bloc.dart';

mixin CancelablePerformer<State> on BlocBase<State> {
  final Map<int, CancelableOperation<dynamic>> _operationMap = {};
  int _nextOperationId = 0;
  bool _closing = false;

  void _removeOperation(int id) {
    if (!_closing) {
      _operationMap.remove(id);
    }
  }

  Future<T> perform<T>({
    required Future<T> future,
    Function()? onCancel,
  }) {
    final id = _nextOperationId++;
    final operation = CancelableOperation<T>.fromFuture(future, onCancel: () {
      onCancel?.call();
      _removeOperation(id);
    });
    _operationMap[id] = operation;
    return operation.value.whenComplete(() => _removeOperation(id));
  }

  @override
  Future<void> close() {
    _closing = true;
    _operationMap.forEach((_, value) {
      if (!value.isCanceled) {
        value.cancel();
      }
    });
    return super.close();
  }
}
