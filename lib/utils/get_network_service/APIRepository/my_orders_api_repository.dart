import 'dart:convert';

import 'package:solo_luxury/data/model/MyOrders/MyOrdersData.dart';
import 'package:solo_luxury/utils/get_network_service/repository_adapter.dart';

import '../../app_constants.dart';
import '../../validator.dart';
import '../APIProviders/my_orders_api_provider.dart';

class MyOrdersAPIRepository implements IMyOrdersRepository {
  final MyOrdersListAPIProvider myOrderAPIProvider;

  MyOrdersAPIRepository({required this.myOrderAPIProvider});

  @override
  Future<MyOrdersData> getMyOrdersApiResponse() async {
    final response = await myOrderAPIProvider.getMyOrdersListResponseProvider(
        endPoint: AppConstants.myOrders);
    if (response != null) {
      print("response.statusCode getMyOrdersApiResponse-> ");
      print(response.statusCode);
      print(response.body!.toJson());
    }
    if (response.status.hasError) {
      print("error -> ");
      print(response.statusText!);
      Validators.apiResponseMessage(
          body: response.body!, message: response.statusText);
      return null!;
    } else {
      print("success -> ");
      return response.body!;
    }
  }
}
