import 'package:messages_app/core/api/model/comment_model.dart';
import 'package:messages_app/core/api/model/post_model.dart';
import 'package:messages_app/core/api/model/user_model.dart';
import 'package:messages_app/core/api/repository/service/api_service.dart';

class ApiInteractor {

  final service = PostApiService.create();

  Future<List<PostModel>> getAllPosts() async {
    final response = await service.getAllPosts();
    return response.body!.toList();
  }

  Future<List<CommentModel>> getAllCommentsByPost(int id) async {
    final response = await service.getComments(id);
    return response.body!.toList();
  }

  Future<UserModel> getUser(int id) async {
    final response = await service.getUser(id);
    return response.body!;
  }

}