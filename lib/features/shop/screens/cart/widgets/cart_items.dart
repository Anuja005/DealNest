import 'package:flutter/material.dart';

import '../../../../../common/widgets/products/cart/add_remove_button.dart';
import '../../../../../common/widgets/products/cart/cart_item.dart';
import '../../../../../common/widgets/products/product_cards/product_price_text.dart';
import '../../../../../utils/constants/sizes.dart';

class MyCartItems extends StatelessWidget {
  const MyCartItems({
    super.key,
    this.showAddRemoveButtons = true,
  });

  final bool showAddRemoveButtons;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      separatorBuilder: (_, __) => SizedBox(height: TSizes.spaceBtwSections),
      itemCount: 4,
      itemBuilder: (_, index) => Column(
        children: [
          ///Cart item
          MyCartItem(),
          if (showAddRemoveButtons) SizedBox(height: TSizes.spaceBtwItems),

          ///Add,Remove Btn with total price
          if (showAddRemoveButtons)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(width: 70),

                    ///Add Remove Btn
                    MyProductQuantityWithAddRemoveButton(),
                  ],
                ),
                MyProductPriceText(price: '256'),
              ],
            ),
        ],
      ),
    );
  }
}
