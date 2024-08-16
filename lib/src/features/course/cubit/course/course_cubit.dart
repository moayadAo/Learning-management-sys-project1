import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:learning_system/core/api/api_consumer.dart';
import 'package:learning_system/core/errors/exceptions.dart';
import 'package:learning_system/core/helper/upload_file_to_api.dart';
import 'package:learning_system/core/utils/app_url.dart';
import 'package:learning_system/src/features/course/cubit/course/course_state.dart';
import 'package:learning_system/src/features/course/data/models/course/course_model/course_data_model.dart';
import 'package:learning_system/src/features/course/data/models/course/getAll/get_all_course_model.dart';
import 'package:learning_system/src/features/course/data/models/course/get_response_course_model.dart';
import 'package:learning_system/src/features/course/data/models/course/get_users_of_course.dart';
import 'package:learning_system/src/features/course/data/models/rate/rate_model.dart';

class CourseCubit extends Cubit<CourseState> {
  ///delete test
  ///for test

  final int totalItems = 20;
  bool isExpanded = false;

  void toggleList() {
    isExpanded = !isExpanded;
    emit(isExpanded ? IsExpanded() : IsNotExpanded());
  }

/////////////////////////////////////////////////////////
//
  ApiConsumer api;
  CourseDataModel? course;
  List<CourseDataModel> listCourse = [];
  List<String> videoId = [];
  List<String> articleId = [];
  List<String> quizId = [];
  Set<int> order = <int>{};

  TextEditingController courseName = TextEditingController();
  TextEditingController courseCost = TextEditingController();
  TextEditingController courseDuration = TextEditingController();
  TextEditingController courseLanguage = TextEditingController();
  TextEditingController courseEducationLevel = TextEditingController();
  TextEditingController courseCategories = TextEditingController();
  TextEditingController courseWhatYouWillLearn = TextEditingController();

  CourseCubit({required this.api}) : super(InitialCourseState());

  createCourse(
      {required String name,
      required double cost,
      required int duration,
      required String language,
      required String educationLevel,
      String? categories,
      List<String>? plan,
      List<String>? videoIds,
      List<String>? articleIds,
      List<String>? quizIds,
      String? institutionId,
      String? whatYouWillLearn,
      XFile? image}) async {
    final Map<String, dynamic> data = {
      ApiKey.courseName: name,
      ApiKey.courseCost: cost,
      ApiKey.courseDuration: duration,
      ApiKey.courseLanguage: language.split(RegExp(r'[ ,]+')),
      ApiKey.courseEducationLevel: educationLevel,
      ApiKey.courseCategories: categories ?? '',
      ApiKey.coursePlan: plan ?? [],
      ApiKey.courseVideo: videoIds ?? [],
      ApiKey.courseArticle: articleIds ?? [],
      ApiKey.courseQuiz: quizIds ?? [],
      ApiKey.courseWhatYouWillLearn: whatYouWillLearn ?? '',
    };

    if (institutionId != null) {
      data[ApiKey.courseInstituteId] = institutionId;
    }

    if (image != null) {
      data[ApiKey.courseImage] = await uploadImageToApi(image);
    }
    try {
      emit(CreateCourseLoadingState());
      final response = await api.post(AppUrl.createCourse, data: data);
      emit(CreateCourseSuccessState());
    } on ServerException catch (e) {
      emit(CreateCourseFailureState(errMessage: e.errorModel.message!));
    }
  }

  getCourse({required String courseId}) async {
    try {
      emit(GetCourseLoadingState());
      final response = await api.getApi(AppUrl.getCourseUrl(courseId));
      course = GetResponseCourseModel.fromJson(response).data.course;
      emit(GetCourseSuccessState());
    } on ServerException catch (e) {
      emit(GetCourseFailureState(errMessage: e.errorModel.message!));
    }
  }

  getAllCourse(
      {int? limit,
      int? page,
      bool? sortCostFromBiggerToSmall,
      bool fields = false,
      int? costGreatThan}) async {
    try {
      final response = await api.getApi(AppUrl.courseUrl, queryParameters: {
        QueryPrametersApi.getAllCouserLimit: limit,
        QueryPrametersApi.getAllCouserPage: page,
        QueryPrametersApi.getAllCouserSort: sortCostFromBiggerToSmall == true
            ? '-cost'
            : sortCostFromBiggerToSmall == false
                ? 'cost'
                : null,
        QueryPrametersApi.getAllCouserFields:
            fields == true ? 'name,cost,rate' : null,
        QueryPrametersApi.getAllCouserCostGreaterThan: costGreatThan,
      });
      GetAllCourseModel modelResponse = GetAllCourseModel.fromJson(response);
      int result = modelResponse.result;
      if (result == 0) {
        emit(GetAllCourseEmptyListState());
      } else {
        listCourse = modelResponse.data.courses;
        emit(GetAllCourseSuccessState());
      }
    } on ServerException catch (e) {
      emit(GetAllCourseFailureState(errMessage: e.errorModel.message!));
    }
  }

  deleteCourse({required String courseId}) async {
    try {
      emit(DeleteCourseLoadingState());
      final response = await api.delete(AppUrl.deleteCourseUrl(courseId));
      emit(DeleteCourseSuccessState(message: 'delete succsseful'));
    } on ServerException catch (e) {
      emit(DeleteCourseFailureState(errMessage: e.errorModel.message!));
    }
  }

  getUsersRating({required String courseId}) async {
    try {
      emit(GetRatingCourseLoadingState());
      final response = await api.getApi(AppUrl.getUsersRating(id: courseId));

      List<RateModel> ratings =
          GetUsersOfCourse.fromJson(response).data.ratings!;
      emit(GetRatingCourseSuccessState());
      return ratings;
    } on ServerException catch (e) {
      emit(GetRatingCourseFailureState(message: e.errorModel.message!));
    }
  }

  updateCourse(
      {String? name,
      required String courseId,
      double? cost,
      int? duration,
      List<String>? language,
      String? educationLevel,
      String? categories,
      List<String>? plan,
      List<String>? videoIds,
      List<String>? articleIds,
      String? institutionId,
      String? whatYouWillLearn,
      XFile? image}) async {
    final Map<String, dynamic> data = {};

    if (name != null) data[ApiKey.courseName] = name;
    if (cost != null) data[ApiKey.courseCost] = cost;
    if (duration != null) data[ApiKey.courseDuration] = duration;
    if (language != null) data[ApiKey.courseLanguage] = language;
    if (educationLevel != null) {
      data[ApiKey.courseEducationLevel] = educationLevel;
    }
    if (categories != null) data[ApiKey.courseCategories] = categories;
    if (plan != null) data[ApiKey.coursePlan] = plan;
    if (videoIds != null) data[ApiKey.courseVideo] = videoIds;
    if (articleIds != null) data[ApiKey.courseArticle] = articleIds;
    if (institutionId != null) data[ApiKey.courseInstituteId] = institutionId;
    if (whatYouWillLearn != null) {
      data[ApiKey.courseWhatYouWillLearn] = whatYouWillLearn;
    }
    if (image != null) data[ApiKey.courseImage] = await uploadImageToApi(image);

    try {
      emit(UpdateCourseLoadingState());
      final response =
          await api.patch(AppUrl.updateCourseUrl(courseId), data: data);
      emit(UpdateCourseSuccessState());
    } on ServerException catch (e) {
      emit(UpdateCourseFailureState(message: e.errorModel.message!));
    }
  }
}
