class UserInfoModel {
  String? name;
  String? email;
  String? username;

  UserInfoModel({this.name, this.email, this.username});

  UserInfoModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    username = json['username'];
  }
}