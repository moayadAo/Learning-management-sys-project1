import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:learning_system/core/api/api_consumer.dart';
import 'package:learning_system/core/errors/exceptions.dart';
import 'package:learning_system/core/helper/upload_file_to_api.dart';
import 'package:learning_system/core/utils/app_url.dart';
import 'package:learning_system/src/features/institute/data/models/accept_teacher_model.dart';
import 'package:learning_system/src/features/institute/data/models/get_all_institute_model.dart';
import 'package:learning_system/src/features/institute/data/models/get_institute_profile_model.dart';
import 'package:learning_system/src/features/institute/data/models/get_my_teachers_model.dart';
import 'package:learning_system/src/features/institute/data/models/get_teacher_to_institute_requists_model.dart';
import 'package:learning_system/src/features/institute/data/models/scholarship_request_model.dart';

part 'institute_state.dart';

class InstituteCubit extends Cubit<InstituteState> {
  InstituteCubit({required this.api}) : super(InstituteInitial());

  ApiConsumer api;

  GetAllInstituteModel? getAllInstituteModel;
  GetInstituteProfileModel? getInstituteProfileModel;
  GetTeacherToInstituteRequistsModel? getTeacherToInstituteRequistsModel;
  GetMyTeacherModel? getMyTeacherModel;
  AcceptTeacherModel? acceptTeacherModel;
  ScholarshipRequestModel? scholarshipRequestModel;

  addInstitute({
    required String email,
    required String password,
    required String name,
    required XFile image,
    required int wallet,
    required List<Map<String, String>> socialMediaAccounts,
    required int cost,
  }) async {
    try {
      emit(AddInstituteLoadingState());
      final response = await api.post(
        AppUrl.addInstitute,
        isFormData: true,
        data: {
          'email': email,
          'password': password,
          'name': name,
          'image': await uploadImageToApi(image),
          'wallet': wallet,
          'socialMediaAccounts': socialMediaAccounts,
          'cost': cost,
        },
      );

      emit(AddInstituteSuccessState());
    } on ServerException catch (e) {
      emit(AddInstituteFailureState(message: e.errorModel.message!));
    }
  }

  loginInstitute({
    required String email,
    required String password,
  }) async {
    try {
      emit(LoginInstituteLoadingState());
      final response = await api.post(
        AppUrl.loginInstitute,
        isFormData: true,
        data: {
          'email': email,
          'password': password,
        },
      );

      emit(LoginInstituteSuccessState());
    } on ServerException catch (e) {
      emit(LoginInstituteFailureState(message: e.errorModel.message!));
    }
  }

  rejectTeacherInstitute({
    required String teacherId,
    required String message,
  }) async {
    try {
      emit(RejectTeacherInstituteLoadingState());
      final response = await api.post(
        AppUrl.rejectTeacherInstitute,
        isFormData: true,
        data: {
          'teacherId': teacherId,
          'message': message,
        },
      );

      emit(RejectTeacherInstituteSuccessState());
    } on ServerException catch (e) {
      emit(RejectTeacherInstituteFailureState(message: e.errorModel.message!));
    }
  }

  addMyStudentInstitute({
    required List<String> userIds,
  }) async {
    try {
      emit(AddMyStudentInstituteLoadingState());
      final response = await api.post(
        AppUrl.addMyStudentInstitute,
        isFormData: true,
        data: {
          'usersId': userIds,
        },
      );

      emit(AddMyStudentInstituteSuccessState());
    } on ServerException catch (e) {
      emit(AddMyStudentInstituteFailureState(message: e.errorModel.message!));
    }
  }

  acceptScholarshipInstitute({
    required String userId,
    required bool approve,
    required String message,
  }) async {
    try {
      emit(AcceptScholarshipInstituteLoadingState());
      final response = await api.post(
        AppUrl.acceptScholarshipInstitute,
        isFormData: true,
        data: {
          'userId': userId,
          'approve': approve,
          'message': message,
        },
      );

      emit(AcceptScholarshipInstituteSuccessState());
    } on ServerException catch (e) {
      emit(AcceptScholarshipInstituteFailureState(
          message: e.errorModel.message!));
    }
  }

  updateInstitute({
    String? email,
    String? password,
    String? name,
    XFile? image,
    int? wallet,
    List<Map<String, String>>? socialMediaAccounts,
    int? cost,
  }) async {
    try {
      emit(UpdateInstituteLoadingState());
      final response = await api.put(
        AppUrl.updateInstitute,
        isFormData: true,
        data: {
          'email': email,
          'password': password,
          'name': name,
          'image': image == null ? null : await uploadImageToApi(image),
          'wallet': wallet,
          'socialMediaAccounts': socialMediaAccounts,
          'cost': cost,
        },
      );

      emit(UpdateInstituteSuccessState());
    } on ServerException catch (e) {
      emit(UpdateInstituteFailureState(message: e.errorModel.message!));
    }
  }

