import 'package:ecomm/common/widgets/appbar/appbar.dart';
import 'package:ecomm/common/widgets/icons/t_circular_icon.dart';
import 'package:ecomm/common/widgets/layouts/grid_layout.dart';
import 'package:ecomm/common/widgets/loaders/animation_loader.dart';
import 'package:ecomm/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:ecomm/features/shop/controllers/product/favourites_controller.dart';
import 'package:ecomm/features/shop/models/product_model.dart';
import 'package:ecomm/features/shop/screens/home/home.dart';
import 'package:ecomm/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/shimmers/vertical_product_shimmer.dart';
import '../../../../navigation_menu.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/helpers/cloud_helper_functions.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = FavouritesController.instance;
    return Scaffold(
      appBar: TAppBar(
        title: Text("Wishlist", style: Theme.of(context).textTheme.headlineMedium,),
        actions: [
          TCircularIcon(icon: Iconsax.add, onPressed: () => Get.offAll(const NavigationMenu()),)
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Obx(
            ()=> FutureBuilder(
              future: controller.favoriteProducts(),
              builder: (context, snapshot) {
            
                final emptyWidget= TAnimationLoaderWidget(
                  text: 'Whoops! Wishlist is Empty...' ,
                  animation: TImages.nothing,
                  showAction: true,
                  actionText: 'Let\'s add some',
                  onActionPressed: () => Get.offAll(() => const NavigationMenu()),
                );
            
                const loader = TVerticalProductShimmer(itemCount: 6);
                final widget = TCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader, nothingFound: emptyWidget);
                if (widget != null) return widget;
            
                final products = snapshot.data!;
            
                return TGridLayout(
                  itemCount: products.length,
                  itemBuilder: (_, index) => TProductCardVertical(product: products[index],)
                );
              }
            ),
          ),
        ),
      ),
    );
  }
}
