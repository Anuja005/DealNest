import 'package:deal_nest/common/widgets/success_screen/success_screen.dart';
import 'package:deal_nest/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:deal_nest/features/shop/screens/checkout/widgets/billing_address_section.dart';
import 'package:deal_nest/features/shop/screens/checkout/widgets/billing_amount_section.dart';
import 'package:deal_nest/features/shop/screens/checkout/widgets/billing_payment_section.dart';
import 'package:deal_nest/features/shop/screens/home/widgets/rounded_container.dart';
import 'package:deal_nest/navigation_menu.dart';
import 'package:deal_nest/utils/constants/image_strings.dart';
import 'package:deal_nest/utils/constants/sizes.dart';
import 'package:deal_nest/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/products/cart/coupon_widget.dart';
import '../../../../utils/constants/colors.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: MyAppBar(
          showBackArrow: true,
          title: Text('Order Review',
              style: Theme.of(context).textTheme.headlineSmall)),
      body: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            ///Items in cart
            MyCartItems(showAddRemoveButtons: false),
            SizedBox(height: TSizes.spaceBtwSections),

            ///Coupon Field
            MyCouponCode(),
            SizedBox(height: TSizes.spaceBtwSections),

            ///Billing section
            MyRoundedContainer(
              showBorder: true,
              padding: EdgeInsets.all(TSizes.md),
              backgroundColor: dark ? TColors.dark : TColors.white,
              child: Column(
                children: [
                  ///Pricing
                  MyBillingAmountSection(),
                  SizedBox(height: TSizes.spaceBtwItems),

                  ///Divider
                  Divider(),
                  SizedBox(height: TSizes.spaceBtwItems),

                  ///Payment Method
                  MyBillingPaymentSection(),
                  SizedBox(height: TSizes.spaceBtwItems),

                  ///Address
                  MyBillingAddressSection(),
                ],
              ),
            ),
          ],
        ),
      )),

      ///Checkout Button
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(
            onPressed: () => Get.to(
                  () => SuccessScreen(
                    image: TImages.successfulPaymentIcon,
                    title: 'Payment Success!',
                    subTitle: 'Your item will be shipped soon!',
                    onPressed: () => Get.offAll(() => NavigationMenu()),
                  ),
                ),
            child: Text('Checkout \$256.0')),
      ),
    );
  }
}
