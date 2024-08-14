import 'package:json_annotation/json_annotation.dart';

part 'rate_model.g.dart';

@JsonSerializable()
class RateModel {
  double rate;
  String userId;
  String comment;
  @JsonKey(name: '_id')
  String rateId;

  RateModel({
    required this.userId,
    required this.comment,
    required this.rate,
    required this.rateId,
  });

  factory RateModel.fromJson(Map<String, dynamic> json) =>
      _$RateModelFromJson(json);
  Map<String, dynamic> toJson() => _$RateModelToJson(this);
}
