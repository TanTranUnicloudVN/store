import 'dart:io';

import 'package:bloc_notification/bloc_notification.dart';
import 'package:device_apps/device_apps.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/model/app_model.dart';
import 'package:store/presentation/home/blocs/app_cubit.dart';
import 'package:store/presentation/home/blocs/app_noti.dart';
import 'package:store/presentation/home/blocs/app_state.dart';
import 'package:store/presentation/splash/blocs/splash_cubit.dart';
import 'package:store/presentation/splash/blocs/splash_state.dart';
import 'package:store/presentation/widgets/pos_dialog.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Colors.black12,
        appBar: AppBar(
          toolbarHeight: 84,
          backgroundColor: Colors.transparent,
          title: Text("List Applications"),
          centerTitle: true,
          elevation: 0,
          leading: const SizedBox.shrink(),
          actions: [
            IconButton(
                onPressed: () {
                  exit(0);
                },
                icon: const Icon(Icons.exit_to_app))
          ],
        ),
        body: SafeArea(
          child: BlocNotificationListener<AppProgressCubit, AppProgressState,
              AppNoti>(
            notificationListener: (context, noti) {
              if (noti is AppNotiInstallFailed) {
                if (ModalRoute.of(context)?.isCurrent != true) {
                  Navigator.of(context).pop();
                }

                AppDialog.showOneButtonDialog(context, title: "Failed");
              }
              if (noti is AppNotiInstallSuccess) {
                if (ModalRoute.of(context)?.isCurrent != true) {
                  Navigator.of(context).pop();
                }

                AppDialog.showOneButtonDialog(context, title: "Success");
              }
            },
            child: Center(
              child: BlocBuilder<SplashCubit, SplashState>(
                buildWhen: (prev, current) {
                  return prev.rebuild != current.rebuild;
                },
                builder: (context, state) => ListView.builder(
                  itemCount: state.apps?.length,
                  itemBuilder: (context, index) {
                    String appStatus = "Unknown status";
                    Color appStatusColor = Colors.red;

                    String textAction = "";
                    Color actionColor = Colors.red;
                    Future<void> Function() action = () async {};
                    switch (state.apps?[index]?.appStatus) {
                      case AppStatus.installed:
                        appStatus = "Installed";
                        appStatusColor = Colors.green;
                        textAction = "OPEN";
                        actionColor = Colors.green;
                        action = () async {
                          await DeviceApps.openApp(
                                  state.apps?[index]?.packageName ?? "")
                              .then((isOpen) {
                            if (!isOpen) {
                              AppDialog.showOneButtonDialog(
                                context,
                                content: "Cannot open application",
                              );
                            }
                          });
                        };
                        break;
                      case AppStatus.notInstalled:
                        appStatus = "Not installed";
                        appStatusColor = Colors.orange;
                        textAction = "INSTALL";
                        actionColor = Colors.blueAccent;
                        action = () async {
                          AppDialog.showInstallApp(
                            context,
                            url: state.apps?[index]?.downloadUrl ?? "",
                            domain: state.apps?[index]?.packageName ?? "",
                          );
                        };
                        break;
                      case AppStatus.notAllowed:
                        appStatus = "Not allowed";
                        appStatusColor = Colors.redAccent;
                        textAction = "REMOVE";
                        actionColor = Colors.orange;
                        action = () async {
                          await DeviceApps.uninstallApp(
                                  state.apps?[index]?.packageName ?? "")
                              .then((isWorking) {
                            if (!isWorking) {
                              AppDialog.showOneButtonDialog(
                                context,
                                content: "Cannot uninstall application",
                              );
                            }
                          });
                        };
                        break;
                      case AppStatus.haveUpdate:
                        appStatus = "Need update";
                        appStatusColor = Colors.blueAccent;
                        textAction = "UPDATE";
                        actionColor = Colors.blueAccent;
                        action = () async {
                          AppDialog.showInstallApp(
                            context,
                            url: state.apps?[index]?.downloadUrl ?? "",
                            domain: state.apps?[index]?.packageName ?? "",
                          );
                        };
                        break;
                      default:
                        break;
                    }
                    return Container(
                      margin: const EdgeInsets.all(8),
                      padding: const EdgeInsets.all(8),
                      height: 160,
                      width: 320,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                        border: Border.all(width: 1, color: Colors.black54),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          /// Container application icon
                          Container(
                            height: 64,
                            width: 64,
                            margin: const EdgeInsets.only(right: 12),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.white,
                            ),

                            /// Setup icon application
                            child: state.apps?[index]?.icon != null
                                ? Image.memory(state.apps![index]!.icon!)
                                : const SizedBox.shrink(),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 200,

                                /// Setup application name
                                child: Text(
                                  state.apps?[index]?.name ??
                                      "Unknown Application",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 200,

                                /// Setup allication version
                                child: Text(
                                  state.apps?[index]?.version ??
                                      "Unknown version",
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.black87,
                                  ),
                                ),
                              ),
                              Text(
                                appStatus,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: appStatusColor,
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () async {
                                  await action.call();
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: actionColor,
                                ),
                                child: SizedBox(
                                  width: 120,
                                  height: 24,
                                  child: Center(
                                    child: Text(
                                      textAction,
                                      style: const TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
