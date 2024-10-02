import 'package:ecomm/common/widgets/appbar/appbar.dart';
import 'package:ecomm/common/widgets/images/t_circular_image.dart';
import 'package:ecomm/common/widgets/texts/section_heading.dart';
import 'package:ecomm/features/personalization/screens/profile/widgets/change_name.dart';
import 'package:ecomm/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:ecomm/utils/constants/image_strings.dart';
import 'package:ecomm/utils/constants/sizes.dart';
import 'package:ecomm/common/widgets/shimmers/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../controllers/user_controller.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
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
                    Obx((){
                      final networkImage = controller.user.value.profilePicture;
                      final image = networkImage.isNotEmpty?networkImage: TImages.user;
                      return controller.imageUploading.value
                        ? const TShimmerEffect(width: 80, height: 80, radius: 80,)
                        : TCircularImage(image: image, width: 80, height: 80, isNetworkImage: networkImage.isNotEmpty,padding: 0,);
                    }),
                    TextButton(onPressed: () => controller.uploadUserProfilePicture(), child: const Text('Change Profile Picture')),
                  ],
                ),
              ),

              //Details
              const SizedBox(height: TSizes.spaceBtwItems / 2),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),

              const TSectionHeading(title: "Profile Information", showActionButton: false,),
              const SizedBox(height: TSizes.spaceBtwItems),

              TProfileMenu(onPressed: () => Get.to(()=> const ChangeName()), title: 'Name', value: controller.user.value.fullName,),
              TProfileMenu(onPressed: () {}, title: 'Username', value: controller.user.value.username,),

              const SizedBox(height: TSizes.spaceBtwItems),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),

              const TSectionHeading(title: "Personal Information", showActionButton: false,),
              const SizedBox(height: TSizes.spaceBtwItems),

              TProfileMenu(onPressed: () {}, title: 'User ID', value: controller.user.value.id, icon: Iconsax.copy,),
              TProfileMenu(onPressed: () {}, title: 'E-mail', value: controller.user.value.email,),
              TProfileMenu(onPressed: () {}, title: 'Phone number', value: controller.user.value.phoneNumber,),
              TProfileMenu(onPressed: () {}, title: 'Gender', value: 'Female',),
              TProfileMenu(onPressed: () {}, title: 'Date of Birth', value: '12th Nov 2003',),

              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),

              Center(
                child: TextButton(onPressed: () => controller.deleteAccountWarningPopup(), child: const Text('Close Account', style: TextStyle(color: Colors.red),)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

