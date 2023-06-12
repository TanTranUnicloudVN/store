// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_base_object.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ResponseBaseObject extends ResponseBaseObject {
  @override
  final int? code;
  @override
  final String? message;
  @override
  final JsonObject? data;

  factory _$ResponseBaseObject(
          [void Function(ResponseBaseObjectBuilder)? updates]) =>
      (new ResponseBaseObjectBuilder()..update(updates))._build();

  _$ResponseBaseObject._({this.code, this.message, this.data}) : super._();

  @override
  ResponseBaseObject rebuild(
          void Function(ResponseBaseObjectBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ResponseBaseObjectBuilder toBuilder() =>
      new ResponseBaseObjectBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ResponseBaseObject &&
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
    return (newBuiltValueToStringHelper(r'ResponseBaseObject')
          ..add('code', code)
          ..add('message', message)
          ..add('data', data))
        .toString();
  }
}

class ResponseBaseObjectBuilder
    implements Builder<ResponseBaseObject, ResponseBaseObjectBuilder> {
  _$ResponseBaseObject? _$v;

  int? _code;
  int? get code => _$this._code;
  set code(int? code) => _$this._code = code;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  JsonObject? _data;
  JsonObject? get data => _$this._data;
  set data(JsonObject? data) => _$this._data = data;

  ResponseBaseObjectBuilder() {
    ResponseBaseObject._defaults(this);
  }

  ResponseBaseObjectBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _code = $v.code;
      _message = $v.message;
      _data = $v.data;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ResponseBaseObject other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ResponseBaseObject;
  }

  @override
  void update(void Function(ResponseBaseObjectBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ResponseBaseObject build() => _build();

  _$ResponseBaseObject _build() {
    final _$result = _$v ??
        new _$ResponseBaseObject._(code: code, message: message, data: data);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
