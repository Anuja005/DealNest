import 'package:deal_nest/common/widgets/appbar/appbar.dart';
import 'package:deal_nest/common/widgets/images/my_circular_image.dart';
import 'package:deal_nest/common/widgets/texts/section_heading.dart';
import 'package:deal_nest/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:deal_nest/utils/constants/image_strings.dart';
import 'package:deal_nest/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(showBackArrow: true, title: Text('Profile')),

      ///Body
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              ///Profile Picture
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    MyCircularImage(image: TImages.user, width: 80, height: 80),
                    TextButton(
                        onPressed: () {},
                        child: Text('Change Profile Picture')),
                  ],
                ),
              ),

              ///Details
              SizedBox(height: TSizes.spaceBtwItems / 2),
              Divider(),
              SizedBox(height: TSizes.spaceBtwItems),
              MySectionHeading(
                  title: 'Profile Information', showActionButton: false),
              SizedBox(height: TSizes.spaceBtwItems),

              MyProfileMenu(
                  title: 'Name', value: 'Anuja Rashmika', onPressed: () {}),
              MyProfileMenu(
                  title: 'Username', value: 'anuja_rashmika', onPressed: () {}),

              SizedBox(height: TSizes.spaceBtwItems),
              Divider(),
              SizedBox(height: TSizes.spaceBtwItems),

              ///Heading Personal Info
              MySectionHeading(
                  title: 'Personal Information', showActionButton: false),
              SizedBox(height: TSizes.spaceBtwItems),

              MyProfileMenu(
                  title: 'User ID',
                  value: '45987',
                  icon: Iconsax.copy,
                  onPressed: () {}),
              MyProfileMenu(
                  title: 'E-mail', value: 'anuja@gmail.com', onPressed: () {}),
              MyProfileMenu(
                  title: 'Phone Number', value: '0773480439', onPressed: () {}),
              MyProfileMenu(title: 'Gender', value: 'Male', onPressed: () {}),
              MyProfileMenu(
                  title: 'Date of Birth',
                  value: '24 Feb, 2005',
                  onPressed: () {}),
              Divider(),
              SizedBox(height: TSizes.spaceBtwItems),

              Center(
                child: TextButton(
                  onPressed: () {},
                  child: Text('Close Account',
                      style: TextStyle(color: Colors.red)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
