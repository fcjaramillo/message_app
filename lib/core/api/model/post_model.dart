import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:messages_app/core/api/repository/serializer/serializers.dart';

part 'post_model.g.dart';

abstract class PostModel implements Built<PostModel, PostModelBuilder> {
  int get userId;

  int get id;

  String get title;

  String get body;

  bool? get isRead;

  bool? get isFavorite;

  PostModel._();
  factory PostModel([void Function(PostModelBuilder) updates]) = _$PostModel;

  static Serializer<PostModel> get serializer => _$postModelSerializer;
}

abstract class PostsModel implements Built<PostsModel, PostsModelBuilder> {
  BuiltList<PostModel> get posts;

  PostsModel._();
  factory PostsModel([void Function(PostsModelBuilder) updates]) = _$PostsModel;

  static PostsModel? fromJson(String jsonString) {
    return serializers.deserializeWith(
        PostsModel.serializer, jsonDecode(jsonString));
  }

  static Serializer<PostsModel> get serializer => _$postsModelSerializer;
}