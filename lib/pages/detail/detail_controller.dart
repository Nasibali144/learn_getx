import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_getx/models/post_model.dart';
import 'package:learn_getx/pages/home/home_controller.dart';
import 'package:learn_getx/services/network_service.dart';
import 'package:learn_getx/services/util_service.dart';

enum DetailState {read, edit, create}

class DetailController extends GetxController {
  late DetailState state = DetailState.create;
  Post? post;
  late TextEditingController titleController = TextEditingController();
  late TextEditingController bodyController = TextEditingController();

  void getData(Post post, DetailState state) {
    this.post = post;
    this.state = state;
    titleController.text = post.title;
    bodyController.text = post.body;
    update();
  }

  bool get readOnly {
    return state == DetailState.read;
  }

  void pressedEdit() {
    state = DetailState.edit;
    update();
  }

  void clearOldData() {
    titleController.clear();
    bodyController.clear();
    state = DetailState.create;
    update();
  }

  void pressedSave() {
    String title = titleController.text.trim().toString();
    String content = bodyController.text.trim().toString();
    if(title.isNotEmpty && content.isNotEmpty) {
      if(state == DetailState.create) {
        _createPost(title, content);
      } else {
        _updatePost(title, content);
      }
    } else {
      Utils.fireSnackGetX("Fields cannot be empty!");
    }
  }

  void _updatePost(String title, String content) {
    post!.title = title;
    post!.body = content;
    NetworkService.PUT(NetworkService.API_POST_UPDATE + post!.id.toString(), post!.toJson()).then((response) => _checkResponse(response));
  }

  void _createPost(String title, String content) {
    post = Post(userId: 1, id: 1, title: title, body: content);
    NetworkService.POST(NetworkService.API_POST_CREATE, NetworkService.bodyCreate(post!)).then((response) => _checkResponse(response));
  }

  void _checkResponse(String? response) {
    if(response != null) {
      Get.back();
      Get.find<HomeController>().getDataFromNetwork();
      Utils.fireSnackGetX("Your Post successfully ${state == DetailState.create ? "saved" : "updated"}!");
    } else {
      Utils.fireSnackGetX("Your Post not saved! Please try again!");
    }
  }
}
