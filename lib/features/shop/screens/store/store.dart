import 'package:deal_nest/common/widgets/appbar/appbar.dart';
import 'package:deal_nest/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:deal_nest/common/widgets/layouts/grid_layout.dart';
import 'package:deal_nest/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:deal_nest/common/widgets/texts/section_heading.dart';
import 'package:deal_nest/features/shop/screens/store/widgets/category_tab.dart';
import 'package:deal_nest/utils/constants/colors.dart';
import 'package:deal_nest/utils/constants/sizes.dart';
import 'package:deal_nest/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/appbar/tabbar.dart';
import '../../../../common/widgets/brand/brand_card.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
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
                          onPressed: () {}),
                      SizedBox(height: TSizes.spaceBtwItems / 1.5),

                      ///Brands Grid
                      MyGridLayout(
                        itemCount: 4,
                        mainAxisExtent: 80,
                        itemBuilder: (_, index) {
                          return MyBrandCard(showBorder: false);
                        },
                      ),
                    ],
                  ),
                ),

                ///Tabs
                bottom: MyTabBar(
                  tabs: [
                    Tab(child: Text('Sports')),
                    Tab(child: Text('Furniture')),
                    Tab(child: Text('Electronics')),
                    Tab(child: Text('Clothes')),
                    Tab(child: Text('Cosmetics')),
                  ],
                ),
              ),
            ];
          },
          body: TabBarView(
            children: [
              MyCategoryTab(),
              MyCategoryTab(),
              MyCategoryTab(),
              MyCategoryTab(),
              MyCategoryTab()
            ],
          ),
        ),
      ),
    );
  }
}
