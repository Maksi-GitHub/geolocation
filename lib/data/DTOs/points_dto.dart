import 'package:freezed_annotation/freezed_annotation.dart';

part 'points_dto.freezed.dart';
part 'points_dto.g.dart';

@freezed
class PointsDTO with _$PointsDTO {
  const factory PointsDTO({
    @JsonKey(name: 'lat')required double lat,
    @JsonKey(name: 'lng')required double lng,
  }) = _PointsDTO;

   factory PointsDTO.fromJson(Map<String, Object?> json) =>
      _$PointsDTOFromJson(json);
}

@freezed
class PointsListDTO with _$PointsListDTO {
  const factory PointsListDTO({
    @JsonKey(name: 'points') required List<PointsDTO> points,
  }) = _PointsListDTO;

  factory PointsListDTO.fromJson(Map<String, Object?> json) =>
      _$PointsListDTOFromJson(json);
}