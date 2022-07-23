import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/resto_favorite_controller.dart';

class RestoFavoriteView extends GetView<RestoFavoriteController> {
  const RestoFavoriteView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RestoFavoriteView'),
        centerTitle: true,
      ),
      body: ListView(),
    );
  }
}
