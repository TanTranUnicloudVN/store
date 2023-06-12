//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:api/src/model/page_response_app_store_info_response.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'response_base_page_response_app_store_info_response.g.dart';

/// ResponseBasePageResponseAppStoreInfoResponse
///
/// Properties:
/// * [code] 
/// * [message] 
/// * [data] 
@BuiltValue()
abstract class ResponseBasePageResponseAppStoreInfoResponse implements Built<ResponseBasePageResponseAppStoreInfoResponse, ResponseBasePageResponseAppStoreInfoResponseBuilder> {
  @BuiltValueField(wireName: r'code')
  int? get code;

  @BuiltValueField(wireName: r'message')
  String? get message;

  @BuiltValueField(wireName: r'data')
  PageResponseAppStoreInfoResponse? get data;

  ResponseBasePageResponseAppStoreInfoResponse._();

  factory ResponseBasePageResponseAppStoreInfoResponse([void updates(ResponseBasePageResponseAppStoreInfoResponseBuilder b)]) = _$ResponseBasePageResponseAppStoreInfoResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ResponseBasePageResponseAppStoreInfoResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ResponseBasePageResponseAppStoreInfoResponse> get serializer => _$ResponseBasePageResponseAppStoreInfoResponseSerializer();
}

class _$ResponseBasePageResponseAppStoreInfoResponseSerializer implements PrimitiveSerializer<ResponseBasePageResponseAppStoreInfoResponse> {
  @override
  final Iterable<Type> types = const [ResponseBasePageResponseAppStoreInfoResponse, _$ResponseBasePageResponseAppStoreInfoResponse];

  @override
  final String wireName = r'ResponseBasePageResponseAppStoreInfoResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ResponseBasePageResponseAppStoreInfoResponse object, {
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
        specifiedType: const FullType(PageResponseAppStoreInfoResponse),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ResponseBasePageResponseAppStoreInfoResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ResponseBasePageResponseAppStoreInfoResponseBuilder result,
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
            specifiedType: const FullType(PageResponseAppStoreInfoResponse),
          ) as PageResponseAppStoreInfoResponse;
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
  ResponseBasePageResponseAppStoreInfoResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ResponseBasePageResponseAppStoreInfoResponseBuilder();
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

