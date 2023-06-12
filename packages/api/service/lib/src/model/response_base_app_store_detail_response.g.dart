// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_base_app_store_detail_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ResponseBaseAppStoreDetailResponse
    extends ResponseBaseAppStoreDetailResponse {
  @override
  final int? code;
  @override
  final String? message;
  @override
  final AppStoreDetailResponse? data;

  factory _$ResponseBaseAppStoreDetailResponse(
          [void Function(ResponseBaseAppStoreDetailResponseBuilder)?
              updates]) =>
      (new ResponseBaseAppStoreDetailResponseBuilder()..update(updates))
          ._build();

  _$ResponseBaseAppStoreDetailResponse._({this.code, this.message, this.data})
      : super._();

  @override
  ResponseBaseAppStoreDetailResponse rebuild(
          void Function(ResponseBaseAppStoreDetailResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ResponseBaseAppStoreDetailResponseBuilder toBuilder() =>
      new ResponseBaseAppStoreDetailResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ResponseBaseAppStoreDetailResponse &&
        code == other.code &&
        message == other.message &&
        data == other.data;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, code.hashCode);
    _$hash = $jc(_$hash, message.hashCode);
    _$hash = $jc(_$hash, data.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ResponseBaseAppStoreDetailResponse')
          ..add('code', code)
          ..add('message', message)
          ..add('data', data))
        .toString();
  }
}

class ResponseBaseAppStoreDetailResponseBuilder
    implements
        Builder<ResponseBaseAppStoreDetailResponse,
            ResponseBaseAppStoreDetailResponseBuilder> {
  _$ResponseBaseAppStoreDetailResponse? _$v;

  int? _code;
  int? get code => _$this._code;
  set code(int? code) => _$this._code = code;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  AppStoreDetailResponseBuilder? _data;
  AppStoreDetailResponseBuilder get data =>
      _$this._data ??= new AppStoreDetailResponseBuilder();
  set data(AppStoreDetailResponseBuilder? data) => _$this._data = data;

  ResponseBaseAppStoreDetailResponseBuilder() {
    ResponseBaseAppStoreDetailResponse._defaults(this);
  }

  ResponseBaseAppStoreDetailResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _code = $v.code;
      _message = $v.message;
      _data = $v.data?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ResponseBaseAppStoreDetailResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ResponseBaseAppStoreDetailResponse;
  }

  @override
  void update(
      void Function(ResponseBaseAppStoreDetailResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ResponseBaseAppStoreDetailResponse build() => _build();

  _$ResponseBaseAppStoreDetailResponse _build() {
    _$ResponseBaseAppStoreDetailResponse _$result;
    try {
      _$result = _$v ??
          new _$ResponseBaseAppStoreDetailResponse._(
              code: code, message: message, data: _data?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        _data?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ResponseBaseAppStoreDetailResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
