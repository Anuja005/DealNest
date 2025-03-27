import 'package:deal_nest/utils/constants/colors.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widgets/custom_shapes/containers/circular_container.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: TColors.primary,
              padding: EdgeInsets.all(0),
              child: Stack(
                children: [
                  MyCircularContainer(
                      backgroundColor: TColors.textWhite.withOpacity(0.1)),
                  MyCircularContainer(
                      backgroundColor: TColors.textWhite.withOpacity(0.1)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
