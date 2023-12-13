// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'snake_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SnakeData _$SnakeDataFromJson(Map<String, dynamic> json) => SnakeData(
      snakes: (json['snakes'] as List<dynamic>)
          .map((e) => SnakeVO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SnakeDataToJson(SnakeData instance) => <String, dynamic>{
      'snakes': instance.snakes,
    };
