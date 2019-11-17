class UserModel {
  final String userName;
  final String token;
  final String email;
  final int userId;

  UserModel(this.userName, this.token, this.email, this.userId);

  UserModel.fromJson(Map<String, dynamic> json):
        userName = json['name'],
        //token = json['token'],
        token=json['access'],
        email = json['email'],
        userId = json['pk'];

  Map<String, dynamic> toJson() =>
      {
        'name': userName,
        'token': token,
        'email': email,
        'pk': userId,
      };
}