import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:solo_luxury/app/screens/product_detail/product_detail_screen.dart';
import 'package:solo_luxury/app/utils/app_asset.dart';
import 'package:solo_luxury/app/utils/colors.dart';

import '../../../../data/model/Product/product_model.dart';
import '../../../../utils/app_constants.dart';
import '../../../../utils/app_routes.dart';
import 'package:solo_luxury/main.dart';

class Product extends StatelessWidget {
  //const Product({Key? key}) : super(key: key);
  Item? item;
  List<Item>? itemList = [];

  Product({Key? key, this.item, this.itemList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(RoutesConstants.productDetailsScreen, arguments: [item]);
      },
      child: Container(
        width: 150,
        color: backGroundColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 210,
              //padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                border: Border.all(
                  color: appColor,
                  width: 1.4,
                ),
              ),
              child: Stack(
                //mainAxisSize: MainAxisSize.min,
                children: [
                  Image.network(
                    "${AppConstants.productImageUrl}${item!.getProductImage()}",
                    height: 210,
                    width: 210,
                    fit: BoxFit.fill,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Align(
                        alignment: Alignment.topRight,
                        child: item!.isWishList.value
                            ? Icon(
                                Icons.favorite,
                                color: appColor,
                              )
                            : SvgPicture.asset(
                                AppAsset.heart,
                                height: 14,
                                color: appColor,
                              )),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "${item!.getBrandName()}",
              style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                  fontSize: 16,
                  overflow: TextOverflow.ellipsis),
            ),
            const SizedBox(height: 6),
            Text(
              "${item?.name}",
              style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                  fontSize: 16,
                  overflow: TextOverflow.ellipsis),
            ),
            const SizedBox(height: 6),
            Row(
              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  '${localStore.currentCurrency}' +
                      "${item?.getPriceFromConfigurableProduct(itemList, item)}",
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(width: 50),
                Text(
                  '\$' + "${item?.price}",
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.black45,
                    decoration: TextDecoration.lineThrough,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
