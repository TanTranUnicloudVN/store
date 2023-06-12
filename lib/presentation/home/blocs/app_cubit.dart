import 'dart:developer';
import 'dart:io';

import 'package:app_installer/app_installer.dart';
import 'package:bloc_notification/bloc_notification.dart';
import 'package:device_apps/device_apps.dart';
import 'package:store/environment.dart';
// import 'package:path_provider/path_provider.dart';
import 'package:store/presentation/home/blocs/app_noti.dart';
import 'package:store/presentation/home/blocs/app_state.dart';
import 'package:store/bloc_utils/loadable_performable.dart';
import 'package:store/repo/dio_file_service.dart';

class AppProgressCubit extends LoadablePerformerCubit<AppProgressState>
    with BlocNotificationMixin<AppProgressState, AppNoti> {
  AppProgressCubit({
    required super.initialState,
    required super.loadingManager,
  });

  Future download(String url) async {
    final file = File("${Environment().config!.saveLocalDataPath}/app.apk");
    if (file.existsSync()) {
      file.deleteSync(recursive: true);
    }
    if (!url.contains(".apk")) {
      log("FAIL - MISSING APK");
      notify(const AppNotiInstallFailed());
    } else {
      try {
        final Directory savePath =
            Directory(Environment().config!.saveLocalDataPath);
        savePath.createSync();
        await perform(
            future: DioFileService(
          fileUrl: url,
          fileLocalRouteStr: "${savePath.path}/app.apk",
          onGetFileName: (p0) {},
          onPercentChange: (p0) {
            emit(state.copyWith(percent: (p0 ?? 0).toDouble()));
          },
        ).download());

        await Future.delayed(const Duration(milliseconds: 200));
        if (state.percent == 1) {
          emit(state.copyWith(apkName: "app"));
        } else {
          notify(const AppNotiInstallFailed());
        }
      } catch (e) {
        notify(const AppNotiInstallFailed());
      }
    }
  }

  Future installApp(String domain) async {
    emit(state.copyWith(apkName: ''));
    await AppInstaller.installApk(
        "${Environment().config!.saveLocalDataPath}/app.apk");

    await DeviceApps.isAppInstalled(domain);
  }
}
