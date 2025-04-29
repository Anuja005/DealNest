import 'package:deal_nest/common/widgets/layouts/grid_layout.dart';
import 'package:deal_nest/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:deal_nest/common/widgets/texts/section_heading.dart';
import 'package:deal_nest/features/shop/models/category_model.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widgets/brand/brand_show_case.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';

class MyCategoryTab extends StatelessWidget {
  const MyCategoryTab({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              ///Brands
              MyBrandShowcase(images: [
                TImages.productImage3,
                TImages.productImage2,
                TImages.productImage1
              ]),
              MyBrandShowcase(images: [
                TImages.productImage3,
                TImages.productImage2,
                TImages.productImage1
              ]),
              SizedBox(height: TSizes.spaceBtwItems),

              ///Products
              MySectionHeading(title: 'You might like', onPressed: () {}),
              SizedBox(height: TSizes.spaceBtwItems),

              MyGridLayout(
                  itemCount: 4,
                  itemBuilder: (_, index) => MyProductCardVertical())
            ],
          ),
        ),
      ],
    );
  }
}
