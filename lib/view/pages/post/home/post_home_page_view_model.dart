import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http_riverpod_app/model/post/post.dart';


// 창고 관리자 (Provider)
final posthomePageProvider = StateNotifierProvider<PostHomePageViewModel, PostHomePageModel?>((ref) {
  return PostHomePageViewModel(null);
});


// 창고 (Store)
class PostHomePageViewModel extends StateNotifier<PostHomePageModel?>{
  PostHomePageViewModel(super.state);

  void init(List<Post> postDtoList){
    state = PostHomePageModel(posts: postDtoList);
  }

}

// 창고 데이터
class PostHomePageModel {
  List<Post> posts;
  PostHomePageModel({required this.posts});
}
