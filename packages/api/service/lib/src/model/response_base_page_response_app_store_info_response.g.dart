// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_base_page_response_app_store_info_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ResponseBasePageResponseAppStoreInfoResponse
    extends ResponseBasePageResponseAppStoreInfoResponse {
  @override
  final int? code;
  @override
  final String? message;
  @override
  final PageResponseAppStoreInfoResponse? data;

  factory _$ResponseBasePageResponseAppStoreInfoResponse(
          [void Function(ResponseBasePageResponseAppStoreInfoResponseBuilder)?
              updates]) =>
      (new ResponseBasePageResponseAppStoreInfoResponseBuilder()
            ..update(updates))
          ._build();

  _$ResponseBasePageResponseAppStoreInfoResponse._(
      {this.code, this.message, this.data})
      : super._();

  @override
  ResponseBasePageResponseAppStoreInfoResponse rebuild(
          void Function(ResponseBasePageResponseAppStoreInfoResponseBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ResponseBasePageResponseAppStoreInfoResponseBuilder toBuilder() =>
      new ResponseBasePageResponseAppStoreInfoResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ResponseBasePageResponseAppStoreInfoResponse &&
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
    return (newBuiltValueToStringHelper(
            r'ResponseBasePageResponseAppStoreInfoResponse')
          ..add('code', code)
          ..add('message', message)
          ..add('data', data))
        .toString();
  }
}

class ResponseBasePageResponseAppStoreInfoResponseBuilder
    implements
        Builder<ResponseBasePageResponseAppStoreInfoResponse,
            ResponseBasePageResponseAppStoreInfoResponseBuilder> {
  _$ResponseBasePageResponseAppStoreInfoResponse? _$v;

  int? _code;
  int? get code => _$this._code;
  set code(int? code) => _$this._code = code;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  PageResponseAppStoreInfoResponseBuilder? _data;
  PageResponseAppStoreInfoResponseBuilder get data =>
      _$this._data ??= new PageResponseAppStoreInfoResponseBuilder();
  set data(PageResponseAppStoreInfoResponseBuilder? data) =>
      _$this._data = data;

  ResponseBasePageResponseAppStoreInfoResponseBuilder() {
    ResponseBasePageResponseAppStoreInfoResponse._defaults(this);
  }

  ResponseBasePageResponseAppStoreInfoResponseBuilder get _$this {
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
  void replace(ResponseBasePageResponseAppStoreInfoResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ResponseBasePageResponseAppStoreInfoResponse;
  }

  @override
  void update(
      void Function(ResponseBasePageResponseAppStoreInfoResponseBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  ResponseBasePageResponseAppStoreInfoResponse build() => _build();

  _$ResponseBasePageResponseAppStoreInfoResponse _build() {
    _$ResponseBasePageResponseAppStoreInfoResponse _$result;
    try {
      _$result = _$v ??
          new _$ResponseBasePageResponseAppStoreInfoResponse._(
              code: code, message: message, data: _data?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        _data?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ResponseBasePageResponseAppStoreInfoResponse',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
