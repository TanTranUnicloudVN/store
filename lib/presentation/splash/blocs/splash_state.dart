import 'package:equatable/equatable.dart';
import 'package:store/model/app_model.dart';

class SplashState extends Equatable {
  final List<AppModel?>? apps;
  final bool? rebuild;

  const SplashState({
    this.apps,
    this.rebuild,
  });

  SplashState copyWith({
    List<AppModel?>? apps,
    bool? rebuild,
  }) {
    return SplashState(
      apps: apps ?? this.apps,
      rebuild: rebuild ?? this.rebuild,
    );
  }

  @override
  bool? get stringify => true;
  @override
  List<Object?> get props => [apps, rebuild];
}
