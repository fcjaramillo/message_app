// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CommentModel> _$commentModelSerializer =
    new _$CommentModelSerializer();

class _$CommentModelSerializer implements StructuredSerializer<CommentModel> {
  @override
  final Iterable<Type> types = const [CommentModel, _$CommentModel];
  @override
  final String wireName = 'CommentModel';

  @override
  Iterable<Object?> serialize(Serializers serializers, CommentModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'postId',
      serializers.serialize(object.postId, specifiedType: const FullType(int)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'email',
      serializers.serialize(object.email,
          specifiedType: const FullType(String)),
      'body',
      serializers.serialize(object.body, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  CommentModel deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CommentModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'postId':
          result.postId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'body':
          result.body = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$CommentModel extends CommentModel {
  @override
  final int id;
  @override
  final int postId;
  @override
  final String name;
  @override
  final String email;
  @override
  final String body;

  factory _$CommentModel([void Function(CommentModelBuilder)? updates]) =>
      (new CommentModelBuilder()..update(updates)).build();

  _$CommentModel._(
      {required this.id,
      required this.postId,
      required this.name,
      required this.email,
      required this.body})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, 'CommentModel', 'id');
    BuiltValueNullFieldError.checkNotNull(postId, 'CommentModel', 'postId');
    BuiltValueNullFieldError.checkNotNull(name, 'CommentModel', 'name');
    BuiltValueNullFieldError.checkNotNull(email, 'CommentModel', 'email');
    BuiltValueNullFieldError.checkNotNull(body, 'CommentModel', 'body');
  }

  @override
  CommentModel rebuild(void Function(CommentModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CommentModelBuilder toBuilder() => new CommentModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CommentModel &&
        id == other.id &&
        postId == other.postId &&
        name == other.name &&
        email == other.email &&
        body == other.body;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc($jc(0, id.hashCode), postId.hashCode), name.hashCode),
            email.hashCode),
        body.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('CommentModel')
          ..add('id', id)
          ..add('postId', postId)
          ..add('name', name)
          ..add('email', email)
          ..add('body', body))
        .toString();
  }
}

class CommentModelBuilder
    implements Builder<CommentModel, CommentModelBuilder> {
  _$CommentModel? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  int? _postId;
  int? get postId => _$this._postId;
  set postId(int? postId) => _$this._postId = postId;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  String? _body;
  String? get body => _$this._body;
  set body(String? body) => _$this._body = body;

  CommentModelBuilder();

  CommentModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _postId = $v.postId;
      _name = $v.name;
      _email = $v.email;
      _body = $v.body;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CommentModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CommentModel;
  }

  @override
  void update(void Function(CommentModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$CommentModel build() {
    final _$result = _$v ??
        new _$CommentModel._(
            id: BuiltValueNullFieldError.checkNotNull(id, 'CommentModel', 'id'),
            postId: BuiltValueNullFieldError.checkNotNull(
                postId, 'CommentModel', 'postId'),
            name: BuiltValueNullFieldError.checkNotNull(
                name, 'CommentModel', 'name'),
            email: BuiltValueNullFieldError.checkNotNull(
                email, 'CommentModel', 'email'),
            body: BuiltValueNullFieldError.checkNotNull(
                body, 'CommentModel', 'body'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
