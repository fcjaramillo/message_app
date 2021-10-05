// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$PostApiService extends PostApiService {
  _$PostApiService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = PostApiService;

  @override
  Future<Response<BuiltList<PostModel>>> getAllPosts() {
    final $url = '/posts';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<BuiltList<PostModel>, PostModel>($request);
  }

  @override
  Future<Response<BuiltList<CommentModel>>> getComments(int id) {
    final $url = '/comments?postId=$id';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<BuiltList<CommentModel>, CommentModel>($request);
  }

  @override
  Future<Response<UserModel>> getUser(int id) {
    final $url = '/users/$id';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<UserModel, UserModel>($request);
  }
}
