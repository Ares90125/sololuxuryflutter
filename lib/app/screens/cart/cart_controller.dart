import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solo_luxury/app/components/common_widget/common_text_poppins.dart';
import 'package:solo_luxury/app/components/storage_constant.dart';
import 'package:solo_luxury/app/db/shared_pref.dart';
import 'package:solo_luxury/data/model/cart/cart_model.dart';
import 'package:solo_luxury/main.dart';
import 'package:solo_luxury/utils/app_constants.dart';
import 'package:solo_luxury/utils/get_network_service/APIRepository/cart_get_data_repository.dart';
import 'package:solo_luxury/utils/get_network_service/APIRepository/recommended_products_api_repository.dart';

import '../../../data/model/Product/product_model.dart';

class CartController extends GetxController {
  var cartProducts = <ProductModel>[].obs;
  RxObjectMixin? cartModel = CartModel().obs;
  final CartGetDataAPIRepository cartGetDataAPIRepository;
  List cartItemNumber = [].obs;
  var cartItemPrice = 0.obs;

  CartController({required this.cartGetDataAPIRepository});

  var isLoading = true.obs;
  var getCartId = 0.obs;
  var getCartToken = "".obs;
  var subtotal = 0.obs;

  @override
  void onInit() {
    getGenerateCart();
    super.onInit();
    print("CONTROLLER=========");
  }

  Future<void> getGenerateCart() async {
    print("User Token Is ${localStore.customerToken}");
    if (localStore.customerToken.toString() != "") {
      print("Customer");
      getCartId.value = await RecommendedProductsAPIRepository()
          .getGenerateCartApiResponse(
              localStore.customerToken, AppConstants.createCart);
      print("Generate ${getCartId.value}");
      getCartToken.value = getCartId.value.toString();

      // cartItemNumber.value =

      if (getCartToken.value != null) {
        getFaqContent(1);
      } else {}
    } else {
      if (localStore.guestToken.toString() != "") {
        getFaqContent(2);
      } else {
        print("Guest");
        getCartToken.value = await RecommendedProductsAPIRepository()
            .getGenerateCartApiResponse(
                localStore.customerToken, AppConstants.guestCreateCart);
        await setPrefStringValue(
            StorageConstant.guestauthToken, getCartToken.value.toString());
        await localStore.getGuestToken();
        print("Generate ${getCartId.value}");
        if (getCartToken.value != null) {
          getFaqContent(2);
        } else {}
      }
    }
    print("Create Cart ID Is ${getCartId.value}");
  }

  void getFaqContent(getValue) async {
    isLoading.value = true;
    var cartData;
    if (getValue == 1) {
      cartData = await cartGetDataAPIRepository
          .getCartGetDataApiResponse(AppConstants.cartGetData);
    } else {
      cartData = await cartGetDataAPIRepository.getCartGetDataApiResponse(
          AppConstants.guestCreateCart +
              "/${localStore.guestToken.toString()}");
      ;
    }
    cartModel?.value = CartModel.fromJson(json.decode(cartData));
    // cartItemNumber.addAll(ca)
    print("CartModel Is $cartModel");
    cartModel!.value.items.forEach((i) {
      var total = i.price * i.qty;
      subtotal.value += int.parse(subtotal.value.toString()) +
          num.parse(total.toString()).round();
    });

    // cartItemPrice.value = cartModel!.value.items[0].price;
    // cartItemNumber.value = cartModel!.value.items[0].qty;
    // print( "\$${cartModel!.value.items[0].qty}");
    isLoading.value = false;
  }

  void deleteCartProductContent(deleteProductId, getValue) async {
    var deleteProduct;
    if (getValue == 1) {
      deleteProduct =
          await cartGetDataAPIRepository.deleteCartCartQTYDataApiResponse(
              deleteProductId, AppConstants.deleteCartProdyctData);
    } else {
      deleteProduct =
          await cartGetDataAPIRepository.deleteCartCartQTYDataApiResponse(
              deleteProductId,
              AppConstants.guestCreateCart +
                  "/${localStore.guestToken.toString()}/items/");
      ;
    }
    // var deleteProduct = await cartGetDataAPIRepository
    //     .deleteCartCartQTYDataApiResponse(deleteProductId);
    print("DeleteProduct IS  Is $deleteProduct");
    // cartItemNumber.value = 0;
    cartItemPrice.value = 0;
    getFaqContent2(getValue);
  }

