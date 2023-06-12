//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:api/src/model/app_store_info_response.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'page_response_app_store_info_response.g.dart';

/// PageResponseAppStoreInfoResponse
///
/// Properties:
/// * [pageNumber] 
/// * [pageSize] 
/// * [totalSize] 
/// * [totalPage] 
/// * [items] 
@BuiltValue()
abstract class PageResponseAppStoreInfoResponse implements Built<PageResponseAppStoreInfoResponse, PageResponseAppStoreInfoResponseBuilder> {
  @BuiltValueField(wireName: r'pageNumber')
  int? get pageNumber;

  @BuiltValueField(wireName: r'pageSize')
  int? get pageSize;

  @BuiltValueField(wireName: r'totalSize')
  int? get totalSize;

  @BuiltValueField(wireName: r'totalPage')
  int? get totalPage;

  @BuiltValueField(wireName: r'items')
  BuiltList<AppStoreInfoResponse>? get items;

  PageResponseAppStoreInfoResponse._();

  factory PageResponseAppStoreInfoResponse([void updates(PageResponseAppStoreInfoResponseBuilder b)]) = _$PageResponseAppStoreInfoResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PageResponseAppStoreInfoResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<PageResponseAppStoreInfoResponse> get serializer => _$PageResponseAppStoreInfoResponseSerializer();
}

class _$PageResponseAppStoreInfoResponseSerializer implements PrimitiveSerializer<PageResponseAppStoreInfoResponse> {
  @override
  final Iterable<Type> types = const [PageResponseAppStoreInfoResponse, _$PageResponseAppStoreInfoResponse];

  @override
  final String wireName = r'PageResponseAppStoreInfoResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PageResponseAppStoreInfoResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.pageNumber != null) {
      yield r'pageNumber';
      yield serializers.serialize(
        object.pageNumber,
        specifiedType: const FullType(int),
      );
    }
    if (object.pageSize != null) {
      yield r'pageSize';
      yield serializers.serialize(
        object.pageSize,
        specifiedType: const FullType(int),
      );
    }
    if (object.totalSize != null) {
      yield r'totalSize';
      yield serializers.serialize(
        object.totalSize,
        specifiedType: const FullType(int),
      );
    }
    if (object.totalPage != null) {
      yield r'totalPage';
      yield serializers.serialize(
        object.totalPage,
        specifiedType: const FullType(int),
      );
    }
    if (object.items != null) {
      yield r'items';
      yield serializers.serialize(
        object.items,
        specifiedType: const FullType(BuiltList, [FullType(AppStoreInfoResponse)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    PageResponseAppStoreInfoResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required PageResponseAppStoreInfoResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'pageNumber':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.pageNumber = valueDes;
          break;
        case r'pageSize':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.pageSize = valueDes;
          break;
        case r'totalSize':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.totalSize = valueDes;
          break;
        case r'totalPage':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.totalPage = valueDes;
          break;
        case r'items':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(AppStoreInfoResponse)]),
          ) as BuiltList<AppStoreInfoResponse>;
          result.items.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  PageResponseAppStoreInfoResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PageResponseAppStoreInfoResponseBuilder();
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

