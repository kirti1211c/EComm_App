import 'package:ecomm/common/widgets/appbar/appbar.dart';
import 'package:ecomm/common/widgets/custom_shapes/conatiners/rounded_conatiner.dart';
import 'package:ecomm/features/personalization/screens/address/widgets/single_address.dart';
import 'package:ecomm/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import 'add_new_address.dart';

class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(const AddNewAddressScreen()),
        backgroundColor: TColors.primary,
        child: const Icon(Iconsax.add, color: TColors.white),
      ),
      appBar: TAppBar(
        showBackArrow: true,
        title: Text("Address", style: Theme.of(context).textTheme.headlineSmall,),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              TSingleAddress(selectedAddress: true),
              TSingleAddress(selectedAddress: false)
            ],
          ),
        ),
      ),
    );
  }
}
