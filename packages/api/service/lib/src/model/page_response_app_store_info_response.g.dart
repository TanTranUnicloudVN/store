// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page_response_app_store_info_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PageResponseAppStoreInfoResponse
    extends PageResponseAppStoreInfoResponse {
  @override
  final int? pageNumber;
  @override
  final int? pageSize;
  @override
  final int? totalSize;
  @override
  final int? totalPage;
  @override
  final BuiltList<AppStoreInfoResponse>? items;

  factory _$PageResponseAppStoreInfoResponse(
          [void Function(PageResponseAppStoreInfoResponseBuilder)? updates]) =>
      (new PageResponseAppStoreInfoResponseBuilder()..update(updates))._build();

  _$PageResponseAppStoreInfoResponse._(
      {this.pageNumber,
      this.pageSize,
      this.totalSize,
      this.totalPage,
      this.items})
      : super._();

  @override
  PageResponseAppStoreInfoResponse rebuild(
          void Function(PageResponseAppStoreInfoResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PageResponseAppStoreInfoResponseBuilder toBuilder() =>
      new PageResponseAppStoreInfoResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PageResponseAppStoreInfoResponse &&
        pageNumber == other.pageNumber &&
        pageSize == other.pageSize &&
        totalSize == other.totalSize &&
        totalPage == other.totalPage &&
        items == other.items;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, pageNumber.hashCode);
    _$hash = $jc(_$hash, pageSize.hashCode);
    _$hash = $jc(_$hash, totalSize.hashCode);
    _$hash = $jc(_$hash, totalPage.hashCode);
    _$hash = $jc(_$hash, items.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PageResponseAppStoreInfoResponse')
          ..add('pageNumber', pageNumber)
          ..add('pageSize', pageSize)
          ..add('totalSize', totalSize)
          ..add('totalPage', totalPage)
          ..add('items', items))
        .toString();
  }
}

class PageResponseAppStoreInfoResponseBuilder
    implements
        Builder<PageResponseAppStoreInfoResponse,
            PageResponseAppStoreInfoResponseBuilder> {
  _$PageResponseAppStoreInfoResponse? _$v;

  int? _pageNumber;
  int? get pageNumber => _$this._pageNumber;
  set pageNumber(int? pageNumber) => _$this._pageNumber = pageNumber;

  int? _pageSize;
  int? get pageSize => _$this._pageSize;
  set pageSize(int? pageSize) => _$this._pageSize = pageSize;

  int? _totalSize;
  int? get totalSize => _$this._totalSize;
  set totalSize(int? totalSize) => _$this._totalSize = totalSize;

  int? _totalPage;
  int? get totalPage => _$this._totalPage;
  set totalPage(int? totalPage) => _$this._totalPage = totalPage;

  ListBuilder<AppStoreInfoResponse>? _items;
  ListBuilder<AppStoreInfoResponse> get items =>
      _$this._items ??= new ListBuilder<AppStoreInfoResponse>();
  set items(ListBuilder<AppStoreInfoResponse>? items) => _$this._items = items;

  PageResponseAppStoreInfoResponseBuilder() {
    PageResponseAppStoreInfoResponse._defaults(this);
  }

  PageResponseAppStoreInfoResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _pageNumber = $v.pageNumber;
      _pageSize = $v.pageSize;
      _totalSize = $v.totalSize;
      _totalPage = $v.totalPage;
      _items = $v.items?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PageResponseAppStoreInfoResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PageResponseAppStoreInfoResponse;
  }

  @override
  void update(void Function(PageResponseAppStoreInfoResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PageResponseAppStoreInfoResponse build() => _build();

  _$PageResponseAppStoreInfoResponse _build() {
    _$PageResponseAppStoreInfoResponse _$result;
    try {
      _$result = _$v ??
          new _$PageResponseAppStoreInfoResponse._(
              pageNumber: pageNumber,
              pageSize: pageSize,
              totalSize: totalSize,
              totalPage: totalPage,
              items: _items?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'items';
        _items?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'PageResponseAppStoreInfoResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
