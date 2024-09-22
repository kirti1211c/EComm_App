import 'package:ecomm/common/widgets/custom_shapes/conatiners/rounded_conatiner.dart';
import 'package:ecomm/common/widgets/images/t_rounded_image.dart';
import 'package:ecomm/common/widgets/texts/product_price_text.dart';
import 'package:ecomm/common/widgets/texts/product_title_text.dart';
import 'package:ecomm/common/widgets/texts/t_brand_title_text_with_verified_icon.dart';
import 'package:ecomm/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../../styles/shadows.dart';
import '../../icons/t_circular_icon.dart';

class TProductCardHorizontal extends StatelessWidget {
  const TProductCardHorizontal({super.key});

  get dark => null;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Container(
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
                const SizedBox(
                  height:120,
                  width:120,
                  child: TRoundedImage(imageUrl: TImages.productImage1,applyImageRadius: true,)
                ),

                Positioned(
                  top: 12,
                  child: TRoundedContainer(
                    radius: TSizes.sm,
                    backgroundColor: TColors.secondary.withOpacity(0.8),
                    padding: const EdgeInsets.symmetric(horizontal: TSizes.sm, vertical: TSizes.xs),
                    child: Text('25%', style: Theme.of(context).textTheme.labelLarge!.apply(color: TColors.black),),
                  ),
                ),

                //Fav Icon
                const Positioned(
                    top: 0,
                    right: 0,
                    child: TCircularIcon(icon: Iconsax.heart5, color: Colors.red,)
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
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TProductTitleText(title: "Green Jordon Shoes", smallSize: true,),
                      SizedBox(height: TSizes.spaceBtwItems/2),
                      TBrandTitleWithVerifiedIcon(title: "Nike"),
                    ],
                  ),

                  // SizedBox(height: TSizes.spaceBtwItems/2),
                  const Spacer(),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      const Flexible(
                        child: Padding(
                          padding: EdgeInsets.only(left: TSizes.md),
                          child: TProductPriceText(price: '250.0'),
                        )
                      ),

                      Container(
                        decoration: const BoxDecoration(
                          color: TColors.dark,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(TSizes.cardRadiusMd),
                            bottomRight: Radius.circular(TSizes.productImageRadius),
                          ),
                        ),
                        child: const SizedBox(
                            width: TSizes.iconLg * 1.2,
                            height: TSizes.iconLg * 1.2,
                            child: Center(child: Icon(Iconsax.add, color: TColors.white,))
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
