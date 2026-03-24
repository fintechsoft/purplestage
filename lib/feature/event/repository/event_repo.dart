import 'package:purplestage/utils/core_export.dart';
import 'package:get/get.dart';

class EventRepo {
  final ApiClient apiClient;
  EventRepo({required this.apiClient});

  Future<Response> getEventList ({required int offset}) async {
    return await apiClient.getData(
        "${AppConstants.getEventList}?limit=10&offset=$offset&booking_status=approved");
  }


  
}