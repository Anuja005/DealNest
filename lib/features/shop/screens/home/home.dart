import 'package:deal_nest/features/shop/screens/all_products/all_products.dart';
import 'package:deal_nest/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:deal_nest/features/shop/screens/home/widgets/home_categories.dart';
import 'package:deal_nest/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:deal_nest/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../common/widgets/products/product_cards/product_card_vertical.dart';
import '../../../../common/widgets/shimmer/vertical_product_shimmer.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../controllers/product_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ///header section
            MyPrimaryHeaderContainer(
              child: Column(
                children: [
                  MyHomeAppBar(),
                  SizedBox(height: TSizes.spaceBtwSections),

                  ///Searchbar section
                  MySearchContainer(text: 'Search in Store'),
                  SizedBox(height: TSizes.spaceBtwSections),

                  ///Categories section
                  Padding(
                    padding: EdgeInsets.only(left: TSizes.defaultSpace),
                    child: Column(
                      children: [
                        ///Header
                        MySectionHeading(
                            title: 'Popular Categories',
                            showActionButton: false,
                            textColor: Colors.white),
                        SizedBox(height: TSizes.spaceBtwItems),

                        ///Categories
                        MyHomeCategories(),
                      ],
                    ),
                  ),

                  SizedBox(height: TSizes.spaceBtwSections),
                ],
              ),
            ),

            ///Body
            Padding(
              padding: EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  ///Promo Slider
                  MyPromoSlider(),
                  SizedBox(height: TSizes.spaceBtwSections),

                  ///Heading
                  MySectionHeading(
                      title: 'Popular Products',
                      onPressed: () => Get.to(() => AllProducts())),
                  SizedBox(height: TSizes.spaceBtwItems),

                  ///Popular Products
                  Obx(() {
                    if (controller.isLoading.value)
                      return MyVerticalProductShimmer();

                    if (controller.featuredProducts.isEmpty) {
                      return Center(
                          child: Text('No Data Found!',
                              style: Theme.of(context).textTheme.bodyMedium));
                    }
                    return MyGridLayout(
                      itemCount: controller.featuredProducts.length,
                      itemBuilder: (_, index) => MyProductCardVertical(
                          product: controller.featuredProducts[index]),
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
