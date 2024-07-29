import 'package:geolocation/data/DTOs/points_dto.dart' ;
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'points_http_api.g.dart';

@RestApi(baseUrl: 'https://testovoe.pockethost.io/api/collections')
abstract class PointsHttpApi {
  factory PointsHttpApi(Dio dio, {String baseUrl}) = _PointsHttpApi;

  @POST('/geo/records')
  Future<void> postPointsList(
    @Body() PointsListDTO body
  );
}

