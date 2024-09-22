import 'package:flutter/material.dart';

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
    return ListView.separated(
      shrinkWrap: true,
      separatorBuilder: (_,__) => const SizedBox(height: TSizes.defaultSpace),
      itemCount: 2,
      physics: neverScroll==true ? const NeverScrollableScrollPhysics() : const AlwaysScrollableScrollPhysics(),
      itemBuilder:(_, index) =>  Column(
        children: [
          const TCartItem(),
          if(showAddRemoveButtons) const SizedBox(height: TSizes.spaceBtwItems,),
          if(showAddRemoveButtons)
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(width: 70,),
                    TProductQuantityWithAddAndRemoveButton(),
                  ],
                ),
                TProductPriceText(price: "256")
              ],
            )
        ],
      ),
    );
  }
}


