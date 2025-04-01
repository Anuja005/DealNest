import 'package:deal_nest/common/widgets/appbar/appbar.dart';
import 'package:deal_nest/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:deal_nest/common/widgets/layouts/grid_layout.dart';
import 'package:deal_nest/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:deal_nest/common/widgets/texts/section_heading.dart';
import 'package:deal_nest/features/shop/screens/home/widgets/rounded_container.dart';
import 'package:deal_nest/utils/constants/colors.dart';
import 'package:deal_nest/utils/constants/image_strings.dart';
import 'package:deal_nest/utils/constants/sizes.dart';
import 'package:deal_nest/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/images/my_circular_image.dart';
import '../../../../common/widgets/texts/my_brand_title_text_with_verified_icon.dart';
import '../../../../utils/constants/enums.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: Text('Store', style: Theme.of(context).textTheme.headlineMedium),
        actions: [
          MyCartCounterIcon(
            onPressed: () {},
            ////Shop Icon theme setup but not cart count
            iconColor: Theme.of(context).brightness == Brightness.dark
                ? TColors.white
                : TColors.black,

            ///stop theme setup in icon color
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

                      MyGridLayout(
                          itemCount: 4,
                          mainAxisExtent: 80,
                          itemBuilder: (_, index) {
                            return GestureDetector(
                              onTap: () {},
                              child: MyRoundedContainer(
                                padding: EdgeInsets.all(TSizes.sm),
                                showBorder: true,
                                backgroundColor: Colors.transparent,
                                child: Row(
                                  children: [
                                    ///Icon
                                    Flexible(
                                      child: MyCircularImage(
                                        isNetworkImage: false,
                                        image: TImages.clothIcon,
                                        backgroundColor: Colors.transparent,
                                        overlayColor:
                                            THelperFunctions.isDarkMode(context)
                                                ? TColors.white
                                                : TColors.black,
                                      ),
                                    ),
                                    SizedBox(width: TSizes.spaceBtwItems / 2),

                                    ///Text
                                    Expanded(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          MyBrandTitleTextWithVerificationIcon(
                                              title: 'Nike',
                                              brandTextSize: TextSizes.large),
                                          Text(
                                            '256 products',
                                            overflow: TextOverflow.ellipsis,
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelMedium,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          })
                    ],
                  ),
                ),
              ),
            ];
          },
          body: Container()),
    );
  }
}
