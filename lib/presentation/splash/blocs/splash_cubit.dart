import 'dart:async';

import 'package:bloc_notification/bloc_notification.dart';
import 'package:device_apps/device_apps.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:store/model/app_model.dart';
import 'package:store/presentation/splash/blocs/splash_noti.dart';
import 'package:store/presentation/splash/blocs/splash_state.dart';
import 'package:store/repo/repo.dart';
import 'package:store/bloc_utils/loadable_performable.dart';

class SplashCubit extends LoadablePerformerCubit<SplashState>
    with BlocNotificationMixin<SplashState, SplashNoti> {
  SplashCubit({
    required super.initialState,
    required super.loadingManager,
  });

  StreamSubscription? streamLocalAppData;

  @override
  close() async {
    streamLocalAppData?.cancel();
    super.close();
  }

  Future<bool> checkPermission() async {
    try {
      await Future.delayed(const Duration(milliseconds: 200));
      final installStatus = await Permission.requestInstallPackages.status;
      if (!installStatus.isGranted) {
        final requestInstall =
            await Permission.requestInstallPackages.request();
        if (requestInstall != PermissionStatus.granted) {
          notify(
              const SplashNotiFailed(errorType: ErrorType.missingPermission));
          return false;
        }
      }

      final storeStatus = await Permission.accessMediaLocation.status;
      if (!storeStatus.isGranted) {
        final requestStore = await Permission.accessMediaLocation.request();

        if (requestStore != PermissionStatus.granted) {
          notify(
              const SplashNotiFailed(errorType: ErrorType.missingPermission));
          return false;
        }
      }
      notify(const SplashNotiHavePermission());
      return true;
    } catch (e) {
      notify(const SplashNotiFailed(errorType: ErrorType.missingPermission));
      return false;
    }
  }

  Future<bool> getApps() async {
    try {
      List<AppModel?> apps = [];
      final localAppsGotten = await perform(
          future:
              DeviceApps.getInstalledApplications(includeSystemApps: false));

      List<ApplicationWithIcon?> localAppsWithIcon = [];

      streamLocalAppData = DeviceApps.listenToAppsChanges()
          .asBroadcastStream()
          .listen((event) {});

      for (var element in localAppsGotten) {
        if (element.packageName != 'vn.com.unicloud.store') {
          final ApplicationWithIcon app = await perform(
                  future: DeviceApps.getApp(element.packageName, true))
              as ApplicationWithIcon;
          // print(app);
          localAppsWithIcon.add(app);
        }
      }

      final serverApps = await perform(future: Repo().getApps()) ?? [];
      for (var element in serverApps) {
        final localApp = localAppsWithIcon.firstWhere((e) {
          return e?.appName == element?.name &&
              e?.packageName == element?.packageName;
        }, orElse: () => null);
        localAppsWithIcon.removeWhere((e) {
          return e?.appName == localApp?.appName &&
              e?.packageName == localApp?.packageName;
        });

        final bool isInstalled = localApp != null;
        final bool haveUpdate =
            localApp != null ? localApp.versionName != element?.version : false;

        AppStatus status = AppStatus.notInstalled;
        if (isInstalled) {
          status = AppStatus.installed;
        }
        if (haveUpdate) {
          status = AppStatus.haveUpdate;
        }

        apps.add(
          AppModel(
            name: element?.name,
            packageName: element?.packageName,
            version: localApp?.versionName ?? element?.version,
            appStatus: status,
            icon: element?.icon,
            downloadUrl: element?.downloadUrl,
          ),
        );
      }

      for (var element in localAppsWithIcon) {
        apps.add(
          AppModel(
            name: element?.appName,
            packageName: element?.packageName,
            version: element?.versionName,
            icon: element?.icon,
            appStatus: AppStatus.notAllowed,
          ),
        );
      }

      emit(state.copyWith(apps: apps));
      startStreamLocalAppData();
      notify(const SplashNotiSuccess());
      return true;
    } catch (e) {
      notify(const SplashNotiFailed(errorType: ErrorType.networkError));
      return false;
    }
  }

  startStreamLocalAppData() async {
    streamLocalAppData?.onData((event) async {
      final String packageName = event.packageName;
      final currentApp = state.apps?.firstWhere(
        (element) {
          return element?.packageName == packageName;
        },
        orElse: () => null,
      );
      final app =
          await performWithLoading(future: DeviceApps.getApp(packageName));
      if (app == null && currentApp?.appStatus == AppStatus.notAllowed) {
        var tempApps = state.apps;
        tempApps?.removeWhere((element) {
          return element == currentApp;
        });
        emit(state.copyWith(apps: tempApps, rebuild: !(state.rebuild ?? true)));
      }

      if (app != null && currentApp?.appStatus == AppStatus.notInstalled) {
        var tempApps = state.apps;
        tempApps?.removeWhere((element) {
          return element == currentApp;
        });
        tempApps?.add(
          AppModel(
            name: app.appName,
            packageName: app.packageName,
            version: app.versionName,
            appStatus: AppStatus.installed,
          ),
        );
        emit(state.copyWith(apps: tempApps, rebuild: !(state.rebuild ?? true)));
      }

      if (app != null && currentApp?.appStatus == AppStatus.haveUpdate) {
        var tempApps = state.apps;
        tempApps?.removeWhere((element) {
          return element == currentApp;
        });
        tempApps?.add(
          AppModel(
            name: app.appName,
            packageName: app.packageName,
            version: app.versionName,
            appStatus: AppStatus.installed,
          ),
        );
        emit(state.copyWith(apps: tempApps, rebuild: !(state.rebuild ?? true)));
      }
    });
    try {
      return true;
    } catch (e) {
      return false;
    }
  }
}
