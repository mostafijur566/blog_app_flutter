class PostABlogModel{
  String user;
  int categoryId;
  String title;
  String body;

  PostABlogModel({
    required this.user,
    required this.categoryId,
    required this.title,
    required this.body
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user'] = user;
    data['category_id'] = categoryId;
    data['title'] = title;
    data['body'] = body;

    return data;
  }
}