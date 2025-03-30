import 'package:deal_nest/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:deal_nest/features/shop/screens/home/widgets/home_categories.dart';
import 'package:deal_nest/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../../common/widgets/texts/section_heading.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
