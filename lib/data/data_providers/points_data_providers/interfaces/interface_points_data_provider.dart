import 'package:geolocation/data/DTOs/points_dto.dart';

abstract interface class IPointsDataProvider {
  Future<void> postPoints({required List<PointsDTO> pointsDto});
}
