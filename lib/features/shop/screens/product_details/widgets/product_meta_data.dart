import 'package:ecomm/common/widgets/images/t_circular_image.dart';
import 'package:ecomm/common/widgets/texts/product_price_text.dart';
import 'package:ecomm/common/widgets/texts/t_brand_title_text_with_verified_icon.dart';
import 'package:ecomm/utils/constants/enums.dart';
import 'package:ecomm/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widgets/custom_shapes/conatiners/rounded_conatiner.dart';
import '../../../../../common/widgets/images/t_rounded_image.dart';
import '../../../../../common/widgets/texts/product_title_text.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../controllers/product/product_controller.dart';
import '../../../models/product_model.dart';

class TProductMetaData extends StatelessWidget {
  const TProductMetaData({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final controller = ProductController. instance;
    final salePercentage = controller.calculateSalePercentage(product.price, product.salePrice);
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:  [
        Row(
          children: [
            if(salePercentage !=null)
            TRoundedContainer(
              radius: TSizes.sm,
              backgroundColor: TColors.secondary.withOpacity(0.8),
              padding: const EdgeInsets.symmetric(horizontal: TSizes.sm, vertical: TSizes.xs),
              child: Text('$salePercentage%', style: Theme.of(context).textTheme.labelLarge!.apply(color: TColors.black),),
            ),
            if(salePercentage !=null)
            const SizedBox(width: TSizes.spaceBtwItems,),

            if(product.productType == ProductType.single.toString() && product.salePrice > 0)
              Text('\$${product.price}', style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough),),
            if(product.productType == ProductType.single.toString() && product.salePrice > 0)
              const SizedBox(width: TSizes.spaceBtwItems,),
            TProductPriceText(price: controller.getProductPrice(product), isLarge: true,),
          ],

        ),
        const SizedBox(height: TSizes.spaceBtwItems/1.5),

        TProductTitleText(title: product.title,),
        const SizedBox(height: TSizes.spaceBtwItems/1.5),

        Row(
          children: [
            const TProductTitleText(title: 'Status',),
            const SizedBox(width: TSizes.spaceBtwItems/1.5),
            Text(controller.getProductStockStatus(product.stock), style: Theme.of(context).textTheme.titleMedium,),
          ]
        ),
        const SizedBox(height: TSizes.spaceBtwItems/1.5),
        
        Row(
          children: [
            TRoundedImage(
              height: 32,
              width: 32,
              isNetworkImage: true,
              backgroundColor: dark ? TColors.dark : TColors.white,
              padding: const EdgeInsets.all(TSizes.sm),
              imageUrl: product.brand!=null? product.brand!.image : '',
            ),
            // TCircularImage(
            //   isNetworkImage: true,
            //   image: product.brand!=null? product.brand!.image : '',
            //   width: 32,
            //   height: 32,
            //   overlayColor: dark? TColors.white: TColors.black,
            // ),
            TBrandTitleWithVerifiedIcon(title: product.brand!=null? product.brand!.name : '', brandTextSize: TextSizes.medium,),
          ],
        )

      ],
    );
  }
}
