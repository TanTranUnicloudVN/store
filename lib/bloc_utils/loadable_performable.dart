import '../loadings/loadings.dart';
import 'cancelable_performer.dart';
import 'loadable_performable_mixin.dart';
import 'package:bloc/bloc.dart';

abstract class LoadablePerformerBloc<Event, State> extends Bloc<Event, State>
    with CancelablePerformer, LoadablePerformable {
  LoadablePerformerBloc({
    required State initialState,
    required this.loadingManager,
  }) : super(initialState);

  @override
  final LoadingManager loadingManager;
}

abstract class LoadablePerformerCubit<State> extends Cubit<State>
    with CancelablePerformer, LoadablePerformable {
  LoadablePerformerCubit({
    required State initialState,
    required this.loadingManager,
  }) : super(initialState);

  @override
  final LoadingManager loadingManager;
}