  getAllInstitute() async {
    try {
      emit(GetAllInstituteLoadingState());
      final response = await api.getApi(
        AppUrl.getAllInstitute,
      );

      getAllInstituteModel = GetAllInstituteModel.fromJson(response);
      emit(GetAllInstituteSuccessState());
    } on ServerException catch (e) {
      emit(GetAllInstituteFailureState(message: e.errorModel.message!));
    }
  }

  getInstituteProfileById({required String id}) async {
    try {
      emit(GetInstituteProfileLoadingState());
      final response = await api.getApi(
        AppUrl.getInstituteProfileById(id: id),
      );

      getInstituteProfileModel = GetInstituteProfileModel.fromJson(response);
      emit(GetInstituteProfileSuccessState());
    } on ServerException catch (e) {
      emit(GetInstituteProfileFailureState(message: e.errorModel.message!));
    }
  }

  getTeachertoInstituteRequists() async {
    try {
      emit(GetTeacherToInstituteRequistsLoadingState());
      final response = await api.getApi(
        AppUrl.getTeachertoInstituteRequists,
      );

      getTeacherToInstituteRequistsModel =
          GetTeacherToInstituteRequistsModel.fromJson(response);
      emit(GetTeacherToInstituteRequistsSuccessState());
    } on ServerException catch (e) {
      emit(GetTeacherToInstituteRequistsFailureState(
          message: e.errorModel.message!));
    }
  }

  acceptTeacherInstitute({
    required String teacherId,
    required DateTime startDate,
    required DateTime endDate,
  }) async {
    try {
      emit(AcceptTeacherInstituteLoadingState());
      final response = await api.getApi(
        AppUrl.acceptTeacherInstitute,
        isFormData: true,
        data: {
          'teacherId': teacherId,
          'startDate': startDate,
          'endDate': endDate,
        },
      );

      acceptTeacherModel = AcceptTeacherModel.fromJson(response);
      emit(AcceptTeacherInstituteSuccessState());
    } on ServerException catch (e) {
      emit(AcceptTeacherInstituteFailureState(message: e.errorModel.message!));
    }
  }

  getMyTeachersInstitute({
    required String teacherId,
    required DateTime startDate,
    required DateTime endDate,
  }) async {
    try {
      emit(GetMyTeachersInstituteLoadingState());
      final response = await api.getApi(
        AppUrl.getMyTeachersInstitute,
        isFormData: false,
      );

      getMyTeacherModel = GetMyTeacherModel.fromJson(response);
      emit(GetMyTeachersInstituteSuccessState());
    } on ServerException catch (e) {
      emit(GetMyTeachersInstituteFailureState(message: e.errorModel.message!));
    }
  }

  scholarshipRequestsInstituteById({required String id}) async {
    try {
      emit(ScholarshipRequestsInstituteLoadingState());
      final response = await api.getApi(
        AppUrl.scholarshipRequestsInstituteById(id: id),
      );

      scholarshipRequestModel = ScholarshipRequestModel.fromJson(response);
      emit(ScholarshipRequestsInstituteSuccessState());
    } on ServerException catch (e) {
      emit(ScholarshipRequestsInstituteFailureState(
          message: e.errorModel.message!));
    }
  }

  removeScholarshipStudentInstitute({
    required List<String> userIds,
  }) async {
    try {
      emit(RemoveScholarshipStudentInstituteLoadingState());
      final response = await api.getApi(
        AppUrl.removeScholarshipStudentInstitute,
        isFormData: true,
        data: {
          'usersId': userIds,
        },
      );

      emit(RemoveScholarshipStudentInstituteSuccessState());
    } on ServerException catch (e) {
      emit(RemoveScholarshipStudentInstituteFailureState(
          message: e.errorModel.message!));
    }
  }

  deleteMyStudentInstitute({
    required List<String> userIds,
  }) async {
    try {
      emit(DeleteMyStudentInstituteLoadingState());
      final response = await api.getApi(
        AppUrl.deleteMyStudentInstitute,
        isFormData: true,
        data: {
          'usersId': userIds,
        },
      );

      emit(DeleteMyStudentInstituteSuccessState());
    } on ServerException catch (e) {
      emit(
          DeleteMyStudentInstituteFailureState(message: e.errorModel.message!));
    }
  }

  removepaidStudentInstitute({
    required List<String> userIds,
  }) async {
    try {
      emit(RemovePaidStudentInstituteLoadingState());
      final response = await api.getApi(
        AppUrl.removepaidStudentInstitute,
        isFormData: true,
        data: {
          'usersId': userIds,
        },
      );

      emit(RemovePaidStudentInstituteSuccessState());
    } on ServerException catch (e) {
      emit(RemovePaidStudentInstituteFailureState(
        message: e.errorModel.message!,
      ));
    }
  }
}
