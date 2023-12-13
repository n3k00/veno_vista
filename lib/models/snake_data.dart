import 'package:json_annotation/json_annotation.dart';

import 'package:veno_vista/models/snake_vo.dart';

part 'snake_data.g.dart';

@JsonSerializable()
class SnakeData {
  List<SnakeVO> snakes;

  SnakeData({required this.snakes});

  /// Connect the generated [_$PersonFromJson] function to the `fromJson`
  /// factory.
  factory SnakeData.fromJson(Map<String, dynamic> json) =>
      _$SnakeDataFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$SnakeDataToJson(this);
}
