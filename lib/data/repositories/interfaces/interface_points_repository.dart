import 'package:geolocation/data/DTOs/points_dto.dart';

abstract interface class IPointsRepository {
  Future<void> sendPoints({required List<PointsDTO> points});
}
