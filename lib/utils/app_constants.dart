import 'package:flutter/services.dart';
import 'package:solo_luxury/main.dart';

enum Environment { DEV, STAGING, PROD }

class AppConstants {
  // Network Constants

  // static String apiEndPoint = "http://192.168.29.135";
  // static String apiEndPoint = "https://solo_luxury.virtual-manager-backend.ml";
  static String imageEndPoint = "https://solo_luxury.s3.amazonaws.com/";
  static const String guestCreateCart = "/rest/V1/guest-carts";
  //static String menuEndPoint = "/V1/categories";

  static String bannerListEndPoint = "/bannerList";

  // static String estimatesShippingMethodEndPoint = "/in-en/V1/carts/mine/estimate-shipping-methods";
  // static String shippingInformationEndPoint = "/in-en/V1/carts/mine/shipping-information";
  static String multiAddressEndPoint = "/rest/V1/customers/me";

  static String recentlyProduct = "recentCheck";
  // static String storeWebsitesEndPoint = "/V1/store/websites";
  // static String storeViewsEndPoint = "/V1/store/storeViews";
  // static String storeConfigsEndPoint = "/V1/store/storeConfigs";
  // static String referFriendEndPoint = "/V1/referFriend";

  // static String menuEndPoint = "/V1/categories";
  // static String estimatesShippingMethodEndPoint =
  //     "/in-en/V1/carts/mine/estimate-shipping-methods";
  // static String shippingInformationEndPoint =
  //     "/in-en/V1/carts/mine/shipping-information";
  // static String storeWebsitesEndPoint = "/V1/store/websites";
  // static String storeViewsEndPoint = "/V1/store/storeViews";
  // static String storeConfigsEndPoint = "/V1/store/storeConfigs";
  // static String jsonEndPoint = "/json";

  static String apiEndPointNew2 = "https://dev3.sololuxury.com/rest";
  static String apiEndPointNew1 = "https://dev2.brands-labels.com/rest";

  static String apiEndPointMyAccount = "/rest/V1/customers/me";
  static String recommendedProductsEndPoint =
      "https://www.sololuxury.com/rest/V1/recommendedList?sku=";

  static String estimatesShippingMethodEndPoint =
      "/V1/carts/mine/estimate-shipping-methods";
  static String shippingInformationEndPoint =
      "/V1/carts/mine/shipping-information";
  static const String addressList = "/rest/V1/customers/me";

  static String productListEndPoint =
      "/V1/products/?searchCriteria[filter_groups][0][filters][0][field]=category_id&searchCriteria[filter_groups][0][filters][0][value]=";

  static String sortedProductListEndPoint =
      "&searchCriteria[sortOrders][0][field]=price&searchCriteria[sortOrders][0][direction]=";

  static String filteredColorProductListEndPoint =
      "&searchCriteria[filter_groups][0][filters][0][field]=color_v2&searchCriteria[filter_groups][0][filters][0][value]=";

  static String filteredCatProductListEndPoint =
      "&searchCriteria[filter_groups][0][filters][0][field]=category_id&searchCriteria[filter_groups][0][filters][0][value]=";

  static String filteredPriceProductListEndPoint =
      "&searchCriteria[filter_groups][0][filters][0][field]=price&searchCriteria[filter_groups][0][filters][0][value]=";

  static String filteredSizeProductListEndPoint =
      "&searchCriteria[filter_groups][0][filters][0][field]=size_v2&searchCriteria[filter_groups][0][filters][0][value]=";

  static String filteredBrandProductListEndPoint =
      "&searchCriteria[filter_groups][0][filters][0][field]=brands&searchCriteria[filter_groups][0][filters][0][value]=";

  static String optionsEndPoint = "/V1/products/attributes/brands/options";

  static String createOrderEndPoint = "/rest/V1/orders/create";
  static String storeWebsitesEndPoint = "/rest/V1/store/websites";
  static String storeViewsEndPoint = "/rest/V1/store/storeViews";
  static String storeConfigsEndPoint = "/rest/V1/store/storeConfigs";
  static String referFriendEndPoint = "/rest//V1/referFriend";

  static String jsonEndPoint = "/json";
  static const String deleteCartProdyctData =
      "/rest/in-en/V1/carts/mine/items/";
  static const String addTocartData = "/rest/in-en/V1/carts/mine/items";
  static const String createCart = "/rest/in-en/V1/carts/mine/";
  static const String cartToken = "Bearer 0vnwaoabm14pwt2azj6yyx29033w7rqk";
  static const String orderConfirmation = "/rest/V1/orders/";
  static const String getChooseInOptionApi =
      "/rest/all/V1/products/attributes/size_v2/options/";

  //static String apiEndPointNew2 = "https://dev3.sololuxury.com/rest";
  //static String apiEndPointNew1 = "https://dev2.brands-labels.com/rest";
  // static String apiEndPointMyAccount = "https://dev2.brands-labels.com/rest/V1/customers/me";

  static String apiEndPointNewInfluencer =
      "https://erp.theluxuryunlimited.com/api/influencer/add";
  static String apiEndPointNew = "https://www.sololuxury.com/rest";
  static String apiEndPointBrand = "https://www.brands-labels.com";

