import 'package:messages_app/core/api/model/post_model.dart';
import 'package:messages_app/viewModel.dart';

class HomeStatus extends ViewStatus {

  final String titleBar;
  final bool isLoading;
  final List<PostModel> posts;
  final int indexTab;

  HomeStatus({
    required this.titleBar,
    required this.isLoading,
    required this.posts,
    required this.indexTab
  });

  HomeStatus copyWith({
    String? titleBar,
    bool? isLoading,
    List<PostModel>? posts,
    int? indexTab,
  }){

    return HomeStatus(
      titleBar : titleBar ?? this.titleBar,
      isLoading : isLoading ?? this.isLoading,
      posts: posts ?? this.posts,
      indexTab: indexTab ?? this.indexTab,
    );
  }

}