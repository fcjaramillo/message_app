import 'package:messages_app/core/api/model/comment_model.dart';
import 'package:messages_app/core/api/model/post_model.dart';
import 'package:messages_app/core/api/model/user_model.dart';
import 'package:messages_app/viewModel.dart';

class DetailPostStatus extends ViewStatus {

  final List<CommentModel> comments;
  final PostModel post;
  final UserModel user;
  final String titleBar;

  DetailPostStatus({
    required this.comments,
    required this.post,
    required this.user,
    required this.titleBar,
  });

  DetailPostStatus copyWith({
    List<CommentModel>? comments,
    PostModel? post,
    UserModel? user,
    String? titleBar,
  }){

    return DetailPostStatus(
      comments : comments ?? this.comments,
      post: post ?? this.post,
      user: user ?? this.user,
      titleBar : titleBar ?? this.titleBar,
    );
  }

}