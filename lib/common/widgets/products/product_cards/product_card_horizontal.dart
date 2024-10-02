import 'package:ecomm/common/widgets/custom_shapes/conatiners/rounded_conatiner.dart';
import 'package:ecomm/common/widgets/images/t_rounded_image.dart';
import 'package:ecomm/common/widgets/texts/product_price_text.dart';
import 'package:ecomm/common/widgets/texts/product_title_text.dart';
import 'package:ecomm/common/widgets/texts/t_brand_title_text_with_verified_icon.dart';
import 'package:ecomm/features/shop/models/product_model.dart';
import 'package:ecomm/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../features/shop/controllers/product/product_controller.dart';
import '../../../../features/shop/screens/product_details/product_details.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/enums.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../../styles/shadows.dart';
import '../../icons/t_circular_icon.dart';
import '../favourite_icon/favourite_icon.dart';
import 'add_to_cart_button.dart';
import 'package:get/get.dart';

class TProductCardHorizontal extends StatelessWidget {
  const TProductCardHorizontal({super.key, required this.product});

  final ProductModel product;


  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final salePercentage = controller.calculateSalePercentage(product.price, product.salePrice);

    final dark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () => Get.to(()=>  ProductDetailScreen(product: product,)),
      child: Container(
        width: 310,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          // boxShadow: [TShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(TSizes.productImageRadius),
          color: dark ? TColors.darkerGrey : TColors.softGrey,
        ),
        child: Row(
          children: [
            TRoundedContainer(
              height: 120,
              padding: const EdgeInsets.all(TSizes.sm),
              backgroundColor: dark? TColors.dark: TColors.light,
              child: Stack(
                children: [
                   SizedBox(
                    height:120,
                    width:120,
                    child: TRoundedImage(imageUrl: product.thumbnail,applyImageRadius: true,isNetworkImage: true,)
                  ),

                  if(salePercentage !=null)
                  Positioned(
                    top: 12,
                    child: TRoundedContainer(
                      radius: TSizes.sm,
                      backgroundColor: TColors.secondary.withOpacity(0.8),
                      padding: const EdgeInsets.symmetric(horizontal: TSizes.sm, vertical: TSizes.xs),
                      child: Text('$salePercentage%', style: Theme.of(context).textTheme.labelLarge!.apply(color: TColors.black),),
                    ),
                  ),

                  //Fav Icon
                    Positioned(
                      top: 0,
                      right: 0,
                      child: TFavouriteIcon(productId: product.id),
                  ),


                ],
              ),
            ),

            //Details
            SizedBox(
              width: 172,
              child: Padding(
                padding: const EdgeInsets.only(top: TSizes.sm, left: TSizes.sm),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TProductTitleText(title: product.title, smallSize: true,),
                        const SizedBox(height: TSizes.spaceBtwItems/2),
                        TBrandTitleWithVerifiedIcon(title: product.brand!.name),
                      ],
                    ),

                    // SizedBox(height: TSizes.spaceBtwItems/2),
                    const Spacer(),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        Flexible(
                          child: Column(
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (product.productType == ProductType.single.toString() && product.salePrice > 0)
                               Padding(
                                 padding: const EdgeInsets.all(0),
                                // padding: const EdgeInsets.only(left: TSizes.sm),
                                child: Text(
                                  product.price.toString(),
                                  style: Theme.of(context).textTheme.labelMedium!.apply(decoration: TextDecoration.lineThrough),
                                ),
                              ),


                              Padding(
                                padding: const EdgeInsets.all(0),
                                // padding: const EdgeInsets.only(left: TSizes.sm),
                                child: TProductPriceText(price: controller.getProductPrice(product)),
                              ),
                            ],
                          )
                        ),

                        ProductCardAddToCartButton(product: product),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
