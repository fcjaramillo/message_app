import 'package:flutter/material.dart';
import 'package:messages_app/core/api/model/comment_model.dart';
import 'package:messages_app/core/api/model/post_model.dart';
import 'package:messages_app/core/api/model/user_model.dart';
import 'package:messages_app/core/commons/constants.dart';
import 'package:messages_app/app_theme.dart';
import 'package:messages_app/core/configure/get_it_locator.dart';
import 'package:messages_app/core/configure/message_route.dart';
import 'package:messages_app/core/data/database.dart';
import 'package:messages_app/ui/screens/detail_post/detail_post_view_model.dart';
import 'package:provider/provider.dart';

class DetailPostScreen extends StatelessWidget {

  DetailPostScreen({
    required List<CommentModel> comments,
    required PostModel post,
    required UserModel user,
  }) :  _comments = comments,
        _post = post,
        _user = user;

  final List<CommentModel> _comments;
  final PostModel _post;
  final UserModel _user;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => DetailPostViewModel(
        locator<MessageRoute>(),
        locator<Database>(),
        _comments,
        _post,
        _user,
      ),
      builder: (context, _){
        return DetailPostWidget();
      },
    );
  }
}

class DetailPostWidget extends StatelessWidget {
  const DetailPostWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme
        .of(context)
        .textTheme;

    final viewModel = context.watch<DetailPostViewModel>();

    Future<bool> _onBackPressed() async {
      if (Navigator.of(context).userGestureInProgress)
        return false;
      else{
        await viewModel.onTapBack();
        return true;
      }
    }

    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kColorGreen,
          title: Text(
            viewModel.status.titleBar,
            style: textTheme.titleWhite.copyWith(
              fontSize: 24,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: IconButton(
                icon: Icon(
                  viewModel.status.post.isFavorite ?? false ?
                    Icons.star : Icons.star_border,
                  color: viewModel.status.post.isFavorite ?? false ?
                    kColorYellow : kColorWhite,
                  size: 30,
                ),
                onPressed: (){
                  viewModel.onTapFavorite(viewModel.status.post);
                },
              ),
            ),
          ]
        ),
        body: _DetailPostBody(),
      ),
    );
  }
}

class _DetailPostBody extends StatelessWidget {
  const _DetailPostBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final viewModel = context.watch<DetailPostViewModel>();
    final textTheme = Theme
        .of(context)
        .textTheme;

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Descripcion:',
            style: textTheme.titleBlack,
          ),
          Text(
            viewModel.status.post.body,
            style: textTheme.subtitleBlack,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'User:',
            style: textTheme.titleBlack,
          ),
          Text(
            'Name: ${viewModel.status.user.name}',
            style: textTheme.subtitleBlack,
          ),
          Text(
            'Email: ${viewModel.status.user.email}',
            style: textTheme.subtitleBlack,
          ),
          Text(
            'Phone: ${viewModel.status.user.phone}',
            style: textTheme.subtitleBlack,
          ),
          Text(
            'Website: ${viewModel.status.user.website}',
            style: textTheme.subtitleBlack,
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            color: kColorGrayChip,
            child: Text(
              'COMMENTS',
              style: textTheme.titleBlack,
            ),
            width: double.infinity,
          ),
          Expanded(
            child: ListView.separated(
              itemCount: viewModel.status.comments.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(
                    viewModel.status.comments[index].email,
                  ),
                  subtitle: Text(
                    viewModel.status.comments[index].body,
                    maxLines: 2,
                  ),
                  leading: CircleAvatar(
                    child: Text(
                      viewModel.status.comments[index].email.substring(0,1),
                    ),
                    backgroundColor: kColorGreen,
                    foregroundColor: kColorBlack,
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) => const Divider(),
            ),
          )
          /*Container(
            height: MediaQuery.of(context).size.height * 0.2,
            child:
          )*/
        ],
      ),
    );
  }
}