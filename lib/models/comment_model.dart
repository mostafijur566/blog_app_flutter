class CommentModel {
  int? _totalComment;
  late List<Comment> _comment;
  List<Comment> get comment => _comment;

  CommentModel({required totalComment, required comment}){
    _totalComment = totalComment;
    _comment = comment;
  }

  CommentModel.fromJson(Map<String, dynamic> json) {
    _totalComment = json['total_comment'];
    if (json['comment'] != null) {
      _comment = <Comment>[];
      json['comment'].forEach((v) {
        _comment.add(Comment.fromJson(v));
      });
    }
  }
}

class Comment {
  int? id;
  String? comment;
  String? commentDate;
  int? postId;
  String? userId;

  Comment({this.id, this.comment, this.commentDate, this.postId, this.userId});

  Comment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    comment = json['comment'];
    commentDate = json['comment_date'];
    postId = json['post_id'];
    userId = json['user_id'];
  }
}