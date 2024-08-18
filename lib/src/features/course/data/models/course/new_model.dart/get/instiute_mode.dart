import 'package:json_annotation/json_annotation.dart';
part 'instiute_mode.g.dart';

@JsonSerializable()
class InstiutIdModel {
  String name;
  String id;

  InstiutIdModel({required this.id, required this.name});

  factory InstiutIdModel.fromJson(Map<String, dynamic> json) =>
      _$InstiutIdModelFromJson(json);
  Map<String, dynamic> toJson() => _$InstiutIdModelToJson(this);
}
