import 'package:ecomm/features/shop/controllers/product/cart_controller.dart';
import 'package:ecomm/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../features/shop/screens/cart/cart.dart';
import '../../../../utils/constants/colors.dart';
import 'package:get/get.dart';

class TCartCounterIcon extends StatelessWidget {
  const TCartCounterIcon({
    super.key,  this.iconColor,
  });


  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CartController());
    final dark = THelperFunctions.isDarkMode(context);
    return Stack(
      children: [
        IconButton(onPressed: ()=> Get.to(()=> const CartScreen()), icon: const Icon(Iconsax.shopping_bag), color: iconColor ?? (dark? TColors.light : TColors.dark),),
        Positioned(
          right: 0,
          child: Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
              color: iconColor ?? (dark? TColors.light : TColors.dark),
              borderRadius: BorderRadius.circular(100),
            ),
            child: Center(
              child: Obx(()=> Text(controller.noOfCartItems.toString(), style: Theme.of(context).textTheme.labelLarge!.apply(color: iconColor==null ? dark? TColors.dark : TColors.light : TColors.dark, fontSizeFactor: 0.8, fontWeightDelta: 3),)),
            ),
          ),
        ),
      ],
    );
  }
}

