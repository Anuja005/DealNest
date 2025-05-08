import 'package:cached_network_image/cached_network_image.dart';
import 'package:deal_nest/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import '../../../../../common/widgets/icons/my_circular_icon.dart';
import '../../../../../common/widgets/images/my_rounded_image.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../controllers/product/images_controller.dart';
import '../../../models/product_model.dart';

class MyProductImageSlider extends StatelessWidget {
  const MyProductImageSlider({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    final controller = Get.put(ImagesController());
    final images = controller.getAllProductImages(product);

    return MyCurvedEdgeWidget(
      child: Container(
        color: dark ? TColors.darkerGrey : TColors.light,
        child: Stack(
          children: [
            ///Main Large Image
            SizedBox(
              height: 400,
              child: Padding(
                padding: EdgeInsets.all(TSizes.productImageRadius * 2),
                child: Center(child: Obx(
                  () {
                    final image = controller.selectedProductImage.value;
                    return GestureDetector(
                      onTap: () => controller.showEnlargedImage(image),
                      child: CachedNetworkImage(
                        imageUrl: image,
                        progressIndicatorBuilder: (_, __, downloadProgress) =>
                            CircularProgressIndicator(
                                value: downloadProgress.progress,
                                color: TColors.primary),
                      ),
                    );
                  },
                )),
              ),
            ),

            ///Image Slider
            Positioned(
              right: 0,
              bottom: 30,
              left: TSizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  itemCount: images.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: AlwaysScrollableScrollPhysics(),
                  separatorBuilder: (_, __) =>
                      SizedBox(width: TSizes.spaceBtwItems),
                  itemBuilder: (_, index) => Obx(() {
                    final imageSelected =
                        controller.selectedProductImage.value == images[index];
                    return MyRoundedImage(
                      width: 80,
                      isNetworkImage: true,
                      imageUrl: images[index],
                      padding: EdgeInsets.all(TSizes.sm),
                      backgroundColor: dark ? TColors.dark : TColors.white,
                      onPressed: () =>
                          controller.selectedProductImage.value = images[index],
                      border: Border.all(
                          color: imageSelected
                              ? TColors.primary
                              : Colors.transparent),
                    );
                  }),
                ),
              ),
            ),

            ///Appbar Icons
            MyAppBar(
              showBackArrow: true,
              actions: [
                MyCircularIcon(icon: Iconsax.heart5, color: Colors.red)
              ],
            )
          ],
        ),
      ),
    );
  }
}
