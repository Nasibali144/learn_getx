import 'package:flutter/material.dart';
import 'package:learn_getx/models/post_model.dart';
import 'package:learn_getx/services/log_service.dart';

class PostCardView extends StatelessWidget {
  final Post post;
  const PostCardView({required this.post, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("This widget id: ${post.id} build");
    return Card(
      child: ListTile(
        title: Text(post.title, maxLines: 1, overflow: TextOverflow.ellipsis),
        subtitle: Text(post.body, maxLines: 2, overflow: TextOverflow.ellipsis),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(onPressed: (){
              LogService.i("Pressed post: ${post.id} delete");
            }, icon: const Icon(Icons.delete_outline)),
            IconButton(onPressed: (){
              LogService.v("Pressed post: ${post.id} update");
            }, icon: const Icon(Icons.edit)),
          ],
        ),
      ),
    );
  }
}
