import 'package:deal_nest/common/widgets/appbar/appbar.dart';
import 'package:deal_nest/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:deal_nest/utils/constants/colors.dart';
import 'package:deal_nest/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../common/widgets/products/cart/cart_menu_icon.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ///header
            MyPrimaryHeaderContainer(
              child: Column(
                children: [
                  MyHomeAppBar(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
