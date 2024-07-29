// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'points_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PointsDTO _$PointsDTOFromJson(Map<String, dynamic> json) {
  return _PointsDTO.fromJson(json);
}

/// @nodoc
mixin _$PointsDTO {
  @JsonKey(name: 'lat')
  double get lat => throw _privateConstructorUsedError;
  @JsonKey(name: 'lng')
  double get lng => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PointsDTOCopyWith<PointsDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PointsDTOCopyWith<$Res> {
  factory $PointsDTOCopyWith(PointsDTO value, $Res Function(PointsDTO) then) =
      _$PointsDTOCopyWithImpl<$Res, PointsDTO>;
  @useResult
  $Res call(
      {@JsonKey(name: 'lat') double lat, @JsonKey(name: 'lng') double lng});
}

/// @nodoc
class _$PointsDTOCopyWithImpl<$Res, $Val extends PointsDTO>
    implements $PointsDTOCopyWith<$Res> {
  _$PointsDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lat = null,
    Object? lng = null,
  }) {
    return _then(_value.copyWith(
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lng: null == lng
          ? _value.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PointsDTOImplCopyWith<$Res>
    implements $PointsDTOCopyWith<$Res> {
  factory _$$PointsDTOImplCopyWith(
          _$PointsDTOImpl value, $Res Function(_$PointsDTOImpl) then) =
      __$$PointsDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'lat') double lat, @JsonKey(name: 'lng') double lng});
}

/// @nodoc
class __$$PointsDTOImplCopyWithImpl<$Res>
    extends _$PointsDTOCopyWithImpl<$Res, _$PointsDTOImpl>
    implements _$$PointsDTOImplCopyWith<$Res> {
  __$$PointsDTOImplCopyWithImpl(
      _$PointsDTOImpl _value, $Res Function(_$PointsDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lat = null,
    Object? lng = null,
  }) {
    return _then(_$PointsDTOImpl(
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lng: null == lng
          ? _value.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PointsDTOImpl implements _PointsDTO {
  const _$PointsDTOImpl(
      {@JsonKey(name: 'lat') required this.lat,
      @JsonKey(name: 'lng') required this.lng});

  factory _$PointsDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$PointsDTOImplFromJson(json);

  @override
  @JsonKey(name: 'lat')
  final double lat;
  @override
  @JsonKey(name: 'lng')
  final double lng;

  @override
  String toString() {
    return 'PointsDTO(lat: $lat, lng: $lng)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PointsDTOImpl &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lng, lng) || other.lng == lng));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, lat, lng);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PointsDTOImplCopyWith<_$PointsDTOImpl> get copyWith =>
      __$$PointsDTOImplCopyWithImpl<_$PointsDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PointsDTOImplToJson(
      this,
    );
  }
}

abstract class _PointsDTO implements PointsDTO {
  const factory _PointsDTO(
      {@JsonKey(name: 'lat') required final double lat,
      @JsonKey(name: 'lng') required final double lng}) = _$PointsDTOImpl;

  factory _PointsDTO.fromJson(Map<String, dynamic> json) =
      _$PointsDTOImpl.fromJson;

  @override
  @JsonKey(name: 'lat')
  double get lat;
  @override
  @JsonKey(name: 'lng')
  double get lng;
  @override
  @JsonKey(ignore: true)
  _$$PointsDTOImplCopyWith<_$PointsDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PointsListDTO _$PointsListDTOFromJson(Map<String, dynamic> json) {
  return _PointsListDTO.fromJson(json);
}

/// @nodoc
mixin _$PointsListDTO {
  @JsonKey(name: 'points')
  List<PointsDTO> get points => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PointsListDTOCopyWith<PointsListDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PointsListDTOCopyWith<$Res> {
  factory $PointsListDTOCopyWith(
          PointsListDTO value, $Res Function(PointsListDTO) then) =
      _$PointsListDTOCopyWithImpl<$Res, PointsListDTO>;
  @useResult
  $Res call({@JsonKey(name: 'points') List<PointsDTO> points});
}

/// @nodoc
class _$PointsListDTOCopyWithImpl<$Res, $Val extends PointsListDTO>
    implements $PointsListDTOCopyWith<$Res> {
  _$PointsListDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? points = null,
  }) {
    return _then(_value.copyWith(
      points: null == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as List<PointsDTO>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PointsListDTOImplCopyWith<$Res>
    implements $PointsListDTOCopyWith<$Res> {
  factory _$$PointsListDTOImplCopyWith(
          _$PointsListDTOImpl value, $Res Function(_$PointsListDTOImpl) then) =
      __$$PointsListDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'points') List<PointsDTO> points});
}

/// @nodoc
class __$$PointsListDTOImplCopyWithImpl<$Res>
    extends _$PointsListDTOCopyWithImpl<$Res, _$PointsListDTOImpl>
    implements _$$PointsListDTOImplCopyWith<$Res> {
  __$$PointsListDTOImplCopyWithImpl(
      _$PointsListDTOImpl _value, $Res Function(_$PointsListDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? points = null,
  }) {
    return _then(_$PointsListDTOImpl(
      points: null == points
          ? _value._points
          : points // ignore: cast_nullable_to_non_nullable
              as List<PointsDTO>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PointsListDTOImpl implements _PointsListDTO {
  const _$PointsListDTOImpl(
      {@JsonKey(name: 'points') required final List<PointsDTO> points})
      : _points = points;

  factory _$PointsListDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$PointsListDTOImplFromJson(json);

  final List<PointsDTO> _points;
  @override
  @JsonKey(name: 'points')
  List<PointsDTO> get points {
    if (_points is EqualUnmodifiableListView) return _points;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_points);
  }

  @override
  String toString() {
    return 'PointsListDTO(points: $points)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PointsListDTOImpl &&
            const DeepCollectionEquality().equals(other._points, _points));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_points));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PointsListDTOImplCopyWith<_$PointsListDTOImpl> get copyWith =>
      __$$PointsListDTOImplCopyWithImpl<_$PointsListDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PointsListDTOImplToJson(
      this,
    );
  }
}

abstract class _PointsListDTO implements PointsListDTO {
  const factory _PointsListDTO(
          {@JsonKey(name: 'points') required final List<PointsDTO> points}) =
      _$PointsListDTOImpl;

  factory _PointsListDTO.fromJson(Map<String, dynamic> json) =
      _$PointsListDTOImpl.fromJson;

  @override
  @JsonKey(name: 'points')
  List<PointsDTO> get points;
  @override
  @JsonKey(ignore: true)
  _$$PointsListDTOImplCopyWith<_$PointsListDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
