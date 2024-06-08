
class ID{
  String id;
  ID({required this.id});
}

class UserID{
  static String email = "";
  static String password = "";

  UserID({required String userEmail,required String userPassword}){
    email = userEmail;
    password = userPassword;
  }
}