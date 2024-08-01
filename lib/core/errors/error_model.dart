import 'package:json_annotation/json_annotation.dart';
part 'error_model.g.dart';

@JsonSerializable()
class ErrorModel {
  final int? httpStatusCode;
  final String? message;
  final String? stackTrace;

  ErrorModel({this.httpStatusCode, this.message, this.stackTrace});

  factory ErrorModel.fromJson(Map<String, dynamic> json) =>
      _$ErrorModelFromJson(json);
  Map<String, dynamic> toJson() => _$ErrorModelToJson(this);
}
