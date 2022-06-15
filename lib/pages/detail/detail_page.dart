import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_getx/pages/detail/detail_controller.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailController>(
      init: DetailController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            actions: [
              if(controller.state == DetailState.read)
                IconButton(
                  onPressed: () {
                    // code edit
                  },
                  icon: const Icon(Icons.edit, color: Colors.black,),
                )
              else
                IconButton(
                  onPressed: controller.pressedSave,
                  icon: const Icon(Icons.check, color: Colors.black,),
                )
            ],
          ),
          body: Container(
            height: Get.height,
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [

                // #title
                TextField(
                  controller: controller.titleController,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                  decoration: const InputDecoration(
                    hintText: "Title",
                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey))
                  ),
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 20,),

                // #body
                Expanded(
                  child: TextField(
                    expands: true,
                    maxLines: null,
                    controller: controller.bodyController,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                    decoration: const InputDecoration(
                      hintText: "Content",
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}