import 'dart:io';

import 'package:flutter/material.dart';
import 'package:messages_app/core/api/model/post_model.dart';
import 'package:messages_app/core/api/repository/interactor/api_interactor.dart';
import 'package:messages_app/core/commons/constants.dart';
import 'package:messages_app/app_theme.dart';
import 'package:messages_app/core/configure/get_it_locator.dart';
import 'package:messages_app/core/configure/message_route.dart';
import 'package:messages_app/core/data/database.dart';
import 'package:messages_app/generated/l10n.dart';
import 'package:messages_app/ui/screens/home/home_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeViewModel(
        locator<MessageRoute>(),
        locator<Database>(),
        locator<ApiInteractor>(),
      ),
      builder: (context, _){
        return HomeWidget();
      },
    );
  }
}

class HomeWidget extends StatelessWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme
        .of(context)
        .textTheme;

    final viewModel = context.watch<HomeViewModel>();

    return Scaffold(
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
                Icons.refresh,
              ),
              onPressed: viewModel.onInit,
            ),
          ),
        ],
        elevation: 0,
      ),
      body: _HomeBody(),
      floatingActionButtonLocation: Platform.isAndroid ? null
          : FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Visibility(
        child: FloatingActionButton(
          child: Icon(
            Icons.delete
          ),
          backgroundColor: kColorRed,
          onPressed: viewModel.onTapDeleteAll,
        ),
        replacement: ElevatedButton(
          child: Text(I18n.of(context).sHomeDelete),
          onPressed: viewModel.onTapDeleteAll,
          style: ElevatedButton.styleFrom(
            primary: kColorRed,
            fixedSize: Size(
              MediaQuery.of(context).size.width,
              50,
            ),
          ),
        ),
        visible: Platform.isAndroid,
      ),
    );
  }
}

class _HomeBody extends StatefulWidget {
  const _HomeBody({
    Key? key,
  }) : super(key: key);

  @override
  State<_HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<_HomeBody> with SingleTickerProviderStateMixin {

  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(() {
      context.read<HomeViewModel>().onTapTab(tabController.index);
    });
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      context.read<HomeViewModel>().onInit();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final viewModel = context.watch<HomeViewModel>();
    final textTheme = Theme
        .of(context)
        .textTheme;

    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          SizedBox(
            height: 74.0,
            child: AppBar(
              elevation: 0,
              backgroundColor: kColorGreen,
              bottom: TabBar(
                controller: tabController,
                onTap: (index) {
                  viewModel.onTapTab(index);
                },
                tabs: [
                  Tab(
                    child: Text(
                      I18n.of(context).sHomeAll,
                    ),
                  ),
                  Tab(
                    child: Text(
                      I18n.of(context).sHomeFavorite,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
              child: TabBarView(
                controller: tabController,
                children: [
                  _ListPosts(
                    viewModel: viewModel,
                    posts: viewModel.status.posts,
                    textTheme: textTheme,
                  ),
                  _ListPosts(
                    viewModel: viewModel,
                    posts: viewModel.status.posts.where(
                      (post) => post.isFavorite == true).toList(),
                    textTheme: textTheme,
                  ),
                ],
              )
          )
        ],
      ),
    );
  }
}

class _ListPosts extends StatelessWidget {
  const _ListPosts({
    Key? key,
    required this.viewModel,
    required this.textTheme,
    required this.posts
  }) : super(key: key);

  final HomeViewModel viewModel;
  final TextTheme textTheme;
  final List<PostModel> posts;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
    itemCount: posts.length,
      itemBuilder: (context, index) {
        return Dismissible(
          key: Key(posts[index].id.toString()),
          onDismissed: (direction){
            viewModel.deletePost(posts[index], index);
          },
          child: GestureDetector(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8.0,
              ),
              child: Row(
                children: [
                  Visibility(
                    child: Visibility(
                      child: Expanded(
                        child: _IconRead(),
                        flex: 1,
                      ),
                      visible: !(posts[index].isRead ?? false),
                    ),
                    replacement: Expanded(
                      child: !(posts[index].isRead ?? false) ? _IconRead()
                        : (posts[index].isFavorite ?? false) ? _IconFavorite()
                        : SizedBox(),
                      flex: 1,
                    ),
                    visible: Platform.isAndroid,
                  ),
                  Expanded(
                    child: Text(
                      posts[index].title,
                      maxLines: 2,
                      style: textTheme.subtitleBlack,
                    ),
                    flex: 9,
                  ),
                  Expanded(
                    child: Visibility(
                      child: Visibility(
                        child: _IconFavorite(),
                        visible: posts[index].isFavorite ?? false,
                      ),
                      replacement: Icon(
                        Icons.chevron_right,
                        color: kColorGray,
                        size: 30,
                      ),
                      visible: Platform.isAndroid,
                    ),
                    flex: 1,
                  ),
                ],
              ),
            ),
            onTap: (){
              viewModel.onTapPost(posts[index], index);
            },
          ),
        );
      },
      separatorBuilder: (context, index) {
        return SizedBox(
            height: 30,
            child: Divider()
        );
      },
    );
  }
}

class _IconFavorite extends StatelessWidget {
  const _IconFavorite({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.star,
      color: kColorYellow,
      size: 30,
    );
  }
}

class _IconRead extends StatelessWidget {
  const _IconRead({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.circle,
      color: kColorBlue,
      size: 14,
    );
  }
}
