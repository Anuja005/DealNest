import 'package:flutter/material.dart';

import '../../../../../common/widgets/shimmer/shimmer.dart';
import '../../../../../utils/constants/sizes.dart';

class MyCategoryShimmer extends StatelessWidget {
  const MyCategoryShimmer({
    super.key,
    this.itemCount = 6,
  });

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: itemCount,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (_, __) => SizedBox(width: TSizes.spaceBtwItems),
        itemBuilder: (_, __) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///Image
              MyShimmerEffect(width: 55, height: 55, radius: 55),
              SizedBox(height: TSizes.spaceBtwItems / 2),

              /// Text
              MyShimmerEffect(width: 55, height: 8),
            ],
          );
        },
      ),
    );
  }
}
