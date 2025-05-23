import 'package:deal_nest/features/personalization/screens/address/widgets/single_address.dart';
import 'package:deal_nest/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../utils/constants/colors.dart';
import 'add_new_address.dart';

class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: TColors.primary,
        onPressed: () => Get.to(() => AddNewAddressScreen()),
        child: Icon(Iconsax.add, color: TColors.white),
      ),
      appBar: MyAppBar(
        showBackArrow: true,
        title:
            Text('Address', style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              MySingleAddress(selectedAddress: true),
              MySingleAddress(selectedAddress: false),
            ],
          ),
        ),
      ),
    );
  }
}
