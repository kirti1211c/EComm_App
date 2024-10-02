import 'package:ecomm/common/widgets/appbar/appbar.dart';
import 'package:ecomm/features/shop/controllers/product/cart_controller.dart';
import 'package:ecomm/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:ecomm/features/shop/screens/checkout/checkout.dart';
import 'package:ecomm/utils/constants/sizes.dart';
import 'package:ecomm/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/loaders/animation_loader.dart';

import '../../../../navigation_menu.dart';

import '../../../../utils/constants/image_strings.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final controller = CartController.instance;
    return  Scaffold(
      appBar: TAppBar(title: Text("Cart", style: Theme.of(context).textTheme.headlineSmall,),showBackArrow: true,),
      body: Obx(
       (){

         final emptyWidget = TAnimationLoaderWidget(
           text: 'Whoops! Cart is EMPTY.',
           animation: TImages.nothing,
           showAction: true,
           actionText: 'Let\'s fill it',
           onActionPressed: () => Get.off(() => const NavigationMenu()),
         );

         if (controller.cartItems.isEmpty) {
           return emptyWidget;
         } else {
           return const SingleChildScrollView(
             child: Padding(
               padding: EdgeInsets.all(TSizes.defaultSpace),
               child: TCartItems(),
             ),
           );
         }


       }
      ),
      bottomNavigationBar: Obx(
          (){
            if(controller.cartItems.isEmpty) return const SizedBox();
            return Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: ElevatedButton(
                  onPressed: () => Get.to(()=> const CheckoutScreen()),
                  child: Obx(()=> Text('Checkout \$${controller.totalCartPrice.value}'))
              ),
            );
          }
      )
    );
  }
}

