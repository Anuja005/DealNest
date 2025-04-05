import 'package:deal_nest/common/widgets/appbar/appbar.dart';
import 'package:deal_nest/common/widgets/products/product_cards/product_price_text.dart';
import 'package:deal_nest/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/products/cart/add_remove_button.dart';
import '../../../../common/widgets/products/cart/cart_item.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
          showBackArrow: true,
          title:
              Text('Cart', style: Theme.of(context).textTheme.headlineSmall)),
      body: Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        child: ListView.separated(
          shrinkWrap: true,
          separatorBuilder: (_, __) =>
              SizedBox(height: TSizes.spaceBtwSections),
          itemCount: 6,
          itemBuilder: (_, index) => Column(
            children: [
              MyCartItem(),
              SizedBox(height: TSizes.spaceBtwItems),
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
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child:
            ElevatedButton(onPressed: () {}, child: Text('Checkout \$256.0')),
      ),
    );
  }
}
