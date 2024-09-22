import 'package:ecomm/features/authentication/screens/password_confirmation/reset_password.dart';
import 'package:flutter/material.dart';
import 'package:ecomm/utils/constants/sizes.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/text_strings.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Headings
            Text(TTexts.forgetPasswordTitle, style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: TSizes.spaceBtwItems),
            Text(TTexts.forgetPasswordSubTitle, style: Theme.of(context).textTheme.labelMedium),
            const SizedBox(height: TSizes.spaceBtwSections * 2),

            //Text field
            TextFormField(
              decoration: const InputDecoration(
                labelText: TTexts.email, prefixIcon: Icon(Iconsax.direct_right),
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwSections),

            //Submit Button
            SizedBox(width: double.infinity,child: ElevatedButton(onPressed: () => Get.off(()=> const ResetPassword()), child: const Text(TTexts.submit))),
          ],
        ),
      ),
    );
  }
}
