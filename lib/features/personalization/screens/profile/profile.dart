import 'package:ecomm/common/widgets/appbar/appbar.dart';
import 'package:ecomm/common/widgets/images/t_circular_image.dart';
import 'package:ecomm/common/widgets/texts/section_heading.dart';
import 'package:ecomm/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:ecomm/utils/constants/image_strings.dart';
import 'package:ecomm/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(
        showBackArrow: true,
        title: Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              //profile picture
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    const TCircularImage(image: TImages.user, width: 80, height: 80,),
                    TextButton(onPressed: (){}, child: const Text('Change Profile Picture')),
                  ],
                ),
              ),

              //Details
              const SizedBox(height: TSizes.spaceBtwItems / 2),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),

              const TSectionHeading(title: "Profile Information", showActionButton: false,),
              const SizedBox(height: TSizes.spaceBtwItems),

              TProfileMenu(onPressed: () {}, title: 'Name', value: 'Kirti',),
              TProfileMenu(onPressed: () {}, title: 'Username', value: 'kirti',),

              const SizedBox(height: TSizes.spaceBtwItems),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),

              const TSectionHeading(title: "Personal Information", showActionButton: false,),
              const SizedBox(height: TSizes.spaceBtwItems),

              TProfileMenu(onPressed: () {}, title: 'User ID', value: '12345', icon: Iconsax.copy,),
              TProfileMenu(onPressed: () {}, title: 'E-mail', value: 'kirti@gmail.com',),
              TProfileMenu(onPressed: () {}, title: 'Phone number', value: '9999026036',),
              TProfileMenu(onPressed: () {}, title: 'Gender', value: 'Female',),
              TProfileMenu(onPressed: () {}, title: 'Date of Birth', value: '12th Nov 2003',),

              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),

              Center(
                child: TextButton(onPressed: (){}, child: const Text('Close Account', style: TextStyle(color: Colors.red),)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

