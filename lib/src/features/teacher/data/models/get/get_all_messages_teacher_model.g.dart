// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_messages_teacher_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllMessagesTeacherModel _$GetAllMessagesTeacherModelFromJson(
        Map<String, dynamic> json) =>
    GetAllMessagesTeacherModel(
      status: json['status'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetAllMessagesTeacherModelToJson(
        GetAllMessagesTeacherModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      messages: (json['messages'] as List<dynamic>?)
          ?.map((e) => Messages.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: json['id'] as String?,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'messages': instance.messages,
      'id': instance.id,
    };

Messages _$MessagesFromJson(Map<String, dynamic> json) => Messages(
      instituteName: json['instituteName'] as String?,
      theMessage: json['theMessage'] as String?,
      sId: json['sId'] as String?,
    );

Map<String, dynamic> _$MessagesToJson(Messages instance) => <String, dynamic>{
      'instituteName': instance.instituteName,
      'theMessage': instance.theMessage,
      'sId': instance.sId,
    };
