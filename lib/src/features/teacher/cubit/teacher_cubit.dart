// import 'dart:io';

// import 'package:bloc/bloc.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:learning_system/core/api/api_consumer.dart';
// import 'package:learning_system/core/errors/exceptions.dart';
// import 'package:learning_system/core/helper/upload_file_to_api.dart';
// import 'package:learning_system/core/utils/app_url.dart';
// import 'package:learning_system/src/features/teacher/cubit/teacher_state.dart';
// import 'package:learning_system/src/features/teacher/data/models/get/get_all_messages_teacher_model.dart';
// import 'package:learning_system/src/features/teacher/data/models/get/get_all_teacher.dart';
// import 'package:learning_system/src/features/teacher/data/models/get/get_profile_teacher.dart';
// import 'package:learning_system/src/features/teacher/data/models/sign_up_teacher_model.dart';

// class TeacherCubit extends Cubit<TeacherStates> {
//   final ApiConsumer api;

//   TeacherCubit({required this.api}) : super(InitialTeacherState());

//   GetAllTeacherModel? getAllTeacherModel;
//   GetProfileTeacherModel? getProfileTeacherModel;
//   GetAllMessagesTeacherModel? getAllMessagesTeacherModel;
//   XFile? profilePic;

//   String cvUrl = "";
//   String rule = "user";

//   // Future<void> loadCv(String url) async {
//   //   cvUrl = url;
//   //   emit(CvLoadingTeacherState());
//   //   try {
//   //     // Replace with actual PDF loading logic
//   //     await Future.delayed(Duration(seconds: 1));
//   //     emit(CvLoadedTeacherState());
//   //   } catch (e) {
//   //     emit(CvErrorTeacherState(e.toString()));
//   //   }
//   // }

//   // Future<File?> pickDocument() async {
//   //   emit(CvLoadingTeacherState());
//   //   try {
//   //     FilePickerResult? result = await FilePicker.platform.pickFiles(
//   //       type: FileType.custom,
//   //       allowedExtensions: ['pdf'], // Specify allowed file extensions
//   //     );

//   //     if (result != null) {
//   //       emit(CvLoadedTeacherState());
//   //       return File(result.files.single.path!);
//   //     } else {
//   //       emit(CvErrorTeacherState('Unable to Load'));
//   //       return null; // User canceled the picker
//   //     }
//   //   } catch (e) {
//   //     emit(CvErrorTeacherState('Error picking document'));
//   //     return null;
//   //   }
//   // }

//   // void uploadProfilePic(XFile? image) {
//   //   profilePic = image;
//   //   emit(UploadTeacherProfilePicTeacherState());
//   // }

//   // Future<void> addTeacher({
//   //   required String email,
//   //   required String password,
//   //   required String firstName,
//   //   required String lastName,
//   //   required String subject,
//   //   required String summary,
//   //   required XFile? image,
//   //   required File? cv,
//   //   required List<Map<String, String>> socialMediaAccounts,
//   // }) async {
//   //   emit(SignUpLoading());
//   //   try {
//   //     final response = await api.post(
//   //       AppUrl.addTeacher,
//   //       isFormData: true,
//   //       data: {
//   //         'email': email,
//   //         'password': password,
//   //         'firstName': firstName,
//   //         'lastName': lastName,
//   //         'subject': subject,
//   //         'summary': summary,
//   //         'socialMediaAccounts': socialMediaAccounts,
//   //         'cv': cv == null ? null : await uploadDocumentToApi(cv),
//   //         'image': image == null ? null : await uploadImageToApi(image),
//   //       },
//   //     );

//   //     final signupModel = SignUpTeacherModel.fromJson(response);
//   //     emit(SignUpSuccess(message: signupModel.status!));
//   //   } on ServerException catch (e) {
//   //     emit(SignUpFailure(errMessage: e.errorModel.message!));
//   //   } catch (e) {
//   //     emit(SignUpFailure(errMessage: 'Unexpected error occurred'));
//   //   }
//   // }

//   // Future<void> getAllTeachers() async {
//   //   emit(GetAllTeachersLoadingState());
//   //   try {
//   //     final response = await api.getApi(AppUrl.addInstitute);
//   //     getAllTeacherModel = GetAllTeacherModel.fromJson(response);
//   //     emit(GetAllTeachersSuccessState());
//   //   } on ServerException catch (e) {
//   //     emit(GetAllTeachersFailureState(message: e.errorModel.message!));
//   //   }
//   // }
// }
