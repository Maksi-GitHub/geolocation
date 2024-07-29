// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'points_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PointsDTOImpl _$$PointsDTOImplFromJson(Map<String, dynamic> json) =>
    _$PointsDTOImpl(
      lat: (json['lat'] as num).toDouble(),
      lng: (json['lng'] as num).toDouble(),
    );

Map<String, dynamic> _$$PointsDTOImplToJson(_$PointsDTOImpl instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
    };

_$PointsListDTOImpl _$$PointsListDTOImplFromJson(Map<String, dynamic> json) =>
    _$PointsListDTOImpl(
      points: (json['points'] as List<dynamic>)
          .map((e) => PointsDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$PointsListDTOImplToJson(_$PointsListDTOImpl instance) =>
    <String, dynamic>{
      'points': instance.points,
    };
