import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/search_controller.dart';

class SearchView extends GetView<SearchController> {
  const SearchView({Key? key}) : super(key: key);
  //create method search in textfield

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Obx(
          () => TextField(
            onChanged: (value) {
              controller.searchApi();
            },
            controller: controller.searchController.value,
            onSubmitted: (value) {
              controller.searchController.value.text = value;
            },
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Search',
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: Obx(() => FutureBuilder(
            future: controller.getSeachApi(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.data == null ||
                  snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: Text('No Data...'),
                );
              } else {
                return ListView.builder(
                  itemCount: controller.searchResult.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text('${controller.searchResult[index].name}'),
                    );
                  },
                );
              }
            },
          )),
    );
  }
}
