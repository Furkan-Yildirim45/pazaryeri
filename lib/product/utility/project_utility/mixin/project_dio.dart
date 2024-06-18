import 'package:Pazaryeri/product/environment/environment.dart';
import 'package:dio/dio.dart';

class ProjectDio {
  final String _baseUrl = ProjectEnvironment.baseUrl;
  final String _apiKey = ProjectEnvironment.apiKey;
  late Dio dio;
  ProjectDio() {
    dio = Dio(BaseOptions(baseUrl: _baseUrl, headers: {
      "API_KEY": _apiKey,
    }));
  }
}
