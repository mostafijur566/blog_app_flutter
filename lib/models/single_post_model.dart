class SinglePostModel{
  int? id;
  String? title;
  String? body;
  String? postDate;
  String? user;
  int? categoryId;

  SinglePostModel(
      {this.id,
        this.title,
        this.body,
        this.postDate,
        this.user,
        this.categoryId});

  SinglePostModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    body = json['body'];
    postDate = json['post_date'];
    user = json['user'];
    categoryId = json['category_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['body'] = this.body;
    data['user'] = this.user;
    data['category_id'] = this.categoryId;

    return data;
  }
}