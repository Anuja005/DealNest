import 'package:deal_nest/common/widgets/texts/section_heading.dart';
import 'package:deal_nest/features/shop/screens/product_details/widgets/bottom_add_to_cart_widget.dart';
import 'package:deal_nest/features/shop/screens/product_details/widgets/product_attributes.dart';
import 'package:deal_nest/features/shop/screens/product_details/widgets/product_detail_image_slider.dart';
import 'package:deal_nest/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:deal_nest/features/shop/screens/product_details/widgets/rating_share_widget.dart';
import 'package:deal_nest/features/shop/screens/product_reviews/product_reviews.dart';
import 'package:deal_nest/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MyBottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// 1 - Product Image Slider
            MyProductImageSlider(),

            /// 2 - Product Details
            Padding(
              padding: EdgeInsets.only(
                  right: TSizes.defaultSpace,
                  left: TSizes.defaultSpace,
                  bottom: TSizes.defaultSpace),
              child: Column(
                children: [
                  ///Rating & Share Button
                  MyRatingAndShare(),

                  ///Price, Title, Stock & Brand
                  MyProductMetaData(),

                  ///Attractive
                  MyProductAttributes(),
                  SizedBox(height: TSizes.spaceBtwSections),

                  ///Checkout Button
                  SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {}, child: Text('Checkout'))),
                  SizedBox(height: TSizes.spaceBtwSections),

                  ///Description
                  MySectionHeading(
                      title: 'Description', showActionButton: false),
                  SizedBox(height: TSizes.spaceBtwItems),
                  ReadMoreText(
                    'This is a Product description for Blue Nike Sleeve less vest.This is a Product description for Blue Nike Sleeve less vest.This is a Product description for Blue Nike Sleeve less vest',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: ' Show more',
                    trimExpandedText: ' Less',
                    moreStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                    lessStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  ),

                  ///Reviews
                  Divider(),
                  SizedBox(height: TSizes.spaceBtwItems),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MySectionHeading(
                          title: 'Reviews(199)', showActionButton: false),
                      IconButton(
                          icon: Icon(Iconsax.arrow_right_3, size: 18),
                          onPressed: () =>
                              Get.to(() => ProductReviewsScreen())),
                    ],
                  ),
                  SizedBox(height: TSizes.spaceBtwSections),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
