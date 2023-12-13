// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'snake_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SnakeVO _$SnakeVOFromJson(Map<String, dynamic> json) => SnakeVO(
      json['Id'] as int,
      json['MMName'] as String,
      json['EngName'] as String?,
      json['Detail'] as String,
      json['IsPoison'] as String,
      json['IsDanger'] as String?,
    );

Map<String, dynamic> _$SnakeVOToJson(SnakeVO instance) => <String, dynamic>{
      'Id': instance.id,
      'MMName': instance.mmName,
      'EngName': instance.engName,
      'Detail': instance.detail,
      'IsPoison': instance.isPoison,
      'IsDanger': instance.isDanger,
    };
