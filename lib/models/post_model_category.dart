class PostCategory {
  int? _totalPost;
  late List<AllPosts> _allPosts;
  List<AllPosts> get allPosts => _allPosts;

  PostCategory({required totalPost, required allPosts}){
    this._totalPost =totalPost;
    this._allPosts = allPosts;
  }

  PostCategory.fromJson(Map<String, dynamic> json) {
    _totalPost = json['total_post'];
    if (json['all_posts'] != null) {
      _allPosts = <AllPosts>[];
      json['all_posts'].forEach((v) {
        _allPosts.add(AllPosts.fromJson(v));
      });
    }
  }
}

class AllPosts {
  int? id;
  String? title;
  String? body;
  String? postDate;
  String? user;
  int? categoryId;

  AllPosts(
      {this.id,
        this.title,
        this.body,
        this.postDate,
        this.user,
        this.categoryId});

  AllPosts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    body = json['body'];
    postDate = json['post_date'];
    user = json['user'];
    categoryId = json['category_id'];
  }

}