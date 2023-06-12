import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:filesize/filesize.dart';
import 'package:flutter/foundation.dart';
import 'package:path/path.dart' as path;
import 'package:store/environment.dart';

class DioFileService {
  final String fileUrl;
  final Function(double?) onPercentChange;
  final Function(String?) onGetFileName;
  DioFileService({
    required this.fileUrl,
    required this.onPercentChange,
    required this.onGetFileName,
    required this.fileLocalRouteStr,
  });
  final String fileLocalRouteStr;
  Dio dio = Dio()
    ..options =
        BaseOptions(headers: {"x-api-key": Environment().config!.publicKey});
  Directory? dir;
  CancelToken cancelToken = CancelToken();
  List<int> sizes = [];

  deleteLocal() {
    onPercentChange(null);
    onGetFileName(null);
    dir!.deleteSync(recursive: true);
  }

  _checkOnLocal({
    required String fileUrl,
    required String fileLocalRouteStr,
  }) async {
    debugPrint('_checkOnLocal()...');
    onGetFileName('');
    File localFile = File(fileLocalRouteStr);
    String dir = path.dirname(fileLocalRouteStr);
    String basename = path.basenameWithoutExtension(fileLocalRouteStr);
    String extension = path.extension(fileLocalRouteStr);

    String localRouteToSaveFileStr = fileLocalRouteStr;
    sizes.clear();
    int sumSizes = 0;
    int fileOriginSize = 0;
    bool fullFile = false;

    Response response = await dio.head(fileUrl);
    fileOriginSize = int.parse(response.headers.value('content-length')!);
    log("Length of File $fileOriginSize");
    String localText = 'fileOriginSize: ${filesize(fileOriginSize)}\n\n';

    bool existsSync = localFile.existsSync();
    if (!existsSync) {
      localText += 'File "$basename$extension" does not exist \nin: "$dir"';
    } else {
      int fileLocalSize = localFile.lengthSync();
      sizes.add(fileLocalSize);
      localText +=
          'localFile: "$basename$extension", fileLocalSize: ${filesize(fileLocalSize)}';

      int i = 1;
      localRouteToSaveFileStr = '$dir/$basename' '_$i$extension';
      File f = File(localRouteToSaveFileStr);
      while (f.existsSync()) {
        int tSize = f.lengthSync();
        sizes.add(tSize);
        localText += '\nchunk: "$basename'
            '_$i$extension", fileLocalSize: ${filesize(tSize)}';
        i++;
        localRouteToSaveFileStr = '$dir/$basename' '_$i$extension';
        f = File(localRouteToSaveFileStr);
      }

      sumSizes = sizes.fold(0, (p, c) => p + c);
      localText +=
          '\n\nsize: ${filesize(sumSizes)}/${filesize(fileOriginSize)}';
      localText += '\nbytes: $sumSizes/$fileOriginSize';
      localText += '\n${(sumSizes / fileOriginSize * 100).toStringAsFixed(2)}%';
      fullFile = sumSizes == fileOriginSize;
    }
    double percent = sumSizes / fileOriginSize;
    onGetFileName(localText);
    onPercentChange(fullFile
        ? 1
        : percent == 0
            ? null
            : percent);
  }

  cacel() {
    cancelToken.cancel();
    onPercentChange(null);
    _checkOnLocal(fileUrl: fileUrl, fileLocalRouteStr: fileLocalRouteStr);
  }

  _onReceiveProgress(int received, int total) {
    int sum = sizes.fold(0, (p, c) => p + c);
    received += sum;

    onPercentChange(received / total);
  }

  download() async {
    onGetFileName(null);
    onPercentChange(0);

    await getItemFileWithProgress(
        fileUrl: fileUrl, fileLocalRouteStr: fileLocalRouteStr);
  }

  Future<File?> getItemFileWithProgress({
    required String fileUrl,
    required String fileLocalRouteStr,
  }) async {
    debugPrint('getItemFileWithProgress()...');

    File localFile = File(fileLocalRouteStr);
    String dir = path.dirname(fileLocalRouteStr);
    String basename = path.basenameWithoutExtension(fileLocalRouteStr);
    String extension = path.extension(fileLocalRouteStr);

    String localRouteToSaveFileStr = fileLocalRouteStr;
    sizes.clear();
    Response response = await dio.head(fileUrl);
    int fileOriginSize = int.parse(response.headers.value('content-length')!);
    Options? options;

    bool existsSync = localFile.existsSync();
    if (existsSync) {
      // Response response = await dio.head(fileUrl);
      // fileOriginSize = int.parse(response.headers.value('content-length')!);

      int fileLocalSize = localFile.lengthSync();
      sizes.add(fileLocalSize);

      int i = 1;
      localRouteToSaveFileStr = '$dir/$basename' '_$i$extension';
      File f = File(localRouteToSaveFileStr);
      while (f.existsSync()) {
        sizes.add(f.lengthSync());
        i++;
        localRouteToSaveFileStr = '$dir/$basename' '_$i$extension';
        f = File(localRouteToSaveFileStr);
      }

      int sumSizes = sizes.fold(0, (p, c) => p + c);
      if (sumSizes < fileOriginSize) {
        options = Options(
          headers: {'Range': 'bytes=$sumSizes-'},
        );
      } else {
        onPercentChange(1);

        if (sizes.length == 1) {
          _checkOnLocal(fileUrl: fileUrl, fileLocalRouteStr: fileLocalRouteStr);
          return localFile;
        }
      }
    }

    if (cancelToken.isCancelled) {
      cancelToken = CancelToken();
    }

    try {
      log("localRouteToSaveFileStr $localRouteToSaveFileStr");
      await dio.download(fileUrl, localRouteToSaveFileStr,
          options: options,
          cancelToken: cancelToken,
          deleteOnError: false,
          onReceiveProgress: (int received, int total) =>
              _onReceiveProgress(received, fileOriginSize));
    } catch (e) {
      debugPrint('..dio.download()...ERROR: "${e.toString()}"');
      return null;
    }

    if (existsSync) {
      debugPrint('[ALREADY DOWNLOADED - MERGING FILES]');
      var raf = await localFile.open(mode: FileMode.writeOnlyAppend);

      int i = 1;
      String filePartLocalRouteStr = '$dir/$basename' '_$i$extension';
      File f = File(filePartLocalRouteStr);
      while (f.existsSync()) {
        raf = await raf.writeFrom(await f.readAsBytes());
        await f.delete();

        i++;
        filePartLocalRouteStr = '$dir/$basename' '_$i$extension';
        f = File(filePartLocalRouteStr);
      }
      await raf.close();
    }

    _checkOnLocal(fileUrl: fileUrl, fileLocalRouteStr: fileLocalRouteStr);
    return localFile;
  }
}
