import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/sizes.dart';

class MyRatingAndShare extends StatelessWidget {
  const MyRatingAndShare({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ///Rating
        Row(
          children: [
            Icon(Iconsax.star5, color: Colors.amber, size: 24),
            SizedBox(width: TSizes.spaceBtwItems / 2),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                      text: '5.0',
                      style: Theme.of(context).textTheme.bodyLarge),
                  TextSpan(text: '(199)'),
                ],
              ),
            ),
          ],
        ),

        ///Share Button
        IconButton(
            onPressed: () {}, icon: Icon(Icons.share, size: TSizes.iconMd))
      ],
    );
  }
}
