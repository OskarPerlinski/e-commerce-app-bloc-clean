class UserCreationReq {
  String ? firstname;
  String ? lastname;
  String ? email;
  String ? password;

  UserCreationReq({
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.password
  });
}