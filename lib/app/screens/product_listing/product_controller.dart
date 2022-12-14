import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solo_luxury/app/components/common_widget/common_text_poppins.dart';
import 'package:solo_luxury/app/db/shared_pref.dart';
import 'package:solo_luxury/utils/get_network_service/APIRepository/product_list_api_repository.dart';
import 'package:solo_luxury/utils/get_network_service/APIRepository/recommended_products_api_repository.dart';

import '../../../data/model/Product/product_model.dart';
import '../../../data/model/filter/filter_model.dart';
import '../../../utils/app_constants.dart';
import '../../utils/global_singlton.dart';
import '../product_detail/product_detail_binding.dart';

class ProductController extends GetxController {
  var likedProducts = <ProductModel>[].obs;
  var selectedIndex = 0.obs;
  var activeProduct = ProductModel().obs;
  var isLoading = true.obs;
  RxString productId = "".obs;
  RxInt selectedSortIndex = 0.obs;
  Rx<SortValue> selectedSortVal = SortValue("Relevance", "DESC").obs;
  RxList sortTypeList = <SortValue>[
    SortValue("Relevance", "DESC"),
    SortValue("New Arrivals", "DESC"),
    SortValue("Price(highest first)", "DESC"),
    SortValue("Price(lowest first)", "ASC"),
    SortValue("Discount(highest first)", "DESC"),
    SortValue("Discount(lowest first)", "ASC"),
  ].obs;
  Rx<Color> backgroundColorValue = const Color(0xffF7E8E1).obs;
  Rx<FilterModel> selectedCategory = FilterModel().obs;
  var homeCategoryProductList = <ProductModel>[].obs;
  Rx<GlobalKey<ScaffoldState>> scaffoldKey = GlobalKey<ScaffoldState>().obs;
  Rx<ProductModel>? productModel = ProductModel().obs;
  List<Item> itemList = [];
  RxString title = "".obs;
  final ProductListAPIRepository productListAPIRepository;

  ProductController({required this.productListAPIRepository});

  // var isLoading = true.obs;

  // RxInt checked = 0.obs;
  RxInt currentCategoryIndex = 0.obs;
  RxList filterList = [].obs;

  RxMap<String, List> selectedMap = <String, List>{}.obs;

  Rx<FilterModel>? filterModel = FilterModel().obs;
  RxList<FilterModel>? filterModelList = <FilterModel>[].obs;
  RxList<FilterModel>? saveFilterModelList = <FilterModel>[].obs;
  RxList<Category>? subCategoryList = <Category>[].obs;
  RxList<Category>? saveSubCategoryList = <Category>[].obs;
  Rx<TextEditingController> searchEditingController =
      TextEditingController().obs;

  @override
  void onInit() {

    getHomeProducts(Get.arguments[0].toString());
    print("Id -> ${Get.arguments[0]}");
    print("Name -> ${Get.arguments[1]}");
    title.value = Get.arguments[1];
    productId.value = Get.arguments[0].toString();
    ProductDetailsBindings().dependencies();
    getFilterData();
    super.onInit();
  }

  getHomeProducts(String val) async {
    isLoading.value = true;
    await getOptionsFromAPI();
    productModel?.value =
        await productListAPIRepository.getProductListApiResponse(val);
    print("getHomeProducts -> ${productModel!.value.items!.length}");
    if (productModel?.value != null) {
      itemList = [];
      for (var element in productModel!.value.items!) {
        itemList.add(element);
      }
    }
    isLoading.value = false;
  }

  // Future setRecentlyItem (Item? item) async {
  //   String value = jsonEncode([item]);
  //  await setPrefRecentlyValue(AppConstants.recentlyProduct , value);
  // }

  getSortedProducts() async {
    isLoading.value = true;
    await getOptionsFromAPI();
    productModel?.value = await productListAPIRepository
        .getSortedProductListApiResponse("$productId" +
            AppConstants.sortedProductListEndPoint +
            selectedSortVal.value.value!);
    isLoading.value = false;
  }

