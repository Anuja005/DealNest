import 'package:deal_nest/features/shop/screens/cart/cart.dart';
import 'package:deal_nest/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/helpers/helper_functions.dart';

class MyCartCounterIcon extends StatelessWidget {
  const MyCartCounterIcon({
    super.key,
    required this.onPressed,
    required this.iconColor,
    this.counterBgColor,
    this.counterTextColor,
  });

  final VoidCallback onPressed;
  final Color? iconColor, counterTextColor, counterBgColor;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Stack(
      children: [
        IconButton(
            onPressed: () => Get.to(() => CartScreen()),
            icon: Icon(Iconsax.shopping_bag, color: iconColor)),
        Positioned(
          right: 0,
          child: Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
              color: counterBgColor ?? (dark ? TColors.white : TColors.black),
              borderRadius: BorderRadius.circular(100),
            ),
            child: Center(
                child: Text('2',
                    style: Theme.of(context).textTheme.labelLarge!.apply(
                        color: counterTextColor ??
                            (dark ? TColors.white : TColors.black),
                        fontSizeFactor: 0.8))),
          ),
        ),
      ],
    );
  }
}
