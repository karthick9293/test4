// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_bv.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<NotificationBV> _$notificationBVSerializer =
    _$NotificationBVSerializer();

class _$NotificationBVSerializer
    implements StructuredSerializer<NotificationBV> {
  @override
  final Iterable<Type> types = const [NotificationBV, _$NotificationBV];
  @override
  final String wireName = 'NotificationBV';

  @override
  Iterable<Object?> serialize(Serializers serializers, NotificationBV object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'heading',
      serializers.serialize(object.heading,
          specifiedType: const FullType(String)),
      'content',
      serializers.serialize(object.content,
          specifiedType: const FullType(String)),
      'videoType',
      serializers.serialize(object.videoType,
          specifiedType: const FullType(String)),
      'isRead',
      serializers.serialize(object.isRead, specifiedType: const FullType(bool)),
    ];
    Object? value;
    value = object.videoUrl;
    if (value != null) {
      result
        ..add('videoUrl')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.addedDate;
    if (value != null) {
      result
        ..add('addedDate')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.notificationId;
    if (value != null) {
      result
        ..add('notificationId')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  NotificationBV deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = NotificationBVBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'heading':
          result.heading = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'content':
          result.content = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'videoType':
          result.videoType = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'videoUrl':
          result.videoUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'isRead':
          result.isRead = serializers.deserialize(value,
              specifiedType: const FullType(bool))! as bool;
          break;
        case 'addedDate':
          result.addedDate = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'notificationId':
          result.notificationId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$NotificationBV extends NotificationBV {
  @override
  final String heading;
  @override
  final String content;
  @override
  final String videoType;
  @override
  final String? videoUrl;
  @override
  final bool isRead;
  @override
  final String? addedDate;
  @override
  final String? notificationId;

  factory _$NotificationBV([void Function(NotificationBVBuilder)? updates]) =>
      (NotificationBVBuilder()..update(updates))._build();

  _$NotificationBV._(
      {required this.heading,
      required this.content,
      required this.videoType,
      this.videoUrl,
      required this.isRead,
      this.addedDate,
      this.notificationId})
      : super._();
  @override
  NotificationBV rebuild(void Function(NotificationBVBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NotificationBVBuilder toBuilder() => NotificationBVBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NotificationBV &&
        heading == other.heading &&
        content == other.content &&
        videoType == other.videoType &&
        videoUrl == other.videoUrl &&
        isRead == other.isRead &&
        addedDate == other.addedDate &&
        notificationId == other.notificationId;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, heading.hashCode);
    _$hash = $jc(_$hash, content.hashCode);
    _$hash = $jc(_$hash, videoType.hashCode);
    _$hash = $jc(_$hash, videoUrl.hashCode);
    _$hash = $jc(_$hash, isRead.hashCode);
    _$hash = $jc(_$hash, addedDate.hashCode);
    _$hash = $jc(_$hash, notificationId.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NotificationBV')
          ..add('heading', heading)
          ..add('content', content)
          ..add('videoType', videoType)
          ..add('videoUrl', videoUrl)
          ..add('isRead', isRead)
          ..add('addedDate', addedDate)
          ..add('notificationId', notificationId))
        .toString();
  }
}

class NotificationBVBuilder
    implements Builder<NotificationBV, NotificationBVBuilder> {
  _$NotificationBV? _$v;

  String? _heading;
  String? get heading => _$this._heading;
  set heading(String? heading) => _$this._heading = heading;

  String? _content;
  String? get content => _$this._content;
  set content(String? content) => _$this._content = content;

  String? _videoType;
  String? get videoType => _$this._videoType;
  set videoType(String? videoType) => _$this._videoType = videoType;

  String? _videoUrl;
  String? get videoUrl => _$this._videoUrl;
  set videoUrl(String? videoUrl) => _$this._videoUrl = videoUrl;

  bool? _isRead;
  bool? get isRead => _$this._isRead;
  set isRead(bool? isRead) => _$this._isRead = isRead;

  String? _addedDate;
  String? get addedDate => _$this._addedDate;
  set addedDate(String? addedDate) => _$this._addedDate = addedDate;

  String? _notificationId;
  String? get notificationId => _$this._notificationId;
  set notificationId(String? notificationId) =>
      _$this._notificationId = notificationId;

  NotificationBVBuilder();

  NotificationBVBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _heading = $v.heading;
      _content = $v.content;
      _videoType = $v.videoType;
      _videoUrl = $v.videoUrl;
      _isRead = $v.isRead;
      _addedDate = $v.addedDate;
      _notificationId = $v.notificationId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NotificationBV other) {
    _$v = other as _$NotificationBV;
  }

  @override
  void update(void Function(NotificationBVBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NotificationBV build() => _build();

  _$NotificationBV _build() {
    final _$result = _$v ??
        _$NotificationBV._(
          heading: BuiltValueNullFieldError.checkNotNull(
              heading, r'NotificationBV', 'heading'),
          content: BuiltValueNullFieldError.checkNotNull(
              content, r'NotificationBV', 'content'),
          videoType: BuiltValueNullFieldError.checkNotNull(
              videoType, r'NotificationBV', 'videoType'),
          videoUrl: videoUrl,
          isRead: BuiltValueNullFieldError.checkNotNull(
              isRead, r'NotificationBV', 'isRead'),
          addedDate: addedDate,
          notificationId: notificationId,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
