const baseUrl = "http://192.168.43.224:8080/";
const baseServ = "https://ptc.yorkacademy.uk/";
// const baseUrl = "${baseServ}api/";
const storageUrl = "${baseServ}storage/";
const user = "user/";

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
}

class ApiKey {
  static const email = 'email';
  static const password = 'password';
  static const firstName = 'firstName';
  static const lastName = 'lastName';
  static const birthDate = 'birthDate';
  static const image = 'image';
  static const role = 'role';
  static const authorization = 'Authorization';
}
