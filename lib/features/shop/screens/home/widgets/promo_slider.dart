import 'package:carousel_slider/carousel_slider.dart';
import 'package:deal_nest/common/widgets/shimmer/shimmer.dart';
import 'package:deal_nest/features/shop/controllers/banner_controller.dart';
import 'package:deal_nest/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/custom_shapes/containers/circular_container.dart';
import '../../../../../common/widgets/images/my_rounded_image.dart';
import '../../../../../utils/constants/sizes.dart';

class MyPromoSlider extends StatelessWidget {
  const MyPromoSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BannerController());
    return Obx(
      () {
        //Loader
        if (controller.isLoading.value)
          return MyShimmerEffect(width: double.infinity, height: 190);

        // No data found
        if (controller.banners.isEmpty) {
          return Center(child: Text('No Data Found!'));
        } else {
          return Column(
            children: [
              CarouselSlider(
                options: CarouselOptions(
                    viewportFraction: 1,
                    onPageChanged: (index, _) =>
                        controller.updatePageIndicator(index)),
                items: controller.banners
                    .map((banner) => MyRoundedImage(
                          imageUrl: banner.imageUrl,
                          isNetworkImage: true,
                          onPressed: () => Get.toNamed(banner.targetScreen),
                        ))
                    .toList(),
              ),
              SizedBox(height: TSizes.spaceBtwItems),
              Center(
                child: Obx(
                  () => Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      for (int i = 0; i < controller.banners.length; i++)
                        MyCircularContainer(
                          width: 20,
                          height: 4,
                          margin: EdgeInsets.only(right: 10),
                          backgroundColor:
                              controller.carousalCurrentIndex.value == i
                                  ? TColors.primary
                                  : TColors.grey,
                        ),
                    ],
                  ),
                ),
              )
            ],
          );
        }
      },
    );
  }
}
