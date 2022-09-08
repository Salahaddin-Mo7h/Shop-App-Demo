
// ignore_for_file: file_names
import 'package:dio/dio.dart';

class DioHelper {
  static  Dio? dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://student.valuxapps.com/api/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  // get endpoint to retrieve data from database
  static Future<Response> getData({
    required String url,
   Map<String, dynamic>? query,
    String lang = 'en',
    String? token,
  }) async {
    dio!.options .headers={
      'Content-Type': 'application/json',
      'lang':lang,
      'Authorization': token??'',
    };
   return  await dio!.get(
      url,
      queryParameters: query,
    );
  }

  // post endpoint to store data in database
  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic>? data,
    String lang = 'en',
    String? token,
  }) async {
    dio!.options.headers ={
      'Content-Type': 'application/json',
      'lang':lang,
      'Authorization': token??'',
    };
    return await dio!.post(
      url,
      queryParameters: query,
      data: data,
    );
  }


  // put endpoint to update data in database
  static Future<Response> putData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic>? data,
    String lang = 'en',
    String? token,
  }) async {
    dio!.options.headers ={
      'Content-Type': 'application/json',
      'lang':lang,
      'Authorization': token??'',
    };
    return await dio!.put(
      url,
      queryParameters: query,
      data: data,
    );
  }
}
