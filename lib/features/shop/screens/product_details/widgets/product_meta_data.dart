import 'package:deal_nest/common/widgets/images/my_circular_image.dart';
import 'package:deal_nest/common/widgets/products/product_cards/product_price_text.dart';
import 'package:deal_nest/common/widgets/texts/my_brand_title_text_with_verified_icon.dart';
import 'package:deal_nest/common/widgets/texts/product_title_text.dart';
import 'package:deal_nest/utils/constants/enums.dart';
import 'package:deal_nest/utils/constants/image_strings.dart';
import 'package:deal_nest/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../home/widgets/rounded_container.dart';

class MyProductMetaData extends StatelessWidget {
  const MyProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode = THelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ///Price & Sale Price
        Row(
          children: [
            ///Sale Tag
            MyRoundedContainer(
              radius: TSizes.sm,
              backgroundColor: TColors.secondary.withOpacity(0.8),
              padding: EdgeInsets.symmetric(
                  horizontal: TSizes.sm, vertical: TSizes.xs),
              child: Text('25%',
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .apply(color: TColors.black)),
            ),
            SizedBox(width: TSizes.spaceBtwItems),

            ///Price
            Text('\$250',
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .apply(decoration: TextDecoration.lineThrough)),
            SizedBox(width: TSizes.spaceBtwItems),
            MyProductPriceText(price: '175', isLarge: true),
          ],
        ),
        SizedBox(height: TSizes.spaceBtwItems / 1.5),

        ///Title
        MyProductTitleText(title: 'Green Nike Sports Shirts'),
        SizedBox(height: TSizes.spaceBtwItems / 1.5),

        ///Stack Status
        Row(
          children: [
            MyProductTitleText(title: 'Status'),
            SizedBox(width: TSizes.spaceBtwItems),
            Text('In Stock', style: Theme.of(context).textTheme.titleMedium),
          ],
        ),

        SizedBox(height: TSizes.spaceBtwItems / 1.5),

        ///Brand
        Row(
          children: [
            MyCircularImage(
              image: TImages.shoeIcon,
              width: 32,
              height: 32,
              overlayColor: darkMode ? TColors.white : TColors.black,
            ),
            MyBrandTitleTextWithVerificationIcon(
                title: 'Nike', brandTextSize: TextSizes.medium),
          ],
        ),
      ],
    );
  }
}
