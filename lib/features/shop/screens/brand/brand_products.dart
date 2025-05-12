import 'package:deal_nest/common/widgets/appbar/appbar.dart';
import 'package:deal_nest/common/widgets/brand/brand_card.dart';
import 'package:deal_nest/common/widgets/products/sortable/sortable_products.dart';
import 'package:deal_nest/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: Text('Nike')),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              ///Brand Detail
              MyBrandCard(showBorder: true),
              SizedBox(height: TSizes.spaceBtwSections),

              MySortableProducts(products: []),
            ],
          ),
        ),
      ),
    );
  }
}
