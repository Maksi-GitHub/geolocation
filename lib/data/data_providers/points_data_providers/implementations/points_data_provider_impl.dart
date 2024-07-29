import 'package:geolocation/data/DTOs/points_dto.dart';
import 'package:geolocation/data/data_providers/points_data_providers/api/points_http_api.dart';
import 'package:geolocation/data/data_providers/points_data_providers/interfaces/interface_points_data_provider.dart';

class PointsDataProviderImpl implements IPointsDataProvider {
  final PointsHttpApi _pointsHttpApi;

  PointsDataProviderImpl({required PointsHttpApi pointsHttpApi})
      : _pointsHttpApi = pointsHttpApi;

  @override
  Future<void> postPoints({required List<PointsDTO> pointsDto}) async {
    final pointsListDto = PointsListDTO(points: pointsDto);
    await _pointsHttpApi.postPointsList(pointsListDto);
  }
}
