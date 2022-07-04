class DoCommentModel{
  int postID;
  String userID;
  String comment;

  DoCommentModel({
    required this.postID,
    required this.userID,
    required this.comment,
});

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['post_id'] = postID;
    data['user_id'] = userID;
    data['comment'] = comment;

    return data;
  }
}