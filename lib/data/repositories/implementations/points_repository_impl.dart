import 'package:geolocation/data/DTOs/points_dto.dart';
import 'package:geolocation/data/data_providers/points_data_providers/interfaces/interface_points_data_provider.dart';
import 'package:geolocation/data/repositories/interfaces/interface_points_repository.dart';

class PointsRepositoryImpl implements IPointsRepository {
  final IPointsDataProvider _pointsDataProvider;

  PointsRepositoryImpl({required IPointsDataProvider pointsDataProvider})
      : _pointsDataProvider = pointsDataProvider;

  @override
  Future<void> sendPoints({required List<PointsDTO> points}) {
    return _pointsDataProvider.postPoints(pointsDto: points);
  }
}

