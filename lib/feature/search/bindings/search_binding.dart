import 'package:get/get.dart';
import 'package:purplestage/utils/core_export.dart';

class SearchBinding extends Bindings{
  @override
  void dependencies() async {
    Get.lazyPut(() => AllSearchController(searchRepo: SearchRepo(apiClient: Get.find(), sharedPreferences: Get.find())));
  }
}