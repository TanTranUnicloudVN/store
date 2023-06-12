// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_store_detail_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AppStoreDetailResponse extends AppStoreDetailResponse {
  @override
  final String? id;
  @override
  final String? name;
  @override
  final String? version;
  @override
  final String? url;
  @override
  final String? domain;
  @override
  final DateTime? createdAt;
  @override
  final String? urlLogo;
  @override
  final String? description;

  factory _$AppStoreDetailResponse(
          [void Function(AppStoreDetailResponseBuilder)? updates]) =>
      (new AppStoreDetailResponseBuilder()..update(updates))._build();

  _$AppStoreDetailResponse._(
      {this.id,
      this.name,
      this.version,
      this.url,
      this.domain,
      this.createdAt,
      this.urlLogo,
      this.description})
      : super._();

  @override
  AppStoreDetailResponse rebuild(
          void Function(AppStoreDetailResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AppStoreDetailResponseBuilder toBuilder() =>
      new AppStoreDetailResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AppStoreDetailResponse &&
        id == other.id &&
        name == other.name &&
        version == other.version &&
        url == other.url &&
        domain == other.domain &&
        createdAt == other.createdAt &&
        urlLogo == other.urlLogo &&
        description == other.description;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, version.hashCode);
    _$hash = $jc(_$hash, url.hashCode);
    _$hash = $jc(_$hash, domain.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, urlLogo.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AppStoreDetailResponse')
          ..add('id', id)
          ..add('name', name)
          ..add('version', version)
          ..add('url', url)
          ..add('domain', domain)
          ..add('createdAt', createdAt)
          ..add('urlLogo', urlLogo)
          ..add('description', description))
        .toString();
  }
}

class AppStoreDetailResponseBuilder
    implements Builder<AppStoreDetailResponse, AppStoreDetailResponseBuilder> {
  _$AppStoreDetailResponse? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _version;
  String? get version => _$this._version;
  set version(String? version) => _$this._version = version;

  String? _url;
  String? get url => _$this._url;
  set url(String? url) => _$this._url = url;

  String? _domain;
  String? get domain => _$this._domain;
  set domain(String? domain) => _$this._domain = domain;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  String? _urlLogo;
  String? get urlLogo => _$this._urlLogo;
  set urlLogo(String? urlLogo) => _$this._urlLogo = urlLogo;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  AppStoreDetailResponseBuilder() {
    AppStoreDetailResponse._defaults(this);
  }

  AppStoreDetailResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _version = $v.version;
      _url = $v.url;
      _domain = $v.domain;
      _createdAt = $v.createdAt;
      _urlLogo = $v.urlLogo;
      _description = $v.description;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AppStoreDetailResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AppStoreDetailResponse;
  }

  @override
  void update(void Function(AppStoreDetailResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AppStoreDetailResponse build() => _build();

  _$AppStoreDetailResponse _build() {
    final _$result = _$v ??
        new _$AppStoreDetailResponse._(
            id: id,
            name: name,
            version: version,
            url: url,
            domain: domain,
            createdAt: createdAt,
            urlLogo: urlLogo,
            description: description);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
