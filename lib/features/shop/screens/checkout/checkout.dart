import 'package:ecomm/common/widgets/custom_shapes/conatiners/rounded_conatiner.dart';
import 'package:ecomm/features/shop/controllers/product/cart_controller.dart';
import 'package:ecomm/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:ecomm/features/shop/screens/checkout/widgets/billing_address_section.dart';
import 'package:ecomm/features/shop/screens/checkout/widgets/billing_amount_section.dart';
import 'package:ecomm/features/shop/screens/checkout/widgets/billing_payment_section.dart';
import 'package:ecomm/navigation_menu.dart';
import 'package:ecomm/utils/constants/image_strings.dart';
import 'package:ecomm/utils/constants/sizes.dart';
import 'package:ecomm/utils/helpers/pricing_calculator.dart';
import 'package:ecomm/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/products/cart/coupon_widget.dart';
import '../../../../common/widgets/success_screen/success_screen.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../controllers/order_controller.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    final subTotal = cartController.totalCartPrice.value;
    final totalAmount = TPricingCalculator.calculateTotalPrice(subTotal, "US");

    final orderController = Get.put(OrderController());

    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: TAppBar(title: Text("Order Review", style: Theme.of(context).textTheme.headlineSmall,),showBackArrow: true,),
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              const TCartItems(showAddRemoveButtons: false, neverScroll: true,),
              const SizedBox(height: TSizes.spaceBtwSections,),

              const TCouponCode(),
              const SizedBox(height: TSizes.spaceBtwSections,),

              TRoundedContainer(
                padding: const EdgeInsets.all(TSizes.md),
                showBorder: true,
                backgroundColor: dark? TColors.black: TColors.white,
                child: const Column(
                  children: [
                    TBillingAmountSection(),
                    SizedBox(height: TSizes.spaceBtwItems,),

                    Divider(),
                    SizedBox(height: TSizes.spaceBtwItems,),

                    TBillingPaymentSection(),
                    SizedBox(height: TSizes.spaceBtwItems,),

                    TBillingAddressSection(),

                  ],
                ),
              ),

            ],
          ),
        ),
      ),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(
            onPressed: subTotal>0
            ? ()=> orderController.processOrder(totalAmount)
            : ()=> TLoaders.warningSnackBar(title: "Empty Cart", message: "Add items in the card in order to proceed"),
            child:  Text("Checkout \$$totalAmount")),
      ),
    );
  }
}

