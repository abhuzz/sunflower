import 'package:dio/dio.dart';
import 'package:sunflower/utils/api/url.dart';

class Api {
  static Future<dynamic> fetchGroups(String type,String game) async {
    Dio dio = Dio();
    try{
      Response response = await dio.get(
          Url.GET_GROUP_LIST,
          options: Options(
            contentType: Headers.formUrlEncodedContentType,),
          queryParameters: {
            "type": type,
            "game": game,
          }
      );
      return response;
    } catch (error, stacktrace) {
      return error.toString();
    }
  }

  static Future<dynamic> fetchTeam(String type) async {
    Dio dio = Dio();
    try{
      Response response = await dio.get(
          Url.GET_TEAM_LIST,
          options: Options(
            contentType: Headers.formUrlEncodedContentType,),
          queryParameters: {
            "type": type,
          }
      );
      return response;
    } catch (error, stacktrace) {
      return error.toString();
    }
  }

}