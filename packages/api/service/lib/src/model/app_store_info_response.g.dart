// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_store_info_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AppStoreInfoResponse extends AppStoreInfoResponse {
  @override
  final String? id;
  @override
  final String? name;
  @override
  final String? version;
  @override
  final DateTime? createdAt;
  @override
  final String? urlLogo;
  @override
  final String? url;
  @override
  final String? domain;

  factory _$AppStoreInfoResponse(
          [void Function(AppStoreInfoResponseBuilder)? updates]) =>
      (new AppStoreInfoResponseBuilder()..update(updates))._build();

  _$AppStoreInfoResponse._(
      {this.id,
      this.name,
      this.version,
      this.createdAt,
      this.urlLogo,
      this.url,
      this.domain})
      : super._();

  @override
  AppStoreInfoResponse rebuild(
          void Function(AppStoreInfoResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AppStoreInfoResponseBuilder toBuilder() =>
      new AppStoreInfoResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AppStoreInfoResponse &&
        id == other.id &&
        name == other.name &&
        version == other.version &&
        createdAt == other.createdAt &&
        urlLogo == other.urlLogo &&
        url == other.url &&
        domain == other.domain;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, version.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, urlLogo.hashCode);
    _$hash = $jc(_$hash, url.hashCode);
    _$hash = $jc(_$hash, domain.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AppStoreInfoResponse')
          ..add('id', id)
          ..add('name', name)
          ..add('version', version)
          ..add('createdAt', createdAt)
          ..add('urlLogo', urlLogo)
          ..add('url', url)
          ..add('domain', domain))
        .toString();
  }
}

class AppStoreInfoResponseBuilder
    implements Builder<AppStoreInfoResponse, AppStoreInfoResponseBuilder> {
  _$AppStoreInfoResponse? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _version;
  String? get version => _$this._version;
  set version(String? version) => _$this._version = version;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  String? _urlLogo;
  String? get urlLogo => _$this._urlLogo;
  set urlLogo(String? urlLogo) => _$this._urlLogo = urlLogo;

  String? _url;
  String? get url => _$this._url;
  set url(String? url) => _$this._url = url;

  String? _domain;
  String? get domain => _$this._domain;
  set domain(String? domain) => _$this._domain = domain;

  AppStoreInfoResponseBuilder() {
    AppStoreInfoResponse._defaults(this);
  }

  AppStoreInfoResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _version = $v.version;
      _createdAt = $v.createdAt;
      _urlLogo = $v.urlLogo;
      _url = $v.url;
      _domain = $v.domain;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AppStoreInfoResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AppStoreInfoResponse;
  }

  @override
  void update(void Function(AppStoreInfoResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AppStoreInfoResponse build() => _build();

  _$AppStoreInfoResponse _build() {
    final _$result = _$v ??
        new _$AppStoreInfoResponse._(
            id: id,
            name: name,
            version: version,
            createdAt: createdAt,
            urlLogo: urlLogo,
            url: url,
            domain: domain);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
