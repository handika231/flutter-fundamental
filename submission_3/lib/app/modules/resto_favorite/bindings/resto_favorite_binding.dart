import 'package:get/get.dart';

import '../controllers/resto_favorite_controller.dart';

class RestoFavoriteBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RestoFavoriteController>(
      () => RestoFavoriteController(),
    );
  }
}
