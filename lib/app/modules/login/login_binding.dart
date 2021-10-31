import 'package:get/get.dart';
import 'package:pharma_app/app/data/provider/login_provider.dart';
import 'package:pharma_app/app/data/repository/login_repository.dart';
import 'package:pharma_app/app/modules/login/login_controller.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
    Get.lazyPut<LoginUserRepository>(() => LoginUserRepository());
    Get.lazyPut<LoginApiClient>(() => LoginApiClient());
  }
}
