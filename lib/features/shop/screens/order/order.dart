import 'package:deal_nest/common/widgets/appbar/appbar.dart';
import 'package:deal_nest/features/shop/screens/order/widgets/order_list.dart';
import 'package:deal_nest/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///Appbar
      appBar: MyAppBar(
          title: Text('My Orders',
              style: Theme.of(context).textTheme.headlineSmall)),
      body: Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),

        ///Orders
        child: MyOrderListItems(),
      ),
    );
  }
}
