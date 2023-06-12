import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

enum AppStatus {
  installed,
  notInstalled,
  haveUpdate,
  notAllowed,
}

class AppModel extends Equatable {
  final String? name;
  final String? packageName;
  final String? version;
  final Uint8List? icon;
  final AppStatus? appStatus;
  final String? downloadUrl;

  const AppModel({
    this.name,
    this.packageName,
    this.version,
    this.icon,
    this.appStatus,
    this.downloadUrl = "",
  });

  AppModel copyWith({
    String? name,
    String? packageName,
    String? version,
    Uint8List? icon,
    AppStatus? appStatus,
    String? downloadUrl,
  }) {
    return AppModel(
      name: name ?? this.name,
      packageName: packageName ?? this.packageName,
      version: version ?? this.version,
      icon: icon ?? this.icon,
      appStatus: appStatus ?? this.appStatus,
      downloadUrl: downloadUrl ?? this.downloadUrl,
    );
  }

  @override
  bool? get stringify => true;
  @override
  List<Object?> get props {
    return [
      name,
      packageName,
      version,
      appStatus,
      downloadUrl,
    ];
  }
}
