import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'post_model.g.dart';

abstract class PostModel implements Built<PostModel, PostModelBuilder> {
  int get userId;

  int get id;

  String get title;

  String get body;

  PostModel._();
  factory PostModel([void Function(PostModelBuilder) updates]) = _$PostModel;

  static Serializer<PostModel> get serializer => _$postModelSerializer;
}