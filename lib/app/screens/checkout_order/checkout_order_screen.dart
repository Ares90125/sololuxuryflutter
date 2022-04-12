import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:solo_luxury/app/components/common_widget/common_button.dart';
import 'package:solo_luxury/app/components/common_widget/common_divider.dart';
import 'package:solo_luxury/app/components/common_widget/common_text_field.dart';
import 'package:solo_luxury/app/components/common_widget/common_text_opensans.dart';
import 'package:solo_luxury/app/components/common_widget/common_text_poppins.dart';
import 'package:solo_luxury/app/screens/checkout_order/checkout_order_controller.dart';
import 'package:solo_luxury/app/screens/home/widget/checkout_box.dart';
import 'package:solo_luxury/app/utils/app_asset.dart';
import 'package:solo_luxury/app/utils/colors.dart';
import 'package:solo_luxury/data/model/checkout_order/estimate_shipping_method_model.dart';
import 'package:solo_luxury/data/model/checkout_order/shipping_information_model.dart';
import 'package:solo_luxury/utils/lang_directory/language_constant.dart';

import '../../../data/model/checkout_order/multi_address_model.dart';
import '../../../main.dart';
import '../../components/common_widget/common_appbar.dart';

class CheckoutOrderScreen extends GetView<CheckoutOrderController> {
  dynamic cartlist = Get.arguments;

  CheckoutOrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          key: controller.scaffoldkey,
          backgroundColor: backGroundColor,
          appBar: commonAppbar(),
          body: SizedBox(
            width: Get.width,
            child: Stack(
              children: [
                SingleChildScrollView(
                    padding: const EdgeInsets.only(top: 40.0),
                    child: Form(
                        key: controller.formKey,
                        child: checkOutWidget(context))),
                controller.isLoading.value
                    ? Container(
                        width: Get.width,
                        height: Get.height,
                        color: Colors.transparent,
                        child: const SpinKitThreeBounce(
                          color: appColor,
                          // size: 50.0,
                        ))
                    : Container(),
              ],
            ),
          ),
        ));
  }

  Widget checkOutWidget(context) {
    return Container(
      width: Get.width,
      color: appColorAccent,
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CommonTextPoppins(LanguageConstant.checkOutText.tr,
                  color: Colors.black,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                  decoration: TextDecoration.underline),
              const SizedBox(
                height: 10.0,
              ),
              CommonTextPoppins(
                LanguageConstant.purchaseText.tr,
                textAlign: TextAlign.center,
                color: Colors.black87,
                fontSize: 10.0,
                fontWeight: FontWeight.w500,
              ),
              const SizedBox(
                height: 20.0,
              ),

              //TODO: Login Button
              SizedBox(
                height: 40,
                width: 120.0,
                child: CommonButton(
                  padding: EdgeInsets.zero,
                  buttonType: ButtonType.ElevatedButton,
                  onPressed: () {},
                  elevation: 0.0,
                  color: appColorButton,
                  borderRadius: 0.0,
                  child: CommonTextPoppins(
                    LanguageConstant.signInText.tr,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              // PrimaryTextButton(
              //   height: 40,
              //   width: 120.0,
              //   title: 'Sign In',
              //   buttonColor: appColorButton,
              //   titleTextStyle: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14.0),
              //   onPressed: () {},
              // ),
              const SizedBox(
                height: 20.0,
              ),
              checkoutForm(context),
              const SizedBox(
                height: 30.0,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget checkoutForm(context) {
    return Column(
      children: [
        CheckOutBox(
            title: LanguageConstant.shippingAddressText.tr,
            formFieldWidget: shippingAddress(context)),
        const SizedBox(height: 15.0),
        // CheckOutBox(title: LanguageConstant.shippingAddressText.tr, formFieldWidget: shippingAddress()),
        // const SizedBox(height: 15.0),
        CheckOutBox(
            title: LanguageConstant.shippingMethodText.tr,
            formFieldWidget: shippingMethod()),
        const SizedBox(height: 15.0),
        CheckOutBox(
          title: LanguageConstant.paymentMethod.tr,
          formFieldWidget: paymentMethod(context),
        ),
        const SizedBox(height: 15.0),
        const SizedBox(height: 15.0),
        CheckOutBox(
            title: LanguageConstant.orderSummaryText.tr,
            formFieldWidget: orderSummary(context)),
      ],
    );
  }

  // Widget shippingAddress() {
  //   return SizedBox(
  //     width: Get.width,
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.center,
  //       children: [
  //         const SizedBox(height: 10.0),
  //         CommonTextField(
  //           hintText: LanguageConstant.emailText.tr,
  //           controller: TextEditingController(),
  //         ),
  //         const SizedBox(height: 10.0),
  //         CommonTextField(
  //           hintText: LanguageConstant.passwordText.tr,
  //           controller: TextEditingController(),
  //         ),
  //         const SizedBox(height: 5.0),
  //         CommonTextPoppins(
  //           LanguageConstant.alreadyAcText.tr,
  //           textAlign: TextAlign.center,
  //           fontWeight: FontWeight.w500,
  //           fontSize: 9.0,
  //         ),
  //         const SizedBox(height: 15.0),
  //         SizedBox(
  //           height: 36.0,
  //           width: Get.width,
  //           child: CommonButton(
  //             buttonType: ButtonType.ElevatedButton,
  //             onPressed: () {},
  //             elevation: 0.0,
  //             color: appColorButton,
  //             borderRadius: 0.0,
  //             padding: EdgeInsets.zero,
  //             child: CommonTextPoppins(
  //               LanguageConstant.loginText.tr,
  //               fontSize: 14.0,
  //               fontWeight: FontWeight.w500,
  //             ),
  //           ),
  //         ),
  //         const SizedBox(
  //           height: 15.0,
  //         ),
  //         CommonTextPoppins(
  //           LanguageConstant.forgotText.tr,
  //           textAlign: TextAlign.center,
  //           fontWeight: FontWeight.w500,
  //           fontSize: 10.0,
  //         ),
  //         const SizedBox(
  //           height: 15.0,
  //         ),
  //         CommonDivider(
  //           color: appColorDarkLineGrey,
  //           height: 1.0,
  //           width: Get.width,
  //         ),
  //         const SizedBox(
  //           height: 25.0,
  //         ),
  //         Row(
  //           children: [
  //             Expanded(
  //               child: CommonTextField(
  //                 hintText: LanguageConstant.firstNameText.tr,
  //                 controller: TextEditingController(),
  //               ),
  //             ),
  //             const SizedBox(
  //               width: 10.0,
  //             ),
  //             Expanded(
  //               child: CommonTextField(
  //                 hintText: LanguageConstant.lastNameText.tr,
  //                 controller: TextEditingController(),
  //               ),
  //             ),
  //           ],
  //         ),
  //         const SizedBox(
  //           height: 10.0,
  //         ),
  //         CommonTextField(
  //           hintText: LanguageConstant.companyText.tr,
  //           controller: TextEditingController(),
  //         ),
  //         const SizedBox(
  //           height: 10.0,
  //         ),
  //         Row(
  //           children: [
  //             Expanded(
  //               child: CommonTextField(
  //                 hintText: LanguageConstant.stLineText.tr,
  //                 controller: TextEditingController(),
  //               ),
  //             ),
  //             const SizedBox(
  //               width: 10.0,
  //             ),
  //             Expanded(
  //               child: CommonTextField(
  //                 hintText: LanguageConstant.cityText.tr,
  //                 controller: TextEditingController(),
  //               ),
  //             ),
  //           ],
  //         ),
  //         const SizedBox(
  //           height: 10.0,
  //         ),
  //         Row(
  //           children: [
  //             Expanded(
  //               child: CommonTextField(
  //                 hintText: LanguageConstant.japanText.tr,
  //                 controller: TextEditingController(),
  //               ),
  //             ),
  //             const SizedBox(
  //               width: 10.0,
  //             ),
  //             Expanded(
  //               child: CommonTextField(
  //                 hintText: LanguageConstant.stateText.tr,
  //                 controller: TextEditingController(),
  //               ),
  //             ),
  //           ],
  //         ),
  //         const SizedBox(
  //           height: 10.0,
  //         ),
  //         Row(
  //           children: [
  //             Expanded(
  //               child: CommonTextField(
  //                 hintText: LanguageConstant.zipPostalText.tr,
  //                 controller: TextEditingController(),
  //                 isValidationShow: false,
  //               ),
  //             ),
  //             const SizedBox(
  //               width: 10.0,
  //             ),
  //             Expanded(
  //               child: CommonTextField(
  //                 hintText: LanguageConstant.phoneNumberText.tr,
  //                 controller: TextEditingController(),
  //               ),
  //             ),
  //           ],
  //         ),
  //         const SizedBox(
  //           height: 10.0,
  //         ),
  //       ],
  //     ),
  //   );
  // }
  Widget shippingAddress(context) {
    if (controller.multiAddressModel!.value.addresses == null ||
        controller.multiAddressModel!.value.addresses!.isEmpty) {
      return Column(
        children: [
          const SizedBox(
            height: 20.0,
          ),
          newAddressButton(context),
        ],
      );
    }
    return SizedBox(
      width: Get.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10.0),
          ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: controller.multiAddressModel!.value.addresses!.length,
              itemBuilder: (context, index) {
                Address? address =
                    controller.multiAddressModel!.value.addresses![index];
                return Obx(() => Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CommonTextOpenSans(
                                    "${address.firstname} ${address.lastname} ${address.street!.join(",")} ${address.city} ${address.postcode}",
                                    textAlign: TextAlign.start,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13.0,
                                    maxLine: 5,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(
                                    height: 15.0,
                                  ),
                                  CommonTextOpenSans(
                                    '${address.telephone}',
                                    textAlign: TextAlign.start,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13.0,
                                    maxLine: 5,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 60.0,
                            ),
                            Expanded(
                              child: CommonButton(
                                padding: const EdgeInsets.only(
                                    left: 5.0, right: 5.0),
                                buttonType: ButtonType.OutlinedButton,
                                onPressed: () {
                                  if (controller.selectedAddressIndex.value !=
                                      index) {
                                    controller.shippingAddress = address;
                                    if (!controller.isSameAsBilling.value) {
                                      controller.estimateAndShippingAPICall(
                                        controller.shippingAddress,
                                        controller.billingAddress,
                                      );
                                    } else {
                                      controller.estimateAndShippingAPICall(
                                        controller.shippingAddress,
                                        controller.shippingAddress,
                                      );
                                    }
                                  }
                                  controller.selectedAddressIndex.value = index;
                                },
                                elevation: 0.0,
                                color: controller.selectedAddressIndex.value ==
                                        index
                                    ? appColorButton
                                    : Colors.transparent,
                                border: controller.selectedAddressIndex.value ==
                                        index
                                    ? BorderSide.none
                                    : const BorderSide(
                                        color: appColorButton, width: 1.0),
                                borderRadius: 20.0,
                                child: CommonTextOpenSans(
                                  "Ship Here",
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w500,
                                  color:
                                      controller.selectedAddressIndex.value ==
                                              index
                                          ? appColorAccent
                                          : appColorButton,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        controller.multiAddressModel!.value.addresses!.length -
                                    1 ==
                                index
                            ? Container()
                            : Column(
                                children: [
                                  CommonDivider(
                                    width: Get.width,
                                  ),
                                  const SizedBox(
                                    height: 10.0,
                                  ),
                                ],
                              ),
                      ],
                    ));
              }),
          newAddressButton(context),
          const SizedBox(
            height: 10.0,
          ),
        ],
      ),
    );
  }

  Widget newAddressButton(context) {
    return Align(
      alignment: Alignment.center,
      child: SizedBox(
        height: 40,
        width: 135.0,
        child: CommonButton(
          padding: EdgeInsets.zero,
          buttonType: ButtonType.ElevatedButton,
          onPressed: () {
            controller.showDialogAddress(context);
          },
          elevation: 0.0,
          color: appColorButton,
          borderRadius: 20.0,
          child: CommonTextPoppins(
            LanguageConstant.newAddressText.tr,
            fontSize: 14.0,
            fontWeight: FontWeight.w500,
            color: appColorAccent,
          ),
        ),
      ),
    );
  }

  Widget shippingMethod() {
    if (controller.estimatesList == null) return Container();
    return Column(
      children: [
        const SizedBox(height: 10.0),
        ListView.builder(
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: controller.estimatesList?.length,
            itemBuilder: (context, index) {
              controller.estimateShipModel!.value =
                  EstimateShippingMethodModel.fromJson(
                      controller.estimatesList?[index]);
              return Obx(() => InkWell(
                    onTap: () {
                      controller.selectedShippingIndex.value = index;
                    },
                    child: SizedBox(
                      height: 25.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 18.0,
                            width: 18.0,
                            child: Center(
                              child: Container(
                                height: 14,
                                width: 14,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black,
                                        width: controller.selectedShippingIndex
                                                    .value ==
                                                index
                                            ? 4.5
                                            : 0.8),
                                    shape: BoxShape.circle),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 20.0,
                          ),
                          Expanded(
                            flex: 2,
                            child: CommonTextPoppins(
                              "${localStore.setItemPriceWithSymbol(controller.estimateShipModel!.value.amount.toString(), controller.estimateShipModel!.value.baseAmount.toString())}",
                              fontSize: 10.0,
                              textAlign: TextAlign.left,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: CommonTextPoppins(
                              controller.estimateShipModel!.value.methodTitle,
                              fontSize: 10.0,
                              textAlign: TextAlign.left,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: CommonTextPoppins(
                              controller.estimateShipModel!.value.carrierTitle,
                              textAlign: TextAlign.left,
                              fontSize: 10.0,
                              fontWeight: FontWeight.w500,
                              maxLine: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ));
            }),
      ],
    );
  }

  Widget paymentMethod(context) {
    if (controller.shipInfoModel!.value.paymentMethods == null) {
      return Container();
    }
    return Column(
      children: [
        const SizedBox(height: 10.0),
        ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: controller.shipInfoModel!.value.paymentMethods!.length,
            itemBuilder: (context, index) {
              PaymentMethods paymentMethods =
                  controller.shipInfoModel!.value.paymentMethods![index];
              return InkWell(
                onTap: () {
                  controller.selectedPaymentIndex.value = index;
                  print(
                      "Payment Method Is ${controller.selectedPaymentIndex.value}");
                },
                child: Obx(() => Column(
                      children: [
                        Row(
                          children: [
                            Container(
                                height: 14,
                                width: 14,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black,
                                        width: controller.selectedPaymentIndex
                                                    .value ==
                                                index
                                            ? 4.5
                                            : 0.8),
                                    shape: BoxShape.circle)),
                            const SizedBox(
                              width: 20.0,
                            ),
                            CommonTextPoppins(
                              paymentMethods.title,
                              fontSize: 12.0,
                              fontWeight: FontWeight.w500,
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            const SizedBox(
                              height: 10.0,
                            ),
                            index ==
                                    controller.shipInfoModel!.value
                                            .paymentMethods!.length -
                                        1
                                ? Container()
                                : Column(
                                    children: [
                                      CommonDivider(
                                        color: appColorDarkLineGrey,
                                        height: 1.0,
                                        width: Get.width,
                                      ),
                                      const SizedBox(
                                        height: 10.0,
                                      ),
                                    ],
                                  ),
                          ],
                        )
                      ],
                    )),
              );
            }),
        CommonDivider(
          color: appColorDarkLineGrey,
          height: 1.0,
          width: Get.width,
        ),
        const SizedBox(
          height: 15.0,
        ),
        controller.multiAddressModel!.value.addresses!.length > 1
            ? InkWell(
                onTap: () {
                  controller.isSameAsBilling.value =
                      !controller.isSameAsBilling.value;
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Obx(() => Container(
                              height: 24.0,
                              width: 24.0,
                              alignment: Alignment.centerLeft,
                              child: Icon(
                                controller.isSameAsBilling.value
                                    ? Icons.check_box_sharp
                                    : Icons.check_box_outline_blank_sharp,
                                color: Colors.black54,
                                size: 24.0,
                              ),
                            )),
                        const SizedBox(
                          width: 15.0,
                        ),
                        Expanded(
                          child: CommonTextOpenSans(
                            LanguageConstant.myBillingShipAddressSameText.tr,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    !controller.isSameAsBilling.value
                        ? Column(
                            children: [
                              const SizedBox(height: 20.0),
                              ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: controller.multiAddressModel!.value
                                      .addresses!.length,
                                  itemBuilder: (context, index) {
                                    Address? address = controller
                                        .multiAddressModel!
                                        .value
                                        .addresses![index];
                                    return Obx(() => Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                if (controller
                                                        .selectedBillingIndex
                                                        .value !=
                                                    index) {
                                                  controller.billingAddress =
                                                      address;
                                                  if (!controller
                                                      .isSameAsBilling.value) {
                                                    controller
                                                        .estimateAndShippingAPICall(
                                                      controller
                                                          .shippingAddress,
                                                      controller.billingAddress,
                                                    );
                                                  } else {
                                                    controller
                                                        .estimateAndShippingAPICall(
                                                      controller
                                                          .shippingAddress,
                                                      controller
                                                          .shippingAddress,
                                                    );
                                                  }
                                                }
                                                controller.selectedBillingIndex
                                                    .value = index;
                                              },
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Obx(
                                                    () => Container(
                                                        height: 14,
                                                        width: 14,
                                                        decoration: BoxDecoration(
                                                            border: Border.all(
                                                                color: Colors
                                                                    .black,
                                                                width: controller
                                                                            .selectedBillingIndex
                                                                            .value ==
                                                                        index
                                                                    ? 4.5
                                                                    : 0.8),
                                                            shape: BoxShape
                                                                .circle)),
                                                  ),
                                                  const SizedBox(
                                                    width: 15.0,
                                                  ),
                                                  Expanded(
                                                    child: CommonTextOpenSans(
                                                      "${address.firstname} ${address.lastname} ${address.street!.join(",")} ${address.city} ${address.postcode}'${address.telephone}",
                                                      textAlign:
                                                          TextAlign.start,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 13.0,
                                                      maxLine: 5,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 15.0,
                                            ),
                                            controller.multiAddressModel!.value
                                                            .addresses!.length -
                                                        1 ==
                                                    index
                                                ? Container()
                                                : Column(
                                                    children: [
                                                      CommonDivider(
                                                        width: Get.width,
                                                      ),
                                                      const SizedBox(
                                                        height: 10.0,
                                                      ),
                                                    ],
                                                  ),
                                          ],
                                        ));
                                  }),
                              const SizedBox(height: 15.0),
                              SizedBox(
                                height: 40,
                                width: 135.0,
                                child: CommonButton(
                                  padding: EdgeInsets.zero,
                                  buttonType: ButtonType.ElevatedButton,
                                  onPressed: () {
                                    controller.showDialogAddress(context);
                                  },
                                  elevation: 0.0,
                                  color: appColorButton,
                                  borderRadius: 20.0,
                                  child: CommonTextPoppins(
                                    LanguageConstant.newAddressText.tr,
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w500,
                                    color: appColorAccent,
                                  ),
                                ),
                              ),
                            ],
                          )
                        : Container(),
                  ],
                ),
              )
            : Container(),
      ],
    );
  }

  Widget orderSummary(context) {
    if (controller.shipInfoModel!.value.totals == null) {
      return Container();
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Obx(() => Column(
              children: [
                InkWell(
                  onTap: () {
                    controller.isShowItems.value =
                        !controller.isShowItems.value;
                  },
                  child: SizedBox(
                    height: 30.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CommonTextPoppins(
                          "${controller.shipInfoModel!.value.totals!.itemsQty} ${LanguageConstant.itemInCartText.tr}",
                          fontSize: 10.0,
                          fontWeight: FontWeight.w500,
                          textAlign: TextAlign.left,
                        ),
                        Image.asset(
                          AppAsset.upArrow,
                          width: 18.0,
                          height: 18.0,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                  ),
                ),
                CommonDivider(
                  color: appColorDarkLineGrey,
                  height: 1.0,
                  width: Get.width,
                ),
                const SizedBox(
                  height: 3.0,
                ),
                !controller.isShowItems.value
                    ? Container()
                    : ListView.builder(
                        padding: EdgeInsets.zero,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: controller
                            .shipInfoModel!.value.totals!.items!.length,
                        itemBuilder: (context, index) {
                          Items shipItem = controller
                              .shipInfoModel!.value.totals!.items![index];
                          return Obx(() => Column(
                                children: [
                                  const SizedBox(
                                    height: 10.0,
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Image.asset(AppAsset.frame,
                                          height: 85.0, width: 85.0),
                                      const SizedBox(
                                        width: 10.0,
                                      ),
                                      Expanded(
                                        child: SizedBox(
                                          height: 85.0,
                                          width: Get.width,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              CommonTextPoppins(
                                                shipItem.name,
                                                fontSize: 12.0,
                                                fontWeight: FontWeight.w500,
                                                textAlign: TextAlign.left,
                                                maxLine: 3,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  CommonTextPoppins(
                                                    "${LanguageConstant.qtyText.tr}: ${shipItem.qty}",
                                                    fontSize: 12.0,
                                                    fontWeight: FontWeight.w500,
                                                    textAlign: TextAlign.left,
                                                  ),
                                                  CommonTextPoppins(
                                                    "${localStore.setItemPriceWithSymbol(shipItem.rowTotalInclTax.toString(), shipItem.baseRowTotalInclTax.toString())}",
                                                    fontSize: 12.0,
                                                    fontWeight: FontWeight.w500,
                                                    textAlign: TextAlign.left,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 15.0,
                                  ),
                                  shipItem.options != null &&
                                          shipItem.options == "[]"
                                      ? Container()
                                      : InkWell(
                                          onTap: () {
                                            shipItem.isOptionsOpen.value =
                                                !shipItem.isOptionsOpen.value;
                                            print(
                                                "shipItem.isOptionsOpen -> ${shipItem.isOptionsOpen}");
                                          },
                                          child: Row(
                                            children: [
                                              SizedBox(
                                                  width: Get.width * 0.269),
                                              CommonTextPoppins(
                                                LanguageConstant
                                                    .viewDetailsText.tr,
                                                fontSize: 12.0,
                                                fontWeight: FontWeight.w500,
                                                textAlign: TextAlign.left,
                                              ),
                                              const SizedBox(
                                                width: 10.0,
                                              ),
                                              Image.asset(
                                                AppAsset.downArrow,
                                                width: 18.0,
                                                height: 18.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ],
                                          ),
                                        ),
                                  shipItem.isOptionsOpen.value
                                      ? Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            CommonTextPoppins(
                                              shipItem.getOptionsLabel(),
                                              fontSize: 12.0,
                                              fontWeight: FontWeight.w600,
                                              textAlign: TextAlign.left,
                                            ),
                                            const SizedBox(
                                              width: 15.0,
                                            ),
                                            CommonTextPoppins(
                                              shipItem.getOptionsValue(),
                                              fontSize: 12.0,
                                              fontWeight: FontWeight.w400,
                                              textAlign: TextAlign.left,
                                            ),
                                          ],
                                        )
                                      : Container(),
                                ],
                              ));
                        }),
                const SizedBox(
                  height: 15.0,
                ),
              ],
            )),
        const SizedBox(
          height: 30.0,
        ),
        CommonDivider(
          color: appColorDarkLineGrey,
          height: 1.0,
          width: Get.width,
        ),
        const SizedBox(
          height: 20.0,
        ),
        CommonTextPoppins(
          LanguageConstant.applyDisCodeText.tr,
          fontSize: 10.0,
          fontWeight: FontWeight.w500,
          textAlign: TextAlign.left,
        ),
        const SizedBox(
          height: 10.0,
        ),
        SizedBox(
          height: 40.0,
          child: Row(
            children: [
              Expanded(
                flex: 4,
                child: CommonTextField(
                  hintText: LanguageConstant.enterDisCodeText.tr,
                  controller: TextEditingController(),
                  isValidationShow: false,
                ),
              ),
              const SizedBox(
                width: 10.0,
              ),
              SizedBox(
                height: 40.0,
                child: CommonButton(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  buttonType: ButtonType.ElevatedButton,
                  onPressed: () {},
                  elevation: 0.0,
                  color: appColorButton,
                  borderRadius: 0.0,
                  child: CommonTextPoppins(
                    LanguageConstant.applyDiscountText.tr,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 25.0,
        ),
        const SizedBox(
          height: 10.0,
        ),
        ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            itemCount:
                controller.shipInfoModel!.value.totals!.totalSegments!.length,
            itemBuilder: (context, index) {
              TotalSegments totalSegmentsItem =
                  controller.shipInfoModel!.value.totals!.totalSegments![index];
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: CommonTextPoppins(
                          "${totalSegmentsItem.title}",
                          fontSize: 11.0,
                          maxLine: 2,
                          fontWeight: FontWeight.w500,
                          textAlign: TextAlign.left,
                        ),
                      ),
                      CommonTextPoppins(
                        "${localStore.getPriceWithSymbol(totalSegmentsItem.value.toString())}",
                        fontSize: 10.0,
                        fontWeight: FontWeight.w500,
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                ],
              );
            }),
        const SizedBox(
          height: 10.0,
        ),
        CommonDivider(
          color: appColorDarkLineGrey,
          height: 1.0,
          width: Get.width,
        ),
        const SizedBox(
          height: 20.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CommonTextPoppins(
              LanguageConstant.orderTotalText.tr,
              fontSize: 14.0,
              fontWeight: FontWeight.w600,
              textAlign: TextAlign.left,
            ),
            CommonTextPoppins(
              "${localStore.setItemPriceWithSymbol(controller.shipInfoModel!.value.totals!.grandTotal.toString(), controller.shipInfoModel!.value.totals!.baseGrandTotal.toString())}",
              fontSize: 14.0,
              fontWeight: FontWeight.w500,
              textAlign: TextAlign.left,
            ),
          ],
        ),
        const SizedBox(
          height: 15.0,
        ),
        controller.multiAddressModel!.value.addresses == null ||
                controller.multiAddressModel!.value.addresses!.isNotEmpty
            ? Align(
                alignment: Alignment.center,
                child: SizedBox(
                  height: 40.0,
                  child: CommonButton(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    buttonType: ButtonType.ElevatedButton,
                    onPressed: () {
                      // if (controller.formKey.currentState!.validate()) {
                      //   // If the form is valid, display a snackbar. In the real world,
                      //   // you'd often call a server or save the information in a database.
                      //   ScaffoldMessenger.of(Get.context!).showSnackBar(
                      //     const SnackBar(content: Text('Processing Data')),
                      //   );
                      // }

                      if (controller.formKey.currentState!.validate()) {
                        if (controller.selectedPaymentIndex.value == 1) {
                          controller.postListForOrder(
                              cartlist, "CaseOnDelivery", "", context);
                        } else if (controller.selectedPaymentIndex.value == 3) {
                          Map<String, dynamic> lineItems = {};
                          Map<String, dynamic> paymentRequest = {};
                          for (var element in controller
                              .shipInfoModel!.value.totals!.items!) {
                            lineItems = {
                              "amountExcludingTax": 0,
                              "amountIncludingTax": element.basePriceInclTax,
                              "description": element.name,
                              "id": element.itemId,
                              "quantity": element.qty,
                              "taxCategory": "",
                              "taxPercentage": element.taxPercent
                            };
                          }
                          print("ListItem -> $lineItems");
                          paymentRequest = {
                            "currency": localStore.currentCurrency,
                            "amount":
                                "${controller.shipInfoModel!.value.totals!.grandTotal}",
                            "countryCode": localStore.currentCode
                                .split("-")[0]
                                .toUpperCase(),
                            "qty": controller
                                .shipInfoModel!.value.totals!.itemsQty,
                            "lineItems": [lineItems],
                          };
                          print("Payment -> $paymentRequest");
                          controller.responseFromNativeCode(
                              cartlist, context, paymentRequest);
                        }
                        // ScaffoldMessenger.of(Get.context!).showSnackBar(
                        //   const SnackBar(content: Text('Processing Data')),
                        // );
                      }
                    },
                    elevation: 0.0,
                    color: appColorButton,
                    borderRadius: 0.0,
                    child: CommonTextPoppins(
                      LanguageConstant.placeOrderText.tr,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            : Container()
      ],
    );
  }
}
