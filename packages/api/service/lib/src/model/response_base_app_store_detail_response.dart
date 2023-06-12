//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:api/src/model/app_store_detail_response.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'response_base_app_store_detail_response.g.dart';

/// ResponseBaseAppStoreDetailResponse
///
/// Properties:
/// * [code] 
/// * [message] 
/// * [data] 
@BuiltValue()
abstract class ResponseBaseAppStoreDetailResponse implements Built<ResponseBaseAppStoreDetailResponse, ResponseBaseAppStoreDetailResponseBuilder> {
  @BuiltValueField(wireName: r'code')
  int? get code;

  @BuiltValueField(wireName: r'message')
  String? get message;

  @BuiltValueField(wireName: r'data')
  AppStoreDetailResponse? get data;

  ResponseBaseAppStoreDetailResponse._();

  factory ResponseBaseAppStoreDetailResponse([void updates(ResponseBaseAppStoreDetailResponseBuilder b)]) = _$ResponseBaseAppStoreDetailResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ResponseBaseAppStoreDetailResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ResponseBaseAppStoreDetailResponse> get serializer => _$ResponseBaseAppStoreDetailResponseSerializer();
}

class _$ResponseBaseAppStoreDetailResponseSerializer implements PrimitiveSerializer<ResponseBaseAppStoreDetailResponse> {
  @override
  final Iterable<Type> types = const [ResponseBaseAppStoreDetailResponse, _$ResponseBaseAppStoreDetailResponse];

  @override
  final String wireName = r'ResponseBaseAppStoreDetailResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ResponseBaseAppStoreDetailResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.code != null) {
      yield r'code';
      yield serializers.serialize(
        object.code,
        specifiedType: const FullType(int),
      );
    }
    if (object.message != null) {
      yield r'message';
      yield serializers.serialize(
        object.message,
        specifiedType: const FullType(String),
      );
    }
    if (object.data != null) {
      yield r'data';
      yield serializers.serialize(
        object.data,
        specifiedType: const FullType(AppStoreDetailResponse),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ResponseBaseAppStoreDetailResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ResponseBaseAppStoreDetailResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'code':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.code = valueDes;
          break;
        case r'message':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.message = valueDes;
          break;
        case r'data':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(AppStoreDetailResponse),
          ) as AppStoreDetailResponse;
          result.data.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ResponseBaseAppStoreDetailResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ResponseBaseAppStoreDetailResponseBuilder();
    final serializedList = (serialized as Iterable<Object?>).toList();
    final unhandled = <Object?>[];
    _deserializeProperties(
      serializers,
      serialized,
      specifiedType: specifiedType,
      serializedList: serializedList,
      unhandled: unhandled,
      result: result,
    );
    return result.build();
  }
}

