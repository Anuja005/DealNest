import 'package:deal_nest/common/widgets/appbar/appbar.dart';
import 'package:deal_nest/common/widgets/icons/my_circular_icon.dart';
import 'package:deal_nest/common/widgets/layouts/grid_layout.dart';
import 'package:deal_nest/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:deal_nest/features/shop/screens/home/home.dart';
import 'package:deal_nest/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../models/product_model.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title:
            Text('Wishlist', style: Theme.of(context).textTheme.headlineMedium),
        actions: [
          MyCircularIcon(
              icon: Iconsax.add, onPressed: () => Get.to(HomeScreen())),
        ],
      ),

      //Body
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),

          //Products Grid
          child: MyGridLayout(
              itemCount: 6,
              itemBuilder: (_, index) =>
                  MyProductCardVertical(product: ProductModel.empty())),
        ),
      ),
    );
  }
}
