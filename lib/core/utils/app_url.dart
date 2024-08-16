import 'package:learning_system/core/data/models/quiz_model/quiz_model.dart';

const baseUrl = "http://192.168.43.224:8080/";
const baseServ = "https://ptc.yorkacademy.uk/";
// const baseUrl = "${baseServ}api/";
const storageUrl = "${baseServ}storage/";
const user = "user/";
const course = "course/";
const video = "video/";
const article = "article/";
const quiz = "quiz/";

class AppUrl {
  /// User
  ///*******************************************************************************
  ///<------------------------------------------------------------------------------
  // static final getUser = "${baseUrl}";
  static const loginUser = "${baseUrl}${user}login";
  static const register = "${baseUrl}${user}";
  static const logout = "${baseUrl}logout";
  static const getProfile = '${baseUrl}${user}profile';

  ///------------------------------------------------------------------------------>

  ///<------------------------<<image profile>>---------------------------------->
  static const imageProfileUrl = '${baseUrl}public\\';

  ///<------------------------<<Course>>----------------------------------------->
  static const courseUrl = '${baseUrl}${course}';
  static const createCourse = courseUrl;
  static const getAllCourse = courseUrl;
  static String getCourseUrl(String id) {
    return '$courseUrl$id';
  }

  static String getUsersRating({required String id}) {
    return '${courseUrl}getallUsersOfCourse/$id';
  }

  static String deleteCourseUrl(String id) {
    return '$courseUrl$id';
  }

  static String updateCourseUrl(String id) {
    return '$courseUrl$id';
  }

  ///<------------------------<<Video>>----------------------------------------->
  static const videoUrl = '$courseUrl$video';
  static const createVideo = videoUrl;
  static String getUpdateDeleteVideo({required String videoId}) {
    return '$videoUrl$videoId';
  }

  static String getAllCourseVideo({required String courseId}) {
    return '${videoUrl}/all/$courseId';
  }

  ///<------------------------<<Article>>----------------------------------------->
  static const articleUrl = '$courseUrl$article';
  static const createArticle = articleUrl;
  static String getAllArticle({required String courseId}) {
    return '${articleUrl}/all/$courseId';
  }

  static String getUpdateDeleteArticle({required String articleId}) {
    return '$articleUrl$articleId';
  }

  ///<------------------------<<Quiz>>----------------------------------------->
  static const quizUrl = '$courseUrl$quiz';
  static const createQuizUrl = '$courseUrl$quiz';
  static String getUpdateDeleteQuiz({required String quizId}) {
    return '$quizUrl$quizId';
  }

  static String getAllQuiz({required String courseId}) {
    return '$quizUrl/all/$courseId';
  }

  ///<------------------------<<Question>>----------------------------------------->
  static const questionUrl = '${courseUrl}quize/question';
  static const createQuestion = '$questionUrl/';
  static String getUpdateDeleteQuestion({required String quesId}) {
    return '$questionUrl/$quesId';
  }

  static String getAllQuestion({required String quizId}) {
    return '$questionUrl/\all/$quizId';
  }

  ///-----------------------<<Instute>>-------------------------->
  static const baseInstitute = '$baseUrl/institute';
  static const addInstitute = baseInstitute;
  static const loginInstitute = '$baseInstitute/login';
  static const rejectTeacherInstitute = '$baseInstitute/rejectTeacher';
  static const addMyStudentInstitute = '$baseInstitute/addMyStudent';
  static const acceptScholarshipInstitute = '$baseInstitute/acceptStudent';
  static String acceptScholarshipInstituteById({required String id}) {
    return '$acceptScholarshipInstitute/$id';
  }

  static const updateInstitute = baseInstitute;
  static const getAllInstitute = '$baseInstitute/all';
  static const getInstituteProfile = '$baseInstitute/profile';
  static String getInstituteProfileById({required String id}) {
    return '$getInstituteProfile/$id';
  }

  static const getTeachertoInstituteRequists = '$baseInstitute/teacherRequists';
  static const acceptTeacherInstitute = '$baseInstitute/acceptTeacher';
  static const getMyTeachersInstitute = '$baseInstitute/getMyTeachers';
  static const scholarshipRequestsInstitute =
      '$baseInstitute/ScholarshipRequest';
  static String scholarshipRequestsInstituteById({required String id}) {
    return '$scholarshipRequestsInstitute/$id';
  }

  static const removeScholarshipStudentInstitute =
      '$baseInstitute/removeStudentScholarship';
  static const deleteMyStudentInstitute = '$baseInstitute/deletMyStudent';
  static const removepaidStudentInstitute = '$baseInstitute/deletePaidStudent';
}

class ApiKey {
  ///-----------------------<<user>>-------------------------->
  static const email = 'email';
  static const password = 'password';
  static const firstName = 'firstName';
  static const lastName = 'lastName';
  static const birthDate = 'birthDate';
  static const image = 'image';
  static const role = 'role';

  static const authorization = 'Authorization';

  ///-----------------------<<course>>-------------------------->

  static const courseName = 'name';
  static const courseCost = 'cost';
  static const courseDuration = 'duration';
  static const courseLanguage = 'language';
  static const courseEducationLevel = 'Education_Level';
  static const courseCategories = 'Categories';
  static const coursePlan = 'plan';
  static const courseVideo = 'video';
  static const courseArticle = 'article';
  static const courseQuiz = 'quiz';
  static const courseWhatYouWillLearn = 'what_you_will_learn';
  static const courseImage = 'image';
  static const courseInstituteId = 'instituteId';

  ///-----------------------<<video>>-------------------------->

  static const videoName = 'name';
  static const videoDescription = 'description';
  static const videoDuration = 'duration';
  static const videoPathFile = 'name_video';

  ///-----------------------<<article>>-------------------------->

  static const articlePathFile = 'path_file';
  static const articleTitle = 'title';
  static const articleAuthor = 'author';
  static const articleCategory = 'category';

  ///-----------------------<<quiz>>-------------------------->

  static const quizName = 'name';
  static const quizQustions = 'qustions';
  static const quizMark = 'mark';

  ///-----------------------<<quiz>>-------------------------->
  static const questionTitle = 'question';
  static const questionAnswers = ' answers';
  static const questionCorrectAnswer = 'true_answer';
  //// public
  static const order = 'order';
}

class QueryPrametersApi {
  static const getAllCouserLimit = 'limit';
  static const getAllCouserPage = 'page';
  static const getAllCouserSort = 'sort';
  static const getAllCouserFields = 'fields';
  static const getAllCouserCostGreaterThan = 'cost[gte]';
}