  void getFaqContent2(getValue) async {
    // isLoading.value = true;
    var cartData;
    if (getValue == 1) {
      cartData = await cartGetDataAPIRepository
          .getCartGetDataApiResponse(AppConstants.cartGetData);
    } else {
      cartData = await cartGetDataAPIRepository.getCartGetDataApiResponse(
          AppConstants.guestCreateCart +
              "/${localStore.guestToken.toString()}");
      ;
    }
    cartModel?.value = CartModel.fromJson(json.decode(cartData));
    // cartItemNumber.addAll(ca)
    print("CartModel Is $cartModel");
    cartModel!.value.items.forEach((i) {
      var total = i.price * i.qty;
      subtotal.value += int.parse(subtotal.value.toString()) +
          num.parse(total.toString()).round();
    });

    // cartItemPrice.value = cartModel!.value.items[0].price;
    // cartItemNumber.value = cartModel!.value.items[0].qty;
    // print( "\$${cartModel!.value.items[0].qty}");
    // isLoading.value = false;
  }

  //Add TO Cart Api Calling
  postAddToCartData(context, dataName, sku) async {
    var passedAddTocart = {
      "cartItem": {
        "sku": "$sku",
        "qty": 1,
        "quote_id": "${localStore.guestToken.toString()}"
      }
    };

    var addTocartData;
    if (localStore.customerToken.toString() != "") {
      print("Customer Here Post");
      addTocartData = await RecommendedProductsAPIRepository()
          .postAddTOCartProductResponse(passedAddTocart);
      getFaqContent2(1);
    } else {
      print("Guest Here Post");
      addTocartData = await RecommendedProductsAPIRepository()
          .guestPostAddTOCartProductResponse(
              passedAddTocart, "${localStore.guestToken.toString()}");
      getFaqContent2(0);
    }
    print("Add To Cart Data ${addTocartData}");
    if (addTocartData['message'] != null) {
      ScaffoldMessenger.of(Get.context!).showSnackBar(
        SnackBar(content: CommonTextPoppins(addTocartData['message'])),
      );
    } else {
      // cartItemNumber.value = addTocartData["qty"];
      cartItemPrice.value = addTocartData["price"] * addTocartData["qty"];
      return print("${addTocartData["qty"]}");
    }
  }

  postRemoveFromCartData(context, dataName, sku, qty) async {
    var passedAddTocart = {
      "cartItem": {
        "sku": "$sku",
        "qty": "${int.parse(qty) - 1}",
        "quote_id": "${localStore.guestToken.toString()}"
      }
    };
    var addTocartData;
    if (localStore.customerToken.toString() != "") {
      print("Customer Here Post");
      addTocartData = await RecommendedProductsAPIRepository()
          .postAddTOCartProductResponse(passedAddTocart);
      getFaqContent2(1);
    } else {
      print("Guest Here Post");
      addTocartData = await RecommendedProductsAPIRepository()
          .guestPostAddTOCartProductResponse(
              passedAddTocart, "${localStore.guestToken.toString()}");
      getFaqContent2(0);
    }
    // var addTocartData = await RecommendedProductsAPIRepository()
    //     .postAddTOCartProductResponse(passedAddTocart);
    print("Add To Cart Data ${addTocartData}");
    if (addTocartData['message'] != null) {
      ScaffoldMessenger.of(Get.context!).showSnackBar(
        SnackBar(content: CommonTextPoppins(addTocartData['message'])),
      );
    } else {
      // cartItemNumber.value = addTocartData["qty"];
      cartItemPrice.value = addTocartData["price"] * addTocartData["qty"];
      return print("${addTocartData["qty"]}");
    }
  }
// int getProductCountById(int id) {
//   int index = cartProducts.indexWhere((element) => element.id == id);
//   if (index > -1) {
//     if (cartProducts[index].count! == 0) {
//       cartProducts.removeAt(index);
//       cartProducts.refresh();
//       return 0;
//     }
//     return cartProducts[index].count!;
//   }
//   return 0;
// }
//
// double calculateAmount() {
//   double sum = 0;
//
//   for (ProductModel product in cartProducts) {
//     sum += product.count! * (product.price!);
//   }
//
//   return sum;
// }

}
