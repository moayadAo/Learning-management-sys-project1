import 'package:json_annotation/json_annotation.dart';

part 'order_model.g.dart';

@JsonSerializable()
class OrderModel {
  String id;
  String? name;
  String type;
  OrderModel({
    required this.id,
    this.name,
    required this.type,
  });
  // Factory constructor for creating a new instance from a map
  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);

  // Method to convert an instance to a map
  Map<String, dynamic> toJson() => _$OrderModelToJson(this);
}
