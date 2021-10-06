import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:messages_app/core/api/model/comment_model.dart';
import 'package:messages_app/core/api/model/post_model.dart';
import 'package:messages_app/core/api/model/user_model.dart';

part 'serializers.g.dart';

@SerializersFor([
  CommentModel,
  PostModel,
  PostsModel,
  UserModel,
])
final Serializers serializers = (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
