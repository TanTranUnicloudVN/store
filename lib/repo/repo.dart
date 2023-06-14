import 'dart:developer';

import 'package:api/api.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:store/environment.dart';
import 'package:store/model/app_model.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

class Repo {
  Future<List<AppModel?>?> getApps() async {
    List<AppModel?> listApps = [];
    try {
      final response = await Api(
        dio: Dio(
          BaseOptions(
            baseUrl: Environment().config!.clientUrl,
            sendTimeout: const Duration(seconds: 10),
            connectTimeout: const Duration(seconds: 30),
            receiveTimeout: const Duration(seconds: 30),
          ),
        ),
      ).getAppStoreControllerInAppApi().getListApp(
            xApiKey: "236977ED0A5D231C513701DA2B76EE56",
          );
      final data = response.data?.data;
      print(data);
      if (data != null) {
        final listItems = data.items?.toList() ?? [];
        for (var element in listItems) {
          String path = "${Environment().config!.clientUrl}${element.urlLogo}";
          log(path);
          final http.Response responseData = await http.get(
            Uri.parse(path),
          );
          final Uint8List uint8list = responseData.bodyBytes;
          final downloadApkUrl =
              "${Environment().config!.clientUrl}${element.url}";
          listApps.add(
            AppModel(
              name: element.name,
              packageName: element.domain,
              version: element.version,
              downloadUrl: downloadApkUrl,
              icon: uint8list,
            ),
          );
        }
      } else {
        return [];
      }
    } catch (e, t) {
      log(e.toString() + t.toString());
      return [];
    }
    log(listApps.toString());
    return listApps;
  }
}
