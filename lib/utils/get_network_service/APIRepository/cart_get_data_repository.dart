import 'dart:convert';

import 'package:solo_luxury/data/model/Faq/faq_model.dart';
import 'package:solo_luxury/data/model/cart/cart_model.dart';
import 'package:solo_luxury/utils/get_network_service/APIProviders/cart_get_data_api_provider.dart';

import 'package:solo_luxury/utils/get_network_service/repository_adapter.dart';

import '../../app_constants.dart';
import '../../validator.dart';

class CartGetDataAPIRepository implements ICartRepository {
  final CartGetDataProvider cartGetDataProvider;

  CartGetDataAPIRepository({required this.cartGetDataProvider});

  @override
  Future<dynamic> getCartGetDataApiResponse(apiEndPoint) async {
    final response = await cartGetDataProvider.getCartGetDataResponseProvider(
        endPoint: apiEndPoint);
    if (response != null) {
      print("response.statusCode -> ");
      print(response.statusCode);
    }
    if (response.status.hasError) {
      print("error -> ");
      print(response.statusText!);
      Validators.apiResponseMessage(
          body: response.body!, message: response.statusText);
      return null;
    } else {
      print("success -> ");
      return response.body!;
    }
  }

  @override
  Future<dynamic> deleteCartCartQTYDataApiResponse(itemId, apiEndPOint) async {
    final response = await cartGetDataProvider
        .deleteCartQtyDataResponseProvider(endPoint: apiEndPOint + itemId);
    if (response != null) {
      print("Response Is $response");
      print("response.statusCode -> ");
      print(response.statusCode);
    }
    if (response.status.hasError) {
      print("error -> ");
      print(response.statusText!);
      Validators.apiResponseMessage(
          body: response.body!, message: response.statusText);
      return null;
    } else {
      print("success -> ");
      return response.body!;
    }
  }
}
