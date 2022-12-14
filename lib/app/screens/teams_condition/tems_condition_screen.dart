import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:solo_luxury/app/screens/teams_condition/tems_condition_controller.dart';
import 'package:solo_luxury/app/utils/app_asset.dart';
import 'package:solo_luxury/app/utils/colors.dart';
import 'package:solo_luxury/utils/image_constant.dart';
import 'package:solo_luxury/utils/lang_directory/language_constant.dart';

import '../../components/common_widget/common_appbar.dart';

class TermAndConditionScreen extends GetView<TermAndConditionController> {
  const TermAndConditionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: backGroundColor,
        key: controller.scaffoldKey.value,
        appBar: commonAppbar(),
        body: controller.isLoading.value
            ? const Center(
                child: SpinKitThreeBounce(
                color: appColor,
                // size: 50.0,
              ))
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.5),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    Text(
                      LanguageConstant.termAndConditionHeadingText.tr,
                      style: const TextStyle(
                        fontStyle: FontStyle.normal,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        decoration: TextDecoration.underline,
                        color: appColor,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Expanded(
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        itemCount:
                            controller.getprivacyPolicy[0].cmsText!.length,
                        itemBuilder: (BuildContext context, int index) {
                          final getList =
                              controller.getprivacyPolicy[0].cmsText![index];
                          return expandDetailWidget(
                              getList.title!, getList.description!, index + 1);
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
      ),
    );
  }

  Widget expandDetailWidget(String text, String subText, int value) {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: () {
            if (controller.index.value == value) {
              controller.index.value = 0;
            } else {
              controller.index.value = value;
            }
          },
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: appColor),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: controller.index.value != value
                        ? Border.all(color: Colors.transparent)
                        : const Border(
                            bottom: BorderSide(width: 1.0, color: appColor),
                          ),
                  ),
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          text,
                          style: const TextStyle(
                            color: appColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      controller.index.value == value
                          ? const Icon(
                              Icons.remove,
                              color: appColor,
                            )
                          : const Icon(
                              Icons.add,
                              color: appColor,
                            ),
                    ],
                  ),
                ),
                Visibility(
                  visible: controller.index.value == value ? true : false,
                  child: Html(
                    data: subText,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  //       controller.isLoading.value
  //           ? const Center(
  //               child: SpinKitThreeBounce(
  //               color: appColor,
  //               // size: 50.0,
  //             ))
  //           : Padding(
  //               padding: const EdgeInsets.symmetric(horizontal: 12.5),
  //               child: Column(
  //                 children: [
  //                   const SizedBox(
  //                     height: 40,
  //                   ),
  //                   Text(
  //                     LanguageConstant.termAndConditionHeadingText.tr,
  //                     style: const TextStyle(
  //                       fontStyle: FontStyle.normal,
  //                       fontSize: 18,
  //                       fontWeight: FontWeight.w600,
  //                       decoration: TextDecoration.underline,
  //                       color: appColor,
  //                     ),
  //                   ),
  //                   const SizedBox(
  //                     height: 30,
  //                   ),
  //                   Expanded(
  //                     child: ListView.builder(
  //                       padding: EdgeInsets.zero,
  //                       shrinkWrap: true,
  //                       itemCount:
  //                           controller.getprivacyPolicy[0].cmsText!.length,
  //                       itemBuilder: (BuildContext context, int index) {
  //                         final getList =
  //                             controller.getprivacyPolicy[0].cmsText![index];
  //                         return expandDetailWidget(
  //                             getList.title!, getList.description!, index + 1);
  //                       },
  //                     ),
  //                   ),
  //                   const SizedBox(
  //                     height: 10,
  //                   ),
  //                 ],
  //               ),
  //             ),
  //     ),
  //   );
  // }

  // Widget expandDetailWidget(String text, String subText, int value) {
  //   return Obx(
  //     () => GestureDetector(
  //       onTap: () {
  //         if (controller.index.value == value) {
  //           controller.index.value = 0;
  //         } else {
  //           controller.index.value = value;
  //         }
  //       },
  //       child: Column(
  //         children: [
  //           Container(
  //             padding: EdgeInsets.all(10),
  //             color: secondaryColor,
  //             child: Row(
  //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //               children: [
  //                 Expanded(
  //                   child: Text(
  //                     text,
  //                     style: const TextStyle(
  //                       color: appColor,
  //                       fontWeight: FontWeight.w500,
  //                     ),
  //                   ),
  //                 ),
  //                 controller.index.value == value
  //                     ? const Icon(
  //                         Icons.remove,
  //                         color: appColor,
  //                       )
  //                     : const Icon(
  //                         Icons.add,
  //                         color: appColor,
  //                       ),
  //               ],
  //             ),
  //           ),
  //           SizedBox(
  //             height: 10,
  //           ),
  //           Visibility(
  //             visible: controller.index.value == value ? true : false,
  //             child: Html(
  //               data: subText,
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
