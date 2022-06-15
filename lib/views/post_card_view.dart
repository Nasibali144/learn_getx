import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_getx/models/post_model.dart';
import 'package:learn_getx/pages/detail/detail_controller.dart';
import 'package:learn_getx/pages/detail/detail_page.dart';
import 'package:learn_getx/services/log_service.dart';

class PostCardView extends StatelessWidget {
  final Post post;
  final DetailController detailController = Get.find<DetailController>();
  PostCardView({required this.post, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("This widget id: ${post.id} build");
    return Card(
      child: ListTile(
        onTap: () {
          detailController.getData(post, DetailState.read);
          Get.to(() => const DetailPage());
        },
        title: Text(post.title, maxLines: 1, overflow: TextOverflow.ellipsis),
        subtitle: Text(post.body, maxLines: 2, overflow: TextOverflow.ellipsis),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: () {
                LogService.i("Pressed post: ${post.id} delete");
              },
              icon: const Icon(Icons.delete_outline),
            ),
            IconButton(
              onPressed: () {
                LogService.v("Pressed post: ${post.id} update");
                detailController.getData(post, DetailState.edit);
                Get.to(() => const DetailPage());
              },
              icon: const Icon(Icons.edit),
            ),
          ],
        ),
      ),
    );
  }
}
