import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://api.themoviedb.org/3/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    String authorization = 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIzYWU0NWE5NDlmYzNiN2U0ZDgyODE3OWQ2Y2RlMjg4MiIsInN1YiI6IjYzMzMyMTEzYzUyNWM0MDA3ZmVlZDkzOSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.BoZ_Vxq6vo4BFVPt2W4MxnZqRKMct7pOmDlLiQbU-u8',
  }) async {
    dio.options.headers = {
      'Authorization': authorization,
      'Content-Type': 'application/json',
    };
    return await dio.get(
      url,
      queryParameters: query,
    );
  }

  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    String authorization = 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIzYWU0NWE5NDlmYzNiN2U0ZDgyODE3OWQ2Y2RlMjg4MiIsInN1YiI6IjYzMzMyMTEzYzUyNWM0MDA3ZmVlZDkzOSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.BoZ_Vxq6vo4BFVPt2W4MxnZqRKMct7pOmDlLiQbU-u8',
  }) async
  {
    dio.options.headers = {
      'Authorization': authorization,
      'Content-Type': 'application/json',
      'accept' : 'application/json',
    };
    return await dio.post(
      url,
      queryParameters: query,
      data: data,
    );
  }
}
