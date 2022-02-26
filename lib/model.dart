import 'comment.dart';

class MyLoveWan {
  final String user_img;
  final String user_post;
  final String post_detail;
  final String img_post;
  List<UserComment> cm_text;

  MyLoveWan({
    required this.user_img,
    required this.user_post,
    required this.post_detail,
    required this.img_post,
    required this.cm_text,
  });

  void addComment(String u, String t){
    cm_text.add(UserComment(user_comment: '${u}',detail_comment: '${t}'));
  }


}