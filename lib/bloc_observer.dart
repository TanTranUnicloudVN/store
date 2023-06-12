import "dart:developer" as developer;
import "package:bloc/bloc.dart";
import "package:bloc_notification/bloc_notification.dart";

/// Black: \x1B[30m
/// !Red: \x1B[31m
/// *Green: \x1B[32m
/// Yellow: \x1B[33m
/// ?Blue: \u001b[34m
/// Magenta: \x1B[35m
/// Cyan: \x1B[36m
/// White: \x1B[37m
/// Reset: \x1B[0m

class AppBlocObserver extends BlocObserver with NotificationObserverMixin {
  final String blocObserverStr = "BLOC";

  @override
  void onNotification(
      BlocBase<dynamic> bloc, BlocNotification<dynamic> notification) {
    developer.log(
        "${DateTime.now().microsecondsSinceEpoch} \x1B[33m[${bloc.runtimeType}]\x1B[0m[Notification]: \x1B[36m${notification.notification.runtimeType}\x1B[0m",
        name: blocObserverStr);
    super.onNotification(bloc, notification);
  }

  @override
  void onCreate(BlocBase<dynamic> bloc) {
    developer.log(
        "\x1B[33mInit ${DateTime.now().microsecondsSinceEpoch} ${bloc.runtimeType}",
        name: blocObserverStr);
    super.onCreate(bloc);
  }

  @override
  void onClose(BlocBase<dynamic> bloc) {
    developer.log(
        "\x1B[31mClose ${DateTime.now().microsecondsSinceEpoch} ${bloc.runtimeType}",
        name: blocObserverStr);
    super.onClose(bloc);
  }

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    developer.log(
        "${DateTime.now().microsecondsSinceEpoch} \x1B[33m[${bloc.runtimeType}]\x1B[0m[Change]: \x1B[36m${change.currentState}\x1B[0m => \x1B[32m${change.nextState}\x1B[0m",
        name: blocObserverStr);
    super.onChange(bloc, change);
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    developer.log(
        "${DateTime.now().microsecondsSinceEpoch} \x1B[33m[${bloc.runtimeType}]\x1B[0m\x1B[31m[Error]\x1B[0m: \x1B[31m$error\x1B[0m => stackTrace: $stackTrace",
        name: blocObserverStr);
    super.onError(bloc, error, stackTrace);
  }

  @override
  // Only on Bloc (not cubit)
  void onEvent(Bloc<dynamic, dynamic> bloc, Object? event) {
    developer.log(
        "${DateTime.now().microsecondsSinceEpoch} \x1B[33m[${bloc.runtimeType}]\x1B[0m\x1B[35m[Event]\x1B[0m: $event",
        name: blocObserverStr);
    super.onEvent(bloc, event);
  }

  @override
  // Only on Bloc (not cubit)
  void onTransition(
      Bloc<dynamic, dynamic> bloc, Transition<dynamic, dynamic> transition) {
    developer.log(
        "${DateTime.now().microsecondsSinceEpoch} \x1B[33m[${bloc.runtimeType}]\x1B[0m\x1B[37m[Transition]\x1B[0m : \x1B[36m${transition.currentState}\x1B[0m -> ${transition.event} => \x1B[32m${transition.nextState}\x1B[0m",
        name: blocObserverStr);
    super.onTransition(bloc, transition);
  }
}
