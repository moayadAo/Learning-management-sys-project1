import 'package:json_annotation/json_annotation.dart';

part 'get_all_messages_teacher_model.g.dart';

@JsonSerializable()
class GetAllMessagesTeacherModel {
  String? status;
  Data? data;

  GetAllMessagesTeacherModel({this.status, this.data});

  factory GetAllMessagesTeacherModel.fromJson(Map<String, dynamic> json) =>
      _$GetAllMessagesTeacherModelFromJson(json);
  Map<String, dynamic> toJson() => _$GetAllMessagesTeacherModelToJson(this);
}

@JsonSerializable()
class Data {
  List<Messages>? messages;
  String? id;

  Data({this.messages, this.id});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class Messages {
  String? instituteName;
  String? theMessage;
  String? sId;

  Messages({this.instituteName, this.theMessage, this.sId});

  factory Messages.fromJson(Map<String, dynamic> json) =>
      _$MessagesFromJson(json);

  Map<String, dynamic> toJson() => _$MessagesToJson(this);
}
