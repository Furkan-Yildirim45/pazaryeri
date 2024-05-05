class CommentModel {
  final int commentID;
  final int customerID;
  final String comment;
  final String commentDate;
  final int starPoint;

  CommentModel(this.commentDate,
      {required this.commentID,
      required this.customerID,
      required this.comment,
      required this.starPoint});
}
