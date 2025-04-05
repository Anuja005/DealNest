import 'package:flutter/material.dart';

import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/products/cart/cart_menu_icon.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/text_strings.dart';

class MyHomeAppBar extends StatelessWidget {
  const MyHomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MyAppBar(
      title: Column(
        children: [
          Text(TTexts.homeAppbarTitle,
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .apply(color: TColors.grey)),
          Text(TTexts.homeAppbarSubTitle,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .apply(color: TColors.white)),
        ],
      ),
      actions: [
        MyCartCounterIcon(
            onPressed: () {},
            iconColor: TColors.white,
            counterBgColor: TColors.black,
            counterTextColor: TColors.white),
      ],
    );
  }
}
