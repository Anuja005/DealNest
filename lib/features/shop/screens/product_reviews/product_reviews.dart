import 'package:deal_nest/common/widgets/appbar/appbar.dart';
import 'package:deal_nest/features/shop/screens/product_reviews/widgets/rating_progress_indicator.dart';
import 'package:deal_nest/features/shop/screens/product_reviews/widgets/user_review.dart';
import 'package:deal_nest/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/products/ratings/rating_indicator.dart';

class ProductReviewsScreen extends StatelessWidget {
  const ProductReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///Appbar
      appBar: MyAppBar(title: Text('Reviews & Ratings'), showBackArrow: true),

      ///Body
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  "Ratings and reviews are verified and are from people who use the same type of device that you use."),
              SizedBox(height: TSizes.spaceBtwItems),

              ///Overall Product Ratings
              MyOverallProductRating(),
              MyRatingBarIndicator(rating: 3.5),
              Text("12,612", style: Theme.of(context).textTheme.bodySmall),
              SizedBox(height: TSizes.spaceBtwSections),

              ///User Reviews List
              UserReviewCard(),
              UserReviewCard(),
            ],
          ),
        ),
      ),
    );
  }
}
