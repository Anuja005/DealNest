import 'package:deal_nest/common/widgets/images/my_circular_image.dart';
import 'package:deal_nest/common/widgets/products/product_cards/product_price_text.dart';
import 'package:deal_nest/common/widgets/texts/my_brand_title_text_with_verified_icon.dart';
import 'package:deal_nest/common/widgets/texts/product_title_text.dart';
import 'package:deal_nest/features/shop/controllers/product/product_controller.dart';
import 'package:deal_nest/features/shop/models/product_model.dart';
import 'package:deal_nest/utils/constants/enums.dart';
import 'package:deal_nest/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../home/widgets/rounded_container.dart';

class MyProductMetaData extends StatelessWidget {
  const MyProductMetaData({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final salePercentage =
        controller.calculateSalePercentage(product.price, product.salePrice);
    final darkMode = THelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ///Price & Sale Price
        Row(
          children: [
            ///Sale Tag
            if (salePercentage != null)
              MyRoundedContainer(
                radius: TSizes.sm,
                backgroundColor: TColors.secondary.withOpacity(0.8),
                padding: EdgeInsets.symmetric(
                    horizontal: TSizes.sm, vertical: TSizes.xs),
                child: Text('$salePercentage%',
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .apply(color: TColors.black)),
              ),
            SizedBox(width: TSizes.spaceBtwItems),

            ///Price
            if (product.productType == ProductType.single.toString() &&
                product.salePrice > 0)
              Text('\$${product.price}',
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .apply(decoration: TextDecoration.lineThrough)),
            if (product.productType == ProductType.single.toString() &&
                product.salePrice > 0)
              SizedBox(width: TSizes.spaceBtwItems),
            MyProductPriceText(
                price: controller.getProductPrice(product), isLarge: true),
          ],
        ),
        SizedBox(height: TSizes.spaceBtwItems / 1.5),

        ///Title
        MyProductTitleText(title: product.title),
        SizedBox(height: TSizes.spaceBtwItems / 1.5),

        ///Stock Status
        Row(
          children: [
            MyProductTitleText(title: 'Status'),
            SizedBox(width: TSizes.spaceBtwItems),
            Text(controller.getProductStockStatus(product.stock),
                style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
        SizedBox(height: TSizes.spaceBtwItems / 1.5),

        ///Brand
        Row(
          children: [
            MyCircularImage(
              image: product.brand?.image ?? '',
              width: 32,
              height: 32,
              overlayColor: darkMode ? TColors.white : TColors.black,
              isNetworkImage: true,
            ),
            MyBrandTitleTextWithVerificationIcon(
              title: product.brand?.name ?? '',
              brandTextSize: TextSizes.medium,
            ),
          ],
        ),
      ],
    );
  }
}
