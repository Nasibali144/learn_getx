import 'package:flutter/material.dart';
import 'package:learn_getx/models/post_model.dart';
import 'package:learn_getx/services/network_service.dart';
import 'package:learn_getx/services/util_service.dart';
import 'package:learn_getx/views/post_card_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Post> items = [];
  bool isLoading = false;

  @override
  initState() {
    super.initState();
    // connecting internet
    getDataFromNetwork();
  }

  void getDataFromNetwork() async {
    setState((){
      isLoading = true;
    });
    NetworkService.GET(NetworkService.API_POST, NetworkService.emptyParams()).then((response) {
      if(response != null) {
        showData(response);
      } else {
        Utils.fireSnackBar("Please tyr again! Something went error!", context);
      }
    });
    setState((){
      isLoading = false;
    });
  }

  void showData(String response) {
    setState(() {
      items = NetworkService.parsePostList(response);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("POSTS"),
        backgroundColor: Colors.blueGrey[800],
      ),
      body: Stack(
        children: [
          // #body
          ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return PostCardView(post: items[index]);
              }
          ),
          
          // #indicator
          if(isLoading) const Center(child: CircularProgressIndicator()),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}