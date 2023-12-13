import 'package:json_annotation/json_annotation.dart';

part 'snake_vo.g.dart';

@JsonSerializable()
class SnakeVO {
  @JsonKey(name: 'Id')
  int id;

  @JsonKey(name: "MMName")
  String mmName;

  @JsonKey(name: "EngName")
  String? engName;

  @JsonKey(name: "Detail")
  String detail;

  @JsonKey(name: "IsPoison")
  String isPoison;

  @JsonKey(name: "IsDanger")
  String? isDanger;

  SnakeVO(this.id, this.mmName, this.engName, this.detail, this.isPoison,
      this.isDanger);

  /// Connect the generated [_$PersonFromJson] function to the `fromJson`
  /// factory.
  factory SnakeVO.fromJson(Map<String, dynamic> json) =>
      _$SnakeVOFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$SnakeVOToJson(this);
}
