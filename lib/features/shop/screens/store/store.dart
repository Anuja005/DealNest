import 'package:deal_nest/common/widgets/appbar/appbar.dart';
import 'package:deal_nest/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:deal_nest/common/widgets/layouts/grid_layout.dart';
import 'package:deal_nest/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:deal_nest/common/widgets/texts/section_heading.dart';
import 'package:deal_nest/features/shop/controllers/brand_controller.dart';
import 'package:deal_nest/features/shop/controllers/category_controller.dart';
import 'package:deal_nest/features/shop/screens/brand/all_brands.dart';
import 'package:deal_nest/features/shop/screens/brand/brand_products.dart';
import 'package:deal_nest/features/shop/screens/store/widgets/category_tab.dart';
import 'package:deal_nest/utils/constants/colors.dart';
import 'package:deal_nest/utils/constants/sizes.dart';
import 'package:deal_nest/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/appbar/tabbar.dart';
import '../../../../common/widgets/brand/brand_card.dart';
import '../../../../common/widgets/shimmer/brands_shimmer.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final brandController = Get.put(BrandController());
    final categories = CategoryController.instance.featuredCategories;

    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        appBar: MyAppBar(
          title:
              Text('Store', style: Theme.of(context).textTheme.headlineMedium),
          actions: [
            MyCartCounterIcon(
              onPressed: () {},
              iconColor: THelperFunctions.isDarkMode(context)
                  ? TColors.white
                  : TColors.black,
              counterTextColor: THelperFunctions.isDarkMode(context)
                  ? TColors.black
                  : TColors.white,
            ),
          ],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                backgroundColor: THelperFunctions.isDarkMode(context)
                    ? TColors.black
                    : TColors.white,
                expandedHeight: 440,
                flexibleSpace: Padding(
                  padding: EdgeInsets.all(TSizes.defaultSpace),
                  child: ListView(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      ///SearchBar
                      SizedBox(height: TSizes.spaceBtwItems),
                      MySearchContainer(
                        text: 'Search in Store',
                        showBorder: true,
                        showBackground: false,
                        padding: EdgeInsets.zero,
                      ),
                      SizedBox(height: TSizes.spaceBtwSections),

                      ///Featured Brands
                      MySectionHeading(
                          title: 'Featured Brands',
                          showActionButton: true,
                          onPressed: () => Get.to(() => AllBrandsScreen())),
                      SizedBox(height: TSizes.spaceBtwItems / 1.5),

                      ///Brands Grid
                      Obx(
                        () {
                          if (brandController.isLoading.value)
                            return MyBrandsShimmer();

                          if (brandController.featuredBrands.isEmpty) {
                            return Center(
                                child: Text('No Data Found!',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .apply(color: Colors.white)));
                          }

                          return MyGridLayout(
                            itemCount: brandController.featuredBrands.length,
                            mainAxisExtent: 80,
                            itemBuilder: (_, index) {
                              final brand =
                                  brandController.featuredBrands[index];
                              return MyBrandCard(
                                  showBorder: true,
                                  brand: brand,
                                  onTap: () => Get.to(
                                      () => BrandProducts(brand: brand)));
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),

                ///Tabs
                bottom: MyTabBar(
                    tabs: categories
                        .map((category) => Tab(child: Text(category.name)))
                        .toList()),
              ),
            ];
          },
          body: TabBarView(
              children: categories
                  .map((category) => MyCategoryTab(category: category))
                  .toList()),
        ),
      ),
    );
  }
}
