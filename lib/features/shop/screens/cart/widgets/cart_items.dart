import 'package:ecomm/features/shop/controllers/product/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../../../common/widgets/products/cart/add_remove_button.dart';
import '../../../../../common/widgets/products/cart/cart_item.dart';
import '../../../../../common/widgets/texts/product_price_text.dart';
import '../../../../../utils/constants/sizes.dart';

class TCartItems extends StatelessWidget {
  const TCartItems({
    super.key,  this.showAddRemoveButtons = true, this.neverScroll=false,
  });

  final bool showAddRemoveButtons;
  final bool? neverScroll;

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    return Obx(
      ()=> ListView.separated(
        shrinkWrap: true,
        separatorBuilder: (_,__) => const SizedBox(height: TSizes.defaultSpace),
        itemCount: cartController.cartItems.length,
        physics: neverScroll==true ? const NeverScrollableScrollPhysics() : const AlwaysScrollableScrollPhysics(),
        itemBuilder:(_, index) =>  Obx(
            () {
              final item =cartController.cartItems[index];
              return Column(
                children: [
                  TCartItem(cartItem: item,),
                  if(showAddRemoveButtons) const SizedBox(height: TSizes.spaceBtwItems,),
                  if(showAddRemoveButtons)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const SizedBox(width: 70,),
                            TProductQuantityWithAddAndRemoveButton(
                              quantity: item.quantity,
                              add: ()=> cartController.addOneToCart(item),
                              remove: ()=> cartController.removeOneFromCart(item),
                            ),
                          ],
                        ),
                        TProductPriceText(price: (item.price*item.quantity).toStringAsFixed(1)),
                      ],
                    )
                ],
              );
            }
        ),
      ),
    );
  }
}


