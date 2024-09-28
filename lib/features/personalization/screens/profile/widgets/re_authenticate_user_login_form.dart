import 'package:ecomm/common/widgets/appbar/appbar.dart';
import 'package:ecomm/utils/constants/sizes.dart';
import 'package:ecomm/utils/validators/validators.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/text_strings.dart';
import '../../../controllers/user_controller.dart';

class ReAuthLoginForm extends StatelessWidget {
  const ReAuthLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: AppBar(title: const Text("Re-Authenticate User"),),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Form(
            key: controller.reAuthFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: controller.verifyEmail,
                  validator: TValidator.validateEmail,
                  decoration: const InputDecoration(prefixIcon: Icon(Iconsax.direct_right), labelText: TTexts.email),
                ),
                const SizedBox(height: TSizes.spaceBtwInputFields,),

                Obx(
                () => TextFormField(
                  controller: controller.verifyPassword,
                  validator: (value) => TValidator.validateEmptyText("Password",value),
                  obscureText: controller.hidePassword.value,
                  decoration: InputDecoration(
                      labelText: TTexts.password,
                      prefixIcon: const Icon(Iconsax.password_check),
                      suffixIcon: IconButton(
                          onPressed: () => controller.hidePassword.value = !controller.hidePassword.value,
                          icon: Icon(controller.hidePassword.value?  Iconsax.eye_slash : Iconsax.eye)
                      )
                  ),
                ),
                ),
                const SizedBox(height: TSizes.spaceBtwSections),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(onPressed: () => controller.reAuthenticateEmailAndPassword(), child: const Text("Verify")),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
