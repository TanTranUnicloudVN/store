import 'dart:io';

import 'package:bloc_notification/bloc_notification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:store/presentation/home/home_screen.dart';
import 'package:store/presentation/splash/blocs/splash_cubit.dart';
import 'package:store/presentation/splash/blocs/splash_noti.dart';
import 'package:store/presentation/splash/blocs/splash_state.dart';
import 'package:store/presentation/widgets/pos_dialog.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getData(context);
    });
    super.initState();
  }

  Future getData(BuildContext context) async {
    Future.delayed(const Duration(milliseconds: 100));
    context.read<SplashCubit>().checkPermission();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: SizedBox(
            height: 200,
            child:
                BlocNotificationListener<SplashCubit, SplashState, SplashNoti>(
              notificationListener: (context, noti) {
                if (noti is SplashNotiFailed) {
                  if (noti.errorType == ErrorType.missingPermission) {
                    AppDialog.showOneButtonDialog(
                      context,
                      content: "Please allow all permissions",
                      onPressed: () {
                        context.read<SplashCubit>().checkPermission();
                      },
                    );
                  }
                  if (noti.errorType == ErrorType.networkError) {
                    AppDialog.showOneButtonDialog(
                      context,
                      content:
                          "Network Error, please check the internet connection",
                      onPressed: () {
                        context.read<SplashCubit>().checkPermission();
                      },
                    );
                  }
                  if (noti.errorType == null) {
                    AppDialog.showOneButtonDialog(
                      context,
                      content: "Application error",
                      onPressed: () {
                        exit(0);
                      },
                    );
                  }
                }
                if (noti is SplashNotiHavePermission) {
                  context.read<SplashCubit>().getApps();
                }
                if (noti is SplashNotiSuccess) {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return const HomeScreen();
                      },
                    ),
                  );
                }
              },
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Lottie.asset('assets/loading.json',
                    repeat: true, frameRate: FrameRate(60)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
