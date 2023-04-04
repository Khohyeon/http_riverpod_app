import 'package:http_riverpod_app/model/post/post.dart';

class PostRepository {
  // 싱글톤 만들기
  static PostRepository _instace = PostRepository._single();

  PostRepository._single();

  factory PostRepository() {
    return _instace;
  }

  Future<List<Post>> findAll() {
    return Future.delayed(Duration(seconds: 1), (){
      return [
        Post(id: 1, title: "제목1"),
        Post(id: 2, title: "제목2"),
        Post(id: 3, title: "제목3"),
      ];
    });
  }

  Future<void>? save() {
    return null;
  }
}
