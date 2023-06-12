import 'package:test/test.dart';
import 'package:api/api.dart';


/// tests for AppStoreControllerInAppApi
void main() {
  final instance = Api().getAppStoreControllerInAppApi();

  group(AppStoreControllerInAppApi, () {
    // Lấy danh sách app
    //
    //Future<ResponseBaseAppStoreDetailResponse> getDetailApp(String xApiKey, String id) async
    test('test getDetailApp', () async {
      // TODO
    });

    // Lấy danh sách app
    //
    //Future<ResponseBasePageResponseAppStoreInfoResponse> getListApp(String xApiKey, { String keyword, int page, int pageSize, String sortDirection, String sortBy }) async
    test('test getListApp', () async {
      // TODO
    });

  });
}
