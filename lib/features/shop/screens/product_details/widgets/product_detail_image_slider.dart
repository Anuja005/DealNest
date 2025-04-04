import 'package:deal_nest/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import '../../../../../common/widgets/icons/my_circular_icon.dart';
import '../../../../../common/widgets/images/my_rounded_image.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';

class MyProductImageSlider extends StatelessWidget {
  const MyProductImageSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
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
                child: Center(
                    child: Image(image: AssetImage(TImages.productImage5))),
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
                  separatorBuilder: (_, __) =>
                      SizedBox(width: TSizes.spaceBtwItems),
                  itemCount: 6,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: AlwaysScrollableScrollPhysics(),
                  itemBuilder: (_, index) => MyRoundedImage(
                    width: 80,
                    backgroundColor: dark ? TColors.dark : TColors.white,
                    border: Border.all(color: TColors.primary),
                    padding: EdgeInsets.all(TSizes.sm),
                    imageUrl: TImages.productImage6,
                  ),
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
