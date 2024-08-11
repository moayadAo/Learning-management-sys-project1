const baseUrl = "http://192.168.43.224:8080/";
const baseServ = "https://ptc.yorkacademy.uk/";
// const baseUrl = "${baseServ}api/";
const storageUrl = "${baseServ}storage/";
const user = "user/";
const mailBox = "mailBox/";
const request = "request";
const replay = "replay";
const users = "users";
const profile = "profile";

class AppUrl {
  /// User
  ///*******************************************************************************
  ///<------------------------------------------------------------------------------
  // static final getUser = "${baseUrl}";
  static const loginUser = "${baseUrl}${user}login";
  static const register = "${baseUrl}${user}";
  static const logout = "${baseUrl}logout";
  static const getProfile = baseServ + 'api';

  ///------------------------------------------------------------------------------>

  ///Mail Box
  ///*******************************************************************************
  ///<------------------------------------------------------------------------------

  ///Request
  static const requestMailBox = "$baseUrl$mailBox$request";
  static const requestMailBoxById = "$baseUrl$mailBox$request/";
  static const getInfoMailBox = "$baseUrl$mailBox$request/getInfoMailBox";
  static const createRequestBox = "$baseUrl$mailBox$request/storeRequest";
  static const uploadFileRequestBox = "$baseUrl$mailBox$request/uploadFile";
  static const requestBoxTypeGlobal = "${baseUrl}request_type";

  ///Replay
  static const replayMailbox = "$baseUrl$mailBox$replay";
  static const replayMailboxById = "$baseUrl$mailBox$replay/";
  static const createReplayBoxBox = "$baseUrl$mailBox$replay/storeReplay";
  static const uploadFileReplayBox = "$baseUrl$mailBox$replay/uploadFile";

  ///------------------------------------------------------------------------------>

  ///Users
  ///*******************************************************************************
  ///<------------------------------------------------------------------------------
  static const getUser = "$baseUrl$profile";

  ///------------------------------------------------------------------------------>
  ///
  ///*******************************************************************************
  ///<------------------------------------------------------------------------------
  ///------------------------------------------------------------------------------>

  ///*******************************************************************************
  ///<------------------------------------------------------------------------------
  ///------------------------------------------------------------------------------>

  ///*******************************************************************************
  ///<------------------------------------------------------------------------------
  ///------------------------------------------------------------------------------>

  ///*******************************************************************************
  ///<------------------------------------------------------------------------------
  ///------------------------------------------------------------------------------>
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
