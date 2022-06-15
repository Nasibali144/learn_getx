import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_getx/pages/home/home_controller.dart';
import 'package:learn_getx/views/post_card_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("POSTS"),
        backgroundColor: Colors.blueGrey[800],
      ),
      body: GetBuilder<HomeController>(
          init: HomeController(),
          builder: (controller) {
          return Stack(
            children: [
              // #body
              ListView.builder(
                  itemCount: controller.items.length,
                  itemBuilder: (context, index) {
                    return PostCardView(post: controller.items[index]);
                  }
              ),

              // #indicator
              Visibility(
                visible: controller.isLoading,
                child: const Center(child: CircularProgressIndicator()),
              )
            ],
          );
        }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}