import 'package:deal_nest/common/widgets/appbar/appbar.dart';
import 'package:deal_nest/common/widgets/images/my_rounded_image.dart';
import 'package:deal_nest/common/widgets/products/product_cards/product_card_horizontal.dart';
import 'package:deal_nest/common/widgets/texts/section_heading.dart';
import 'package:deal_nest/utils/constants/image_strings.dart';
import 'package:deal_nest/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class MySubCategoriesScreen extends StatelessWidget {
  const MySubCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: Text('Sports'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              ///Banner
              MyRoundedImage(
                  width: double.infinity,
                  imageUrl: TImages.banner3,
                  applyImageRadius: true),
              SizedBox(height: TSizes.spaceBtwSections),

              ///Sub Categories
              Column(
                children: [
                  ///Heading
                  MySectionHeading(title: 'Sports Shirts', onPressed: () {}),
                  SizedBox(height: TSizes.spaceBtwItems / 2),

                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                        itemCount: 4,
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (context, index) =>
                            SizedBox(width: TSizes.spaceBtwItems),
                        itemBuilder: (context, index) =>
                            MyProductCardHorizontal()),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
