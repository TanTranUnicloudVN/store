//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'dart:async';

import 'package:built_value/serializer.dart';
import 'package:dio/dio.dart';

import 'package:api/src/api_util.dart';
import 'package:api/src/model/response_base_app_store_detail_response.dart';
import 'package:api/src/model/response_base_object.dart';
import 'package:api/src/model/response_base_page_response_app_store_info_response.dart';

class AppStoreControllerInAppApi {
  final Dio _dio;

  final Serializers _serializers;

  const AppStoreControllerInAppApi(this._dio, this._serializers);

  /// Lấy danh sách app
  ///
  ///
  /// Parameters:
  /// * [xApiKey]
  /// * [id]
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [ResponseBaseAppStoreDetailResponse] as data
  /// Throws [DioError] if API call or serialization fails
  Future<Response<ResponseBaseAppStoreDetailResponse>> getDetailApp({
    required String xApiKey,
    required String id,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/api/appStoreDevice/v1/getDetailApp/{id}'
        .replaceAll('{' r'id' '}', id.toString());
    final _options = Options(
      method: r'GET',
      headers: <String, dynamic>{
        r'x-api-key': xApiKey,
        ...?headers,
      },
      extra: <String, dynamic>{
        'secure': <Map<String, String>>[],
        ...?extra,
      },
      validateStatus: validateStatus,
    );

    final _response = await _dio.request<Object>(
      _path,
      options: _options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    ResponseBaseAppStoreDetailResponse _responseData;

    try {
      const _responseType = FullType(ResponseBaseAppStoreDetailResponse);
      _responseData = _serializers.deserialize(
        _response.data!,
        specifiedType: _responseType,
      ) as ResponseBaseAppStoreDetailResponse;
    } catch (error, stackTrace) {
      throw DioError(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioErrorType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<ResponseBaseAppStoreDetailResponse>(
      data: _responseData,
      headers: _response.headers,
      isRedirect: _response.isRedirect,
      requestOptions: _response.requestOptions,
      redirects: _response.redirects,
      statusCode: _response.statusCode,
      statusMessage: _response.statusMessage,
      extra: _response.extra,
    );
  }

  /// Lấy danh sách app
  ///
  ///
  /// Parameters:
  /// * [xApiKey]
  /// * [keyword]
  /// * [page]
  /// * [pageSize]
  /// * [sortDirection]
  /// * [sortBy]
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [ResponseBasePageResponseAppStoreInfoResponse] as data
  /// Throws [DioError] if API call or serialization fails
  Future<Response<ResponseBasePageResponseAppStoreInfoResponse>> getListApp({
    required String xApiKey,
    String? keyword,
    int? page,
    int? pageSize,
    String? sortDirection,
    String? sortBy,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/api/appStoreDevice/v1/getListApp';
    final _options = Options(
      method: r'GET',
      headers: <String, dynamic>{
        r'x-api-key': xApiKey,
        ...?headers,
      },
      extra: <String, dynamic>{
        'secure': <Map<String, String>>[],
        ...?extra,
      },
      validateStatus: validateStatus,
    );

    final _queryParameters = <String, dynamic>{
      if (keyword != null)
        r'keyword':
            encodeQueryParameter(_serializers, keyword, const FullType(String)),
      if (page != null)
        r'page': encodeQueryParameter(_serializers, page, const FullType(int)),
      if (pageSize != null)
        r'pageSize':
            encodeQueryParameter(_serializers, pageSize, const FullType(int)),
      if (sortDirection != null)
        r'sortDirection': encodeQueryParameter(
            _serializers, sortDirection, const FullType(String)),
      if (sortBy != null)
        r'sortBy':
            encodeQueryParameter(_serializers, sortBy, const FullType(String)),
    };

    final _response = await _dio.request<Object>(
      _path,
      options: _options,
      queryParameters: _queryParameters,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    ResponseBasePageResponseAppStoreInfoResponse _responseData;

    try {
      const _responseType =
          FullType(ResponseBasePageResponseAppStoreInfoResponse);
      _responseData = _serializers.deserialize(
        _response.data!,
        specifiedType: _responseType,
      ) as ResponseBasePageResponseAppStoreInfoResponse;
    } catch (error, stackTrace) {
      throw DioError(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioErrorType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<ResponseBasePageResponseAppStoreInfoResponse>(
      data: _responseData,
      headers: _response.headers,
      isRedirect: _response.isRedirect,
      requestOptions: _response.requestOptions,
      redirects: _response.redirects,
      statusCode: _response.statusCode,
      statusMessage: _response.statusMessage,
      extra: _response.extra,
    );
  }
}
