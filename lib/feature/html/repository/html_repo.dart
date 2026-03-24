import 'package:get/get_connect/http/src/response/response.dart';
import 'package:purplestage/api/client_api.dart';
import 'package:purplestage/utils/app_constants.dart';

class HtmlRepository{
  final ApiClient apiClient;
  HtmlRepository({required this.apiClient});

  Future<Response> getPagesContent() async {
    return await apiClient.getData(AppConstants.pages);
  }

}