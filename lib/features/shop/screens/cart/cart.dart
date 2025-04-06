import 'package:deal_nest/common/widgets/appbar/appbar.dart';
import 'package:deal_nest/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:deal_nest/features/shop/screens/checkout/checkout.dart';
import 'package:deal_nest/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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

        ///Items in cart
        child: MyCartItems(),
      ),

      ///Checkout Button
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(
            onPressed: () => Get.to(() => CheckoutScreen()),
            child: Text('Checkout \$256.0')),
      ),
    );
  }
}
