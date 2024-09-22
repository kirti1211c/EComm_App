import 'package:ecomm/common/widgets/appbar/appbar.dart';
import 'package:ecomm/common/widgets/icons/t_circular_icon.dart';
import 'package:ecomm/common/widgets/images/t_rounded_image.dart';
import 'package:ecomm/common/widgets/texts/product_price_text.dart';
import 'package:ecomm/common/widgets/texts/product_title_text.dart';
import 'package:ecomm/common/widgets/texts/t_brand_title_text_with_verified_icon.dart';
import 'package:ecomm/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:ecomm/features/shop/screens/checkout/checkout.dart';
import 'package:ecomm/utils/constants/sizes.dart';
import 'package:ecomm/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/products/cart/add_remove_button.dart';
import '../../../../common/widgets/products/cart/cart_item.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return  Scaffold(
      appBar: TAppBar(title: Text("Cart", style: Theme.of(context).textTheme.headlineSmall,),showBackArrow: true,),
      body: const Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        child: TCartItems(),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(onPressed: () => Get.to(()=> const CheckoutScreen()), child: const Text("Checkout \$256.0")),
      ),
    );
  }
}

