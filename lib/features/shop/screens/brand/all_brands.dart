import 'package:deal_nest/common/widgets/appbar/appbar.dart';
import 'package:deal_nest/common/widgets/brand/brand_card.dart';
import 'package:deal_nest/common/widgets/layouts/grid_layout.dart';
import 'package:deal_nest/common/widgets/texts/section_heading.dart';
import 'package:deal_nest/features/shop/screens/brand/brand_products.dart';
import 'package:deal_nest/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: Text('Brand'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              ///Heading
              MySectionHeading(title: 'Brands', showActionButton: false),
              SizedBox(height: TSizes.spaceBtwSections),

              ///Brands
              MyGridLayout(
                itemCount: 10,
                mainAxisExtent: 80,
                itemBuilder: (context, index) => MyBrandCard(
                  showBorder: true,
                  onTap: () => Get.to(() => BrandProducts()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