  getFilteredProducts() async {
    isLoading.value = true;
    String url = "";
    selectedMap.value.forEach((key, value) {
      if (key == "cat") {
        if (value.isNotEmpty) {
          url = url +
              AppConstants.filteredCatProductListEndPoint +
              value
                  .toString()
                  .replaceAll("[", "")
                  .replaceAll("]", "")
                  .removeAllWhitespace;
        }
      } else if (key == "price") {
        if (value.isNotEmpty) {
          url = url +
              AppConstants.filteredPriceProductListEndPoint +
              value
                  .toString()
                  .replaceAll("[", "")
                  .replaceAll("]", "")
                  .removeAllWhitespace;
        }
      } else if (key == "size_v2") {
        if (value.isNotEmpty) {
          url = url +
              AppConstants.filteredSizeProductListEndPoint +
              value
                  .toString()
                  .replaceAll("[", "")
                  .replaceAll("]", "")
                  .removeAllWhitespace;
        }
      } else if (key == "color_v2") {
        if (value.isNotEmpty) {
          url = url +
              AppConstants.filteredColorProductListEndPoint +
              value
                  .toString()
                  .replaceAll("[", "")
                  .replaceAll("]", "")
                  .removeAllWhitespace;
        }
      } else if (key == "brands") {
        if (value.isNotEmpty) {
          url = url +
              AppConstants.filteredBrandProductListEndPoint +
              value
                  .toString()
                  .replaceAll("[", "")
                  .replaceAll("]", "")
                  .removeAllWhitespace;
        }
      }
    });
    print(url);
    await getOptionsFromAPI();
    productModel?.value = await productListAPIRepository
        .getFilteredProductListApiResponse("$productId" + url);

    isLoading.value = false;
  }

  getOptionsFromAPI() async {
    if (GlobalSingleton().optionList.isEmpty) {
      GlobalSingleton().optionList =
          await productListAPIRepository.getOptionsListApiResponse();
    }
    print("OptionList -> ${GlobalSingleton().optionList.length}");
  }

  getFilterData() async {
    filterList.value = await productListAPIRepository
        .getFilterListApiResponse(Get.arguments[0].toString());
    print("filterList.value -> ${filterList.length}");
    print("filterList.value -> ${filterList}");
    if (filterList.isNotEmpty) {
      for (int i = 0; i < filterList.length; i++) {
        filterModelList!.add(FilterModel.fromJson(filterList[i]));
      }
      saveFilterModelList = filterModelList!;
      filterModel!.value = filterModelList!.first;
      print("model -> ${filterModel?.value.toJson()}");
      subCategoryList?.value = filterModel!.value.category!;
      saveSubCategoryList?.value = filterModel!.value.category!;
      selectedCategory.value = filterModel!.value;
    }
  }

  deleteWishListData(context, dataName, customImage, sku, getId, index) async {
    var deleteToWishData;
    deleteToWishData =
        await RecommendedProductsAPIRepository().deleteWishList(getId);

    print("Delete ID  To Cart Data ${deleteToWishData}");
    if (deleteToWishData) {
      productModel!.value.items![index].isWishList.value = false;
      // return showWishlistDialog(context, dataName, customImage);
    }
  }

  postAddToWishlistData(context, dataName, customImage, sku, index) async {
    var addToWishData;
    print("Here Customer Post");
    addToWishData = await RecommendedProductsAPIRepository()
        .addTOWishListProductResponse(sku);

    print("Add To Cart Data ${addToWishData}");
    if (addToWishData) {
      productModel!.value.items![index].isWishList.value = true;
      // return showWishlistDialog(context, dataName, customImage);
    }
  }

  changedData(int index) {
    currentCategoryIndex.value = index;
    searchEditingController.value.text = "";
    for (int i = 0; i < filterModelList!.length; i++) {
      if (i == currentCategoryIndex.value) {
        filterModel!.value = filterModelList![i];
        print("model->${filterModel!.value.toJson()}");
        subCategoryList!.value = filterModel!.value.category!;
        saveSubCategoryList!.value = filterModel!.value.category!;
      }
    }
  }

  searchFilter(String itemTitle) {
    List<Category> results = [];
    if (itemTitle.isNotEmpty) {
      subCategoryList!.value = saveSubCategoryList!;
      results = subCategoryList!
          .where((element) => element.display!
              .toLowerCase()
              .toString()
              .contains(itemTitle.toLowerCase()))
          .toList();
      subCategoryList!.value = results;
      print(
          "Results: ${results.length.toString()} ${subCategoryList!.length.toString()}");
    } else {
      for (int i = 0; i < filterModelList!.length; i++) {
        if (i == currentCategoryIndex.value) {
          filterModel!.value = filterModelList![i];
          subCategoryList!.value = filterModel!.value.category!;
        }
      }
    }
  }
}

class SortValue {
  final String? name;
  final String? value;

  SortValue(this.name, this.value);
}
