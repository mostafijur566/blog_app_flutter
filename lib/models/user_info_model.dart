class UserInfoModel {
  String? name;
  String? email;
  String? username;
  int? totalPost;

  UserInfoModel({this.name, this.email, this.username, this.totalPost});

  UserInfoModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    username = json['username'];
    totalPost = json['total_post'];
  }
}