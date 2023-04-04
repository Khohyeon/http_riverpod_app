import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http_riverpod_app/model/post/post.dart';
import 'package:http_riverpod_app/model/post/post_repository.dart';
import 'package:http_riverpod_app/view/pages/post/home/post_home_page_view_model.dart';

final postController = Provider<PostController>((ref) {
  return PostController(ref);
});

class PostController {

  Ref ref;
  PostController(this.ref);

  Future<void> findPosts() async {
    List<Post> postDtoList = await PostRepository().findAll();
    ref.read(posthomePageProvider.notifier).init(postDtoList);
  }

  Future<void> addPost(String title) async{
    Post post = await PostRepository().save(title);
    ref.read(posthomePageProvider.notifier).add(post);
  }

  Future<void> removePost(int id) async{
    await PostRepository().deleteById(id);
    ref.read(posthomePageProvider.notifier).remove(id);
  }

  Future<void> updatePost(Post post) async {
    Post postPS = await PostRepository().updatgeById(post);
    ref.read(posthomePageProvider.notifier).update(postPS);
  }
}
