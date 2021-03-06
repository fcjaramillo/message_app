import 'package:chopper/chopper.dart';
import 'package:built_collection/built_collection.dart';
import 'package:messages_app/core/api/model/comment_model.dart';
import 'package:messages_app/core/api/model/post_model.dart';
import 'package:messages_app/core/api/model/user_model.dart';
import 'package:messages_app/core/api/repository/converter/built_value_converter.dart';

part 'api_service.chopper.dart';

@ChopperApi(baseUrl: '')
abstract class PostApiService extends ChopperService {

  @Get(path: '/posts')
  Future<Response<BuiltList<PostModel>>> getAllPosts();

  @Get(path: '/comments?postId={id}')
  Future<Response<BuiltList<CommentModel>>> getComments(
    @Path("id") int id,
  );

  @Get(path: '/users/{id}')
  Future<Response<UserModel>> getUser(
    @Path("id") int id,
  );

  static PostApiService create() {
    final client = ChopperClient(
      baseUrl: 'https://jsonplaceholder.typicode.com',
      services: [
        _$PostApiService(),
      ],
      converter: BuiltValueConverter(),
      interceptors: [
        HttpLoggingInterceptor(),
      ],
    );

    return _$PostApiService(client);
  }
}