import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecomm/common/widgets/shimmers/shimmer.dart';
import 'package:ecomm/features/shop/screens/brand/brand_products.dart';
import 'package:flutter/material.dart';

import '../../../features/shop/models/brand_model.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../custom_shapes/conatiners/rounded_conatiner.dart';
import 'brand_card.dart';
import 'package:get/get.dart';

class TBrandShowcase extends StatelessWidget {
  const TBrandShowcase({
    super.key,
    required this.images, required this.brand,
  });

  final BrandModel brand;
  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(()=>BrandProducts(brand: brand)),
      child: TRoundedContainer(
        showBorder: true,
        borderColor: TColors.darkGrey,
        backgroundColor: Colors.transparent,
        padding: const EdgeInsets.all(TSizes.md),
        margin: const EdgeInsets.only(bottom: TSizes.spaceBtwSections),
        child: Column(
          children: [
            //brand with products count
            TBrandCard(showBorder: false, brand: brand),
            const SizedBox(height: TSizes.spaceBtwItems) ,
      
            //brand with top 3 product images
            Row(
              children: images.map((image) => brandTopProductImageWidget(image, context)).toList(),
            )
          ],
        ),
      ),
    );
  }
  Widget brandTopProductImageWidget(String image, context){
    return Expanded(
      child: TRoundedContainer(
        height: 100,
        backgroundColor: THelperFunctions.isDarkMode(context) ? TColors.darkerGrey : TColors.light,
        margin: const EdgeInsets.only(right: TSizes.sm),
        padding: const EdgeInsets.all(TSizes.md),
        child:  CachedNetworkImage(
          fit: BoxFit.contain,
          imageUrl: image,
          progressIndicatorBuilder: (context, url, downloadProgress) => const TShimmerEffect(width: 100, height: 100),
          errorWidget: (context, url,error) => const Icon(Icons.error),
        ),
      ),
    );
  }
}

