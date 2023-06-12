# api.api.AppStoreControllerInAppApi

## Load the API package
```dart
import 'package:api/api.dart';
```

All URIs are relative to *https://rd-api.hcm.unicloud.ai/pos*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getDetailApp**](AppStoreControllerInAppApi.md#getdetailapp) | **GET** /api/appStoreDevice/v1/getDetailApp/{id} | Lấy danh sách app
[**getListApp**](AppStoreControllerInAppApi.md#getlistapp) | **GET** /api/appStoreDevice/v1/getListApp | Lấy danh sách app


# **getDetailApp**
> ResponseBaseAppStoreDetailResponse getDetailApp(xApiKey, id)

Lấy danh sách app

### Example
```dart
import 'package:api/api.dart';

final api = Api().getAppStoreControllerInAppApi();
final String xApiKey = xApiKey_example; // String | 
final String id = id_example; // String | 

try {
    final response = api.getDetailApp(xApiKey, id);
    print(response);
} catch on DioError (e) {
    print('Exception when calling AppStoreControllerInAppApi->getDetailApp: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **xApiKey** | **String**|  | 
 **id** | **String**|  | 

### Return type

[**ResponseBaseAppStoreDetailResponse**](ResponseBaseAppStoreDetailResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getListApp**
> ResponseBasePageResponseAppStoreInfoResponse getListApp(xApiKey, keyword, page, pageSize, sortDirection, sortBy)

Lấy danh sách app

### Example
```dart
import 'package:api/api.dart';

final api = Api().getAppStoreControllerInAppApi();
final String xApiKey = xApiKey_example; // String | 
final String keyword = keyword_example; // String | 
final int page = 56; // int | 
final int pageSize = 56; // int | 
final String sortDirection = sortDirection_example; // String | 
final String sortBy = sortBy_example; // String | 

try {
    final response = api.getListApp(xApiKey, keyword, page, pageSize, sortDirection, sortBy);
    print(response);
} catch on DioError (e) {
    print('Exception when calling AppStoreControllerInAppApi->getListApp: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **xApiKey** | **String**|  | 
 **keyword** | **String**|  | [optional] 
 **page** | **int**|  | [optional] 
 **pageSize** | **int**|  | [optional] 
 **sortDirection** | **String**|  | [optional] 
 **sortBy** | **String**|  | [optional] 

### Return type

[**ResponseBasePageResponseAppStoreInfoResponse**](ResponseBasePageResponseAppStoreInfoResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

