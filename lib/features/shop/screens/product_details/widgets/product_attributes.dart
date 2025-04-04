import 'package:deal_nest/common/widgets/texts/product_title_text.dart';
import 'package:deal_nest/common/widgets/texts/section_heading.dart';
import 'package:deal_nest/features/shop/screens/home/widgets/rounded_container.dart';
import 'package:deal_nest/utils/constants/colors.dart';
import 'package:deal_nest/utils/constants/sizes.dart';
import 'package:deal_nest/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widgets/chips/choice_chip.dart';
import '../../../../../common/widgets/products/product_cards/product_price_text.dart';

class MyProductAttributes extends StatelessWidget {
  const MyProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        ///Selected Attribute Pricing & Description
        MyRoundedContainer(
          padding: EdgeInsets.all(TSizes.md),
          backgroundColor: dark ? TColors.darkerGrey : TColors.grey,
          child: Column(
            children: [
              ///Title, Price & Stock Status
              Row(
                children: [
                  MySectionHeading(title: 'Variation', showActionButton: false),
                  SizedBox(width: TSizes.spaceBtwItems),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          MyProductTitleText(
                              title: 'Price : ', smallSize: true),

                          ///Actual Price
                          Text(
                            '\$25',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .apply(decoration: TextDecoration.lineThrough),
                          ),
                          SizedBox(width: TSizes.spaceBtwItems),

                          ///Sale Price
                          MyProductPriceText(price: '20'),
                        ],
                      ),

                      ///Stack
                      Row(
                        children: [
                          MyProductTitleText(
                              title: 'Stock : ', smallSize: true),
                          Text('In Stock',
                              style: Theme.of(context).textTheme.titleMedium),
                        ],
                      ),
                    ],
                  ),
                ],
              ),

              ///Variation Description
              MyProductTitleText(
                title:
                    'This is the Description of the Product and it can go up to max 4 lines',
                smallSize: true,
                maxLines: 4,
              ),
            ],
          ),
        ),
        SizedBox(height: TSizes.spaceBtwItems),

        ///Attributes
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MySectionHeading(title: 'Colors', showActionButton: false),
            SizedBox(height: TSizes.spaceBtwItems / 2),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Wrap(
                spacing: 8,
                children: [
                  MyChoiceChip(
                      text: 'Green', selected: true, onSelected: (value) {}),
                  MyChoiceChip(
                      text: 'Blue', selected: false, onSelected: (value) {}),
                  MyChoiceChip(
                      text: 'Yellow', selected: false, onSelected: (value) {}),
                  MyChoiceChip(
                      text: 'Red', selected: false, onSelected: (value) {}),
                  MyChoiceChip(
                      text: 'White', selected: false, onSelected: (value) {}),
                  MyChoiceChip(
                      text: 'Black', selected: false, onSelected: (value) {}),
                  MyChoiceChip(
                      text: 'Pink', selected: false, onSelected: (value) {}),
                ],
              ),
            )
          ],
        ),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MySectionHeading(title: 'Size', showActionButton: false),
            SizedBox(height: TSizes.spaceBtwItems / 2),
            Wrap(
              spacing: 8,
              children: [
                MyChoiceChip(
                    text: 'EU 30', selected: true, onSelected: (value) {}),
                MyChoiceChip(
                    text: 'EU 32', selected: false, onSelected: (value) {}),
                MyChoiceChip(
                    text: 'EU 34', selected: false, onSelected: (value) {}),
                MyChoiceChip(
                    text: 'EU 36', selected: false, onSelected: (value) {}),
                MyChoiceChip(
                    text: 'EU 38', selected: false, onSelected: (value) {}),
                MyChoiceChip(
                    text: 'EU 40', selected: false, onSelected: (value) {}),
              ],
            )
          ],
        ),
      ],
    );
  }
}
