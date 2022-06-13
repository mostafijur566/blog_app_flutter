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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user'] = this.user;
    data['category_id'] = this.categoryId;
    data['title'] = this.title;
    data['body'] = this.body;

    return data;
  }
}