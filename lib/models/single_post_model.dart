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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['body'] = body;
    data['user'] = user;
    data['category_id'] = categoryId;

    return data;
  }
}