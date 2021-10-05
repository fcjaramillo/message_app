import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'comment_model.g.dart';

abstract class CommentModel implements Built<CommentModel, CommentModelBuilder> {
  int get id;

  int get postId;

  String get name;

  String get email;

  String get body;

  CommentModel._();
  factory CommentModel([void Function(CommentModelBuilder) updates]) = _$CommentModel;

  static Serializer<CommentModel> get serializer => _$commentModelSerializer;
}