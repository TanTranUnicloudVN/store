import 'dart:convert';

import 'package:equatable/equatable.dart';

class AppProgressState extends Equatable {
  final String? apkName;
  final double? percent;
  const AppProgressState({
    this.apkName,
    this.percent,
  });

  AppProgressState copyWith({
    String? apkName,
    double? percent,
  }) {
    return AppProgressState(
      apkName: apkName ?? this.apkName,
      percent: percent ?? this.percent,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'apkName': apkName,
      'percent': percent,
    };
  }

  factory AppProgressState.fromMap(Map<String, dynamic> map) {
    return AppProgressState(
      apkName: map['apkName'] != null ? map['apkName'] as String : null,
      percent: map['percent'] != null ? map['percent'] as double : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory AppProgressState.fromJson(String source) =>
      AppProgressState.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [apkName, percent];
}