  static String apiEndPoint = "";

  //static String apiEndPointLogin = "https://dev3.sololuxury.com";
  static String apiEndPointLogin = "https://www.sololuxury.com";
  static String adminToken = "Bearer 1zo8slf3nn8a1nlijrvbwse53kmvo962";
  static String productImageUrl =
      "https://www.sololuxury.com/media/catalog/product/";

  //static String apiEndPoint = "https://api.solo_luxury.com";
  //static String apiEndPointLogin = "https://dev3.sololuxury.com";
  static String apiEndPointContactUs =
      "https://dev3.sololuxury.com/rest/V1/contactus";

  static String apiCountryGet = "http://ip-api.com";
  static String apiEndPointFaq = "https://dev3.sololuxury.com";
  static String tokenFaq = "Bearer yn6yadqv0l8uem5rvo4pt6invys7gpo8";
  static String tokenSearch = "Bearer u75tnrg0z2ls8c4yubonwquupncvhqie";

  static const String defaultToken = "Bearer u75tnrg0z2ls8c4yubonwquupncvhqie";
  static const String defaultToken1 = "Bearer 6yd15hrwmolzw4vjl33bdmy3ry0yqge7";
  static const String defaultToken3 = "Bearer 81ob72p4r5npe8q4zh12k9d9jrzuqz4m";

  // static String apiEndPoint =
  //     "http://solo_luxury-env.eba-hfpkwp9f.us-east-1.elasticbeanstalk.com";

  //Sign Up

  //static String login = '/integration/customer/token';

  // static const String defaultToken = "Bearer u75tnrg0z2ls8c4yubonwquupncvhqie";
  // static const String defaultToken1 = "Bearer 7cn032equ94z91iz1ykkeus8ds62twlf";

  //static const String defaultToken = "Bearer u75tnrg0z2ls8c4yubonwquupncvhqie";
  //static const String defaultToken1 = "Bearer 6yd15hrwmolzw4vjl33bdmy3ry0yqge7";

  static String login = '/rest/V1/integration/customer/token';
  static const String signUp = "/rest/V1/customers";
  static String menuEndPoint = "/V1/categories";
  static String menuEndPoint1 = "/rest/V1/categories";
  static const String contactUs = "/rest/V1/contactus";

  static const String wishList = "/rest/V1/wishlist";
  static const String brandList = "/rest/V1/brandList";
  static const String faq = "/rest/V1/cmspagemanagerList/16";
  static const String returnsAndRefund = "/rest/V1/cmspagemanagerList/15";
  static const String cartGetData = "/rest/in-en/V1/carts/mine";

  static const String myOrders =
      "/rest/default/V1/orders?searchCriteria[filter_groups][0][filters][0][field]=customer_email&searchCriteria[filter_groups][0][filters][0][value]=devdyna@gmail.com";
  static const String deleteWishlist = "/rest/V1/wishlist/";
  static const String postWishlist = "/rest/V1/wishlist/";
  static const String guestOrderApi = "/rest/V1/guest-carts/";

  static const String licenceId = '11434003';

  static String forgetPassword = '/V1/customers/password';
  static String forgetPasswordEndPoint = 'https://dev2.brands-labels.com';

  static String addAddress = '/rest/V1/customers/me';
  static String countryList = '/rest/V1/directory/countries';

  static String newsLetterSubscribe = '/rest/V1/newsletter/subscribe';

  static String notifyMe = '/V1/stocknotifyme';

  static getUrlWithCode(url) {
    return "/rest/" + localStore.currentCode + url;
  }

  static getGuestUrlWithCode(url) {
    return "/rest/V1/guest-carts/" + localStore.guestToken + url;
  }

  static dismissKeyboard() {
    return SystemChannels.textInput.invokeMethod('TextInput.hide');
    ;
  }

  static const String shippingInformation = "/shipping-information";
  static const String estimateMethods = "/estimate-shipping-methods";
  static const int websiteId = 1;

  static String myTicketApi = '/rest/V1/mytickets/';

  static const String getSizeListApi = "/rest/V1/sizeList/";
  static const String getProductDetailApi = "/rest/all/V1/products/";

  static String filterDataApi = '/rest/V1/layeredList/';

  static const String fontPoppins = 'Poppins';
  static const String fontOpenSans = 'OpenSans';
  static const String fontMontserrat = 'Montserrat';

  static String privacyPolicyApi = 'cmspagemanagerList/18';
  static String termAndConditionApi = 'cmspagemanagerList/19';
  static String addWishList = '/rest/V1/wishlist/';
  static String returnReasonApi = '/rest/V1/orderReturnList/';
  static String orderTrakingApi = '/rest/V1/orderTrackingList/';
  static String postReturnReasonApi = '/rest/in-en/V1/orderReturn';
  static String storeCreditApi = '/rest/V1/store/credits/balance/';
  // static String returnReasonApi = '/rest/V1/orderReturnList/';
  // static String returnReasonApi = '/rest/V1/orderReturnList/';
}
