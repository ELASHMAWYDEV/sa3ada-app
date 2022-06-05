import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:sa3ada_app/utils/constants.dart';
import 'package:sa3ada_app/utils/services/localization_service.dart';
import 'package:sa3ada_app/utils/services/storage_service.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:get/get.dart' hide Response, FormData;

class ApiService extends GetxService {
  static final ApiService _apiUtil = ApiService._();
  ApiService._() {
    init();
  }
  factory ApiService() {
    return _apiUtil;
  }

  Dio dio = Dio();

  void init() {
    dio.options.baseUrl = "";
    dio.options.connectTimeout = 30000;
    dio.options.receiveTimeout = 60000;
    dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: true,
      compact: true,
    ));
  }

  Future<dynamic> request<T>(String endPoint, String method,
      {Map<String, dynamic>? data,
      Map<String, dynamic>? queryParamters,
      String contentType = "application/json",
      bool loaderEnabled = true,
      bool showSuccessMessage = false,
      bool showErrorMessage = true,
      VoidCallback? onDismiss}) async {
    try {
      // if (loaderEnabled) Loader.startLoading();
      Response response = await dio.request<T>(endPoint,
          data: data ?? {},
          queryParameters: queryParamters,
          options: Options(method: method, contentType: contentType, headers: {
            "Authorization": "Bearer ${Get.find<StorageService>().token}",
            "Accept-Langugage":
                Get.find<LocalizationService>().activeLocale.toString(),
          }));

      if (response.statusCode != 200) {
        throw "من فضلك تحقق من اتصالك بالانترنت وحاول مرة إخري";
      }

      // if (loaderEnabled) Loader.stopLoading();

      //Parse response
      // final dataModel = QuranResponseModel.fromJson(response.data);
      // if (dataModel.code != 200 && showErrorMessage) {
      //   // AlertPromptBox.showError(
      //   //     error: dataModel.message, onDismiss: onDismiss);
      //   return false; //In case you are waiting for just the request failure
      // }

      // // if (showSuccessMessage) {
      // //   AlertPromptBox.showSuccess(
      // //       message: "${dataModel.message}", onDismiss: onDismiss);
      // // }

      // if (dataModel.code == 200 && dataModel.data == null) {
      //   return true; //In case you are waiting for just the request success
      // }

      // return dataModel.data;
      return true;
    } catch (e) {
      // if (loaderEnabled) Loader.stopLoading();
      // if (showErrorMessage)
      //   AlertPromptBox.showError(
      //       error: "حدث خطأ ما ، يرجي المعاودة لاحقا", onDismiss: onDismiss);
      return false;
    }
  }
}
