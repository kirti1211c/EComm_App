import 'package:flutter/material.dart';

import '../../../features/shop/models/brand_model.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/enums.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../custom_shapes/conatiners/rounded_conatiner.dart';
import '../images/t_circular_image.dart';
import '../images/t_rounded_image.dart';
import '../texts/t_brand_title_text_with_verified_icon.dart';

class TBrandCard extends StatelessWidget {
  const TBrandCard({
    super.key, this.showBorder = true, this.onTap, required this.brand,
  });

  final BrandModel brand;
  final bool showBorder;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: TRoundedContainer(
        padding: const EdgeInsets.all(TSizes.sm),
        showBorder: showBorder,
        backgroundColor: Colors.transparent,
        child: Row(
          children: [
            //Icon
            Flexible(
              child: TRoundedImage(
                width: 80,
                isNetworkImage: true,
                backgroundColor: Colors.transparent,
                padding: const EdgeInsets.all(TSizes.sm),
                imageUrl: brand.image,
              ),
              // child: TCircularImage(
              //   image: brand.image,
              //   isNetworkImage: true,
              //   backgroundColor: Colors.transparent,
              //   overlayColor: THelperFunctions.isDarkMode(context) ? TColors.white : TColors.black,
              // ),
            ),
            const SizedBox(width: TSizes.spaceBtwItems / 2,),

            //Text
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TBrandTitleWithVerifiedIcon(title: brand.name, brandTextSize: TextSizes.large,),
                  Text(
                    '${brand.productsCount ?? 0} products',
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelMedium,
                  )
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}