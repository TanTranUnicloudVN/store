# api (EXPERIMENTAL)
TCMS-Service API

This Dart package is automatically generated by the [OpenAPI Generator](https://openapi-generator.tech) project:

- API version: v1
- Build package: org.openapitools.codegen.languages.DartDioClientCodegen

## Requirements

* Dart 2.15.0+ or Flutter 2.8.0+
* Dio 5.0.0+ (https://pub.dev/packages/dio)

## Installation & Usage

### pub.dev
To use the package from [pub.dev](https://pub.dev), please include the following in pubspec.yaml
```yaml
dependencies:
  api: 1.0.0
```

### Github
If this Dart package is published to Github, please include the following in pubspec.yaml
```yaml
dependencies:
  api:
    git:
      url: https://github.com/GIT_USER_ID/GIT_REPO_ID.git
      #ref: main
```

### Local development
To use the package from your local drive, please include the following in pubspec.yaml
```yaml
dependencies:
  api:
    path: /path/to/api
```

## Getting Started

Please follow the [installation procedure](#installation--usage) and then run the following:

```dart
import 'package:api/api.dart';


final api = Api().getAppStoreControllerInAppApi();
final String xApiKey = xApiKey_example; // String | 
final String id = id_example; // String | 

try {
    final response = await api.getDetailApp(xApiKey, id);
    print(response);
} catch on DioError (e) {
    print("Exception when calling AppStoreControllerInAppApi->getDetailApp: $e\n");
}

```

## Documentation for API Endpoints

All URIs are relative to *https://rd-api.hcm.unicloud.ai/pos*

Class | Method | HTTP request | Description
------------ | ------------- | ------------- | -------------
[*AppStoreControllerInAppApi*](doc/AppStoreControllerInAppApi.md) | [**getDetailApp**](doc/AppStoreControllerInAppApi.md#getdetailapp) | **GET** /api/appStoreDevice/v1/getDetailApp/{id} | Lấy danh sách app
[*AppStoreControllerInAppApi*](doc/AppStoreControllerInAppApi.md) | [**getListApp**](doc/AppStoreControllerInAppApi.md#getlistapp) | **GET** /api/appStoreDevice/v1/getListApp | Lấy danh sách app


## Documentation For Models

 - [AppStoreDetailResponse](doc/AppStoreDetailResponse.md)
 - [AppStoreInfoResponse](doc/AppStoreInfoResponse.md)
 - [PageResponseAppStoreInfoResponse](doc/PageResponseAppStoreInfoResponse.md)
 - [ResponseBaseAppStoreDetailResponse](doc/ResponseBaseAppStoreDetailResponse.md)
 - [ResponseBaseObject](doc/ResponseBaseObject.md)
 - [ResponseBasePageResponseAppStoreInfoResponse](doc/ResponseBasePageResponseAppStoreInfoResponse.md)


## Documentation For Authorization


## Bearer

- **Type**: HTTP basic authentication


## Author



