class CreateAccountRequestData {
  String name;
  String email;
  String password;
  String confirmPassword;

  CreateAccountRequestData(
      {required this.name,
      required this.email,
      required this.password,
      required this.confirmPassword});
}
