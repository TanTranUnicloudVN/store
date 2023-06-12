import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:nested/nested.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:store/app_blocs_inject.dart';
import 'package:store/bloc_observer.dart';
import 'package:store/environment.dart';
import 'package:store/global_key_provider/global_key_provider.dart';
import 'package:store/l10n/generated/l10n.dart';
import 'package:store/loadings/loadings.dart';
import 'package:store/presentation/splash/splash_screen.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  await initialSettingApp();
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  SystemChrome.setSystemUIChangeCallback((systemOverlaysAreVisible) async {
    if (systemOverlaysAreVisible) {
      Future.delayed(const Duration(seconds: 1),
          () => SystemChrome.restoreSystemUIOverlays());
    }
  });
  final installStatus = await Permission.requestInstallPackages.status;
  if (!installStatus.isGranted) {
    final requestInstall = await Permission.requestInstallPackages.request();
    if (requestInstall != PermissionStatus.granted) {
      exit(0);
    }
  }
  runApp(const App());
}

Future<void> initialSettingApp() async {
  Bloc.observer = AppBlocObserver();
  const String environment = String.fromEnvironment(
    "ENVIRONMENT",
    defaultValue: Environment.local,
  );

  log(environment, name: "ENVIRONMENT");

  Environment().initConfig(environment);
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return GlobalKeyProvider<NavigatorState>(
      child: Nested(
        children: const [
          LoadingHandler(),
          AppBlocsInject(),
        ],
        child: Builder(builder: (context) {
          return OverlaySupport(
            child: MaterialApp(
              title: "App Store",
              locale: Locale('en'),
              navigatorKey: GlobalKeyProvider.of<NavigatorState>(context),
              debugShowCheckedModeBanner: false,
              localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
              ],
              home: const SplashScreen(),
            ),
          );
        }),
      ),
    );
  }
}
