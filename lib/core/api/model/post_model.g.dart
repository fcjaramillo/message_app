// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PostModel> _$postModelSerializer = new _$PostModelSerializer();
Serializer<PostsModel> _$postsModelSerializer = new _$PostsModelSerializer();

class _$PostModelSerializer implements StructuredSerializer<PostModel> {
  @override
  final Iterable<Type> types = const [PostModel, _$PostModel];
  @override
  final String wireName = 'PostModel';

  @override
  Iterable<Object?> serialize(Serializers serializers, PostModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'userId',
      serializers.serialize(object.userId, specifiedType: const FullType(int)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'title',
      serializers.serialize(object.title,
          specifiedType: const FullType(String)),
      'body',
      serializers.serialize(object.body, specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.isRead;
    if (value != null) {
      result
        ..add('isRead')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.isFavorite;
    if (value != null) {
      result
        ..add('isFavorite')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    return result;
  }

  @override
  PostModel deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PostModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'userId':
          result.userId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'body':
          result.body = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'isRead':
          result.isRead = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'isFavorite':
          result.isFavorite = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
      }
    }

    return result.build();
  }
}

class _$PostsModelSerializer implements StructuredSerializer<PostsModel> {
  @override
  final Iterable<Type> types = const [PostsModel, _$PostsModel];
  @override
  final String wireName = 'PostsModel';

  @override
  Iterable<Object?> serialize(Serializers serializers, PostsModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'posts',
      serializers.serialize(object.posts,
          specifiedType:
              const FullType(BuiltList, const [const FullType(PostModel)])),
    ];

    return result;
  }

  @override
  PostsModel deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PostsModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'posts':
          result.posts.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(PostModel)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$PostModel extends PostModel {
  @override
  final int userId;
  @override
  final int id;
  @override
  final String title;
  @override
  final String body;
  @override
  final bool? isRead;
  @override
  final bool? isFavorite;

  factory _$PostModel([void Function(PostModelBuilder)? updates]) =>
      (new PostModelBuilder()..update(updates)).build();

  _$PostModel._(
      {required this.userId,
      required this.id,
      required this.title,
      required this.body,
      this.isRead,
      this.isFavorite})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(userId, 'PostModel', 'userId');
    BuiltValueNullFieldError.checkNotNull(id, 'PostModel', 'id');
    BuiltValueNullFieldError.checkNotNull(title, 'PostModel', 'title');
    BuiltValueNullFieldError.checkNotNull(body, 'PostModel', 'body');
  }

  @override
  PostModel rebuild(void Function(PostModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PostModelBuilder toBuilder() => new PostModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PostModel &&
        userId == other.userId &&
        id == other.id &&
        title == other.title &&
        body == other.body &&
        isRead == other.isRead &&
        isFavorite == other.isFavorite;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc($jc(0, userId.hashCode), id.hashCode), title.hashCode),
                body.hashCode),
            isRead.hashCode),
        isFavorite.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('PostModel')
          ..add('userId', userId)
          ..add('id', id)
          ..add('title', title)
          ..add('body', body)
          ..add('isRead', isRead)
          ..add('isFavorite', isFavorite))
        .toString();
  }
}

class PostModelBuilder implements Builder<PostModel, PostModelBuilder> {
  _$PostModel? _$v;

  int? _userId;
  int? get userId => _$this._userId;
  set userId(int? userId) => _$this._userId = userId;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _body;
  String? get body => _$this._body;
  set body(String? body) => _$this._body = body;

  bool? _isRead;
  bool? get isRead => _$this._isRead;
  set isRead(bool? isRead) => _$this._isRead = isRead;

  bool? _isFavorite;
  bool? get isFavorite => _$this._isFavorite;
  set isFavorite(bool? isFavorite) => _$this._isFavorite = isFavorite;

  PostModelBuilder();

  PostModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _userId = $v.userId;
      _id = $v.id;
      _title = $v.title;
      _body = $v.body;
      _isRead = $v.isRead;
      _isFavorite = $v.isFavorite;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PostModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PostModel;
  }

  @override
  void update(void Function(PostModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PostModel build() {
    final _$result = _$v ??
        new _$PostModel._(
            userId: BuiltValueNullFieldError.checkNotNull(
                userId, 'PostModel', 'userId'),
            id: BuiltValueNullFieldError.checkNotNull(id, 'PostModel', 'id'),
            title: BuiltValueNullFieldError.checkNotNull(
                title, 'PostModel', 'title'),
            body: BuiltValueNullFieldError.checkNotNull(
                body, 'PostModel', 'body'),
            isRead: isRead,
            isFavorite: isFavorite);
    replace(_$result);
    return _$result;
  }
}

class _$PostsModel extends PostsModel {
  @override
  final BuiltList<PostModel> posts;

  factory _$PostsModel([void Function(PostsModelBuilder)? updates]) =>
      (new PostsModelBuilder()..update(updates)).build();

  _$PostsModel._({required this.posts}) : super._() {
    BuiltValueNullFieldError.checkNotNull(posts, 'PostsModel', 'posts');
  }

  @override
  PostsModel rebuild(void Function(PostsModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PostsModelBuilder toBuilder() => new PostsModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PostsModel && posts == other.posts;
  }

  @override
  int get hashCode {
    return $jf($jc(0, posts.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('PostsModel')..add('posts', posts))
        .toString();
  }
}

class PostsModelBuilder implements Builder<PostsModel, PostsModelBuilder> {
  _$PostsModel? _$v;

  ListBuilder<PostModel>? _posts;
  ListBuilder<PostModel> get posts =>
      _$this._posts ??= new ListBuilder<PostModel>();
  set posts(ListBuilder<PostModel>? posts) => _$this._posts = posts;

  PostsModelBuilder();

  PostsModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _posts = $v.posts.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PostsModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PostsModel;
  }

  @override
  void update(void Function(PostsModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PostsModel build() {
    _$PostsModel _$result;
    try {
      _$result = _$v ?? new _$PostsModel._(posts: posts.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'posts';
        posts.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'PostsModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
