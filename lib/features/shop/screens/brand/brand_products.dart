import 'package:deal_nest/common/widgets/appbar/appbar.dart';
import 'package:deal_nest/common/widgets/brand/brand_card.dart';
import 'package:deal_nest/common/widgets/products/sortable/sortable_products.dart';
import 'package:deal_nest/features/shop/controllers/brand_controller.dart';
import 'package:deal_nest/features/shop/models/brand_model.dart';
import 'package:deal_nest/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/shimmer/vertical_product_shimmer.dart';
import '../../../../utils/helpers/cloud_helper_functions.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key, required this.brand});

  final BrandModel brand;

  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    return Scaffold(
      appBar: MyAppBar(title: Text(brand.name)),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              ///Brand Detail
              MyBrandCard(showBorder: true, brand: brand),
              SizedBox(height: TSizes.spaceBtwSections),

              FutureBuilder(
                  future: controller.getBrandProducts(brand.id),
                  builder: (context, snapshot) {
                    /// Handle Loader, No Record, OR Error Message
                    const loader = MyVerticalProductShimmer();
                    final widget = TCloudHelperFunctions.checkMultiRecordState(
                        snapshot: snapshot, loader: loader);
                    if (widget != null) return widget;

                    ///Record Found
                    final brandProducts = snapshot.data!;
                    return MySortableProducts(products: brandProducts);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
