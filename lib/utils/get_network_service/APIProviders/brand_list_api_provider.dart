import 'package:get/get_connect/http/src/response/response.dart';

import 'dart:convert';

import 'package:get/get.dart';
import 'package:solo_luxury/data/model/brand_list/brand_model.dart';
import 'package:solo_luxury/utils/app_constants.dart';

abstract class IBrandListProvider {
  Future<Response> getBrandListAPIResponse({required String endPoint});
}

class BrandListAPIProvider extends GetConnect implements IBrandListProvider {
  @override
  void onInit() {
    //Get All Store Model (Websites,Views and Configs)
    httpClient.defaultDecoder = (val) => BrandModel.fromJson(val);
    httpClient.baseUrl = AppConstants.apiEndPointNew;
    httpClient.timeout = const Duration(seconds: 60);
  }

  @override
  Future<Response> getBrandListAPIResponse({required String endPoint}) {
    httpClient.defaultDecoder = (val) => jsonEncode(val);
    httpClient.baseUrl = AppConstants.apiEndPointNew;
    httpClient.timeout = const Duration(seconds: 60);
    print("url country -> " + httpClient.baseUrl.toString() + endPoint);
    return get(endPoint, headers: {
      "Content-type": "application/json",
      "Authorization": AppConstants.defaultToken
    });
  }
}
