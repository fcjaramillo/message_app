import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:messages_app/core/api/model/post_model.dart';
import 'package:messages_app/core/api/repository/interactor/api_interactor.dart';
import 'package:messages_app/core/configure/message_route.dart';
import 'package:messages_app/core/data/database.dart';
import 'package:mocktail/mocktail.dart';

import '../../../fixture/fixture_loader.dart';

const postsFile = 'posts.json';

class MockMessageRoute extends Mock implements MessageRoute {}
class MockDatabase extends Mock implements Database {}
class MockApiInteractor extends Mock implements ApiInteractor {}

void main(){
  late MessageRoute route;
  late Database database;
  late ApiInteractor apiInteractor;

  final Map<String, dynamic> postsResponse =
    jsonDecode(fixture(postsFile));

  setUp(() {
    route = MockMessageRoute();
    database = MockDatabase();
    apiInteractor = MockApiInteractor();
  });

  test('Get All Posts - Successful result', () async {

    when(() => apiInteractor.getAllPosts()).thenAnswer(
        (_) async => PostsModel.fromJson(fixture(postsFile))!.posts.toList());

    final result = await apiInteractor.getAllPosts();

    verify(() => apiInteractor.getAllPosts());
    expect(result.length, 100);

  });

}