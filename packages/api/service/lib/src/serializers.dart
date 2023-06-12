//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_import

import 'package:one_of_serializer/any_of_serializer.dart';
import 'package:one_of_serializer/one_of_serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:built_value/iso_8601_date_time_serializer.dart';
import 'package:api/src/date_serializer.dart';
import 'package:api/src/model/date.dart';

import 'package:api/src/model/app_store_detail_response.dart';
import 'package:api/src/model/app_store_info_response.dart';
import 'package:api/src/model/page_response_app_store_info_response.dart';
import 'package:api/src/model/response_base_app_store_detail_response.dart';
import 'package:api/src/model/response_base_object.dart';
import 'package:api/src/model/response_base_page_response_app_store_info_response.dart';

part 'serializers.g.dart';

@SerializersFor([
  AppStoreDetailResponse,
  AppStoreInfoResponse,
  PageResponseAppStoreInfoResponse,
  ResponseBaseAppStoreDetailResponse,
  ResponseBaseObject,
  ResponseBasePageResponseAppStoreInfoResponse,
])
Serializers serializers = (_$serializers.toBuilder()
      ..add(const OneOfSerializer())
      ..add(const AnyOfSerializer())
      ..add(const DateSerializer())
      ..add(Iso8601DateTimeSerializer()))
    .build();

Serializers standardSerializers =
    (serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
