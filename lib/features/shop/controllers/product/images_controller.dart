import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/sizes.dart';
import '../../models/product_model.dart';

class ImagesController extends GetxController {
  static ImagesController get instance => Get.find();

  /// Variables
  RxString selectedProductImage = ''.obs;

  /// Get All Images from product and Variations
  List<String> getAllProductImages(ProductModel product) {
    Set<String> images = {};
    if (product.thumbnail?.isNotEmpty == true) {
      images.add(product.thumbnail!);
      selectedProductImage.value = product.thumbnail!;
    }
    if (product.images != null) {
      images.addAll(product.images!.where((url) => url?.isNotEmpty == true));
    }
    if (product.productVariations != null &&
        product.productVariations!.isNotEmpty) {
      images.addAll(product.productVariations!
          .map((variation) => variation.image)
          .where((url) => url?.isNotEmpty == true));
    }
    return images.toList();
  }

  /// Show Image Popup
  void showEnlargedImage(String image) {
    Get.to(
      fullscreenDialog: true,
      () => Dialog.fullscreen(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: TSizes.defaultSpace * 2,
                  horizontal: TSizes.defaultSpace),
              child: CachedNetworkImage(imageUrl: image),
            ),
            SizedBox(height: TSizes.spaceBtwSections),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: 150,
                child: OutlinedButton(
                    onPressed: () => Get.back(), child: Text('Close')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
