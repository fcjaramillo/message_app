import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:messages_app/core/api/model/post_model.dart';

part 'serializers.g.dart';

@SerializersFor([
  PostModel,
])
final Serializers serializers = (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
