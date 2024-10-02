import 'package:ecomm/common/widgets/custom_shapes/conatiners/rounded_conatiner.dart';
import 'package:ecomm/features/shop/controllers/order_controller.dart';
import 'package:ecomm/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/loaders/animation_loader.dart';
import '../../../../../navigation_menu.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/helpers/cloud_helper_functions.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class TOrderListItems extends StatelessWidget {
  const TOrderListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OrderController());
    final dark = THelperFunctions.isDarkMode(context);
    return FutureBuilder(
      future: controller.fetchUserOrders(),
      builder: (_, snapshot) {

        final emptyWidget = TAnimationLoaderWidget(
            text: 'Whoops! No Orders Yet!',
            animation: TImages.nothing,
            showAction: true,
            actionText: 'Let\'s fill it',
            onActionPressed: ()=> Get.off(()=> const NavigationMenu()),
        );

        final response = TCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, nothingFound: emptyWidget);
        if (response != null) return response;

        final orders = snapshot.data!;

        return ListView.separated(
          shrinkWrap: true,
          itemCount: orders.length,
          separatorBuilder: (_, __) => const SizedBox(height: TSizes.spaceBtwItems,),
          itemBuilder: (_, index) {
            final order = orders[index];
            return TRoundedContainer(

            padding: const EdgeInsets.all(TSizes.md),
            showBorder: true,
            backgroundColor: dark? TColors.dark : TColors.light,
            child:  Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    const Icon(Iconsax.ship),
                    const SizedBox(width: TSizes.spaceBtwItems/2,),

                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            order.orderStatusText,
                            style: Theme.of(context).textTheme.bodyLarge!.apply(color: TColors.primary, fontWeightDelta: 1),
                          ),
                          Text(order.formattedOrderDate, style: Theme.of(context).textTheme.headlineSmall),
                        ],
                      ),
                    ),
                    IconButton(onPressed: (){}, icon: const Icon(Iconsax.arrow_right_34,size: TSizes.iconSm,))

                  ],
                ),

                const SizedBox(height: TSizes.spaceBtwItems,),

                Row(
                    children:[
                      Expanded(
                        child: Row(
                          children: [
                            const Icon(Iconsax.tag),
                            const SizedBox(width: TSizes.spaceBtwItems/2,),

                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Order',
                                    style: Theme.of(context).textTheme.labelMedium,
                                  ),
                                  Text(
                                    order.id,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: Theme.of(context).textTheme.titleMedium
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      Expanded(
                        child: Row(
                          children: [
                            const Icon(Iconsax.calendar),
                            const SizedBox(width: TSizes.spaceBtwItems/2,),

                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Shipping Date',
                                    style: Theme.of(context).textTheme.labelMedium,
                                  ),
                                  Text(
                                    order.formattedDeliveryDate,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: Theme.of(context).textTheme.titleMedium
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ]
                )
              ],
            ),
            );
          }
        );
      }
    );
  }
}
