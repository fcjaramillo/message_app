import 'package:messages_app/core/api/model/post_model.dart';
import 'package:messages_app/viewModel.dart';

class HomeStatus extends ViewStatus {

  final String titleBar;
  final bool isLoading;
  final List<PostModel> posts;

  HomeStatus({
    required this.titleBar,
    required this.isLoading,
    required this.posts});

  HomeStatus copyWith({String? titleBar, bool? isLoading, List<PostModel>? posts}){

    return HomeStatus(
      titleBar : titleBar ?? this.titleBar,
      isLoading : isLoading ?? this.isLoading,
      posts: posts ?? this.posts,
    );
  }

}