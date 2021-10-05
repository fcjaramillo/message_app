import 'package:chopper/chopper.dart';
import 'package:built_collection/built_collection.dart';
import 'package:messages_app/core/api/repository/converter/built_value_converter.dart';

part 'api_service.chopper.dart';

@ChopperApi(baseUrl: '/api')
abstract class PostApiService extends ChopperService {


  static PostApiService create() {
    final client = ChopperClient(
      baseUrl: 'http://192.168.0.15:5000',
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