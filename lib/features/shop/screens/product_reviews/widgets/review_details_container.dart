import 'package:ecomm/common/widgets/custom_shapes/conatiners/rounded_conatiner.dart';
import 'package:ecomm/common/widgets/products/ratings/ratings_indicator.dart';
import 'package:ecomm/utils/constants/image_strings.dart';
import 'package:ecomm/utils/constants/sizes.dart';
import 'package:ecomm/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

import '../../../../../utils/constants/colors.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const CircleAvatar(backgroundImage: AssetImage(TImages.userProfile1),),
                const SizedBox(width: TSizes.spaceBtwItems,),
                Text("John Dob", style: Theme.of(context).textTheme.titleLarge,),
              ],
            ),
            IconButton(onPressed: (){}, icon: const Icon(Icons.more_vert)),
            ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems,),
        Row(
          children: [
            const TRatingBarIndicator(rating: 4),
            const SizedBox(width: TSizes.spaceBtwItems,),
            Text("01 Nov 2023", style: Theme.of(context).textTheme.bodyMedium,),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems,),
        const ReadMoreText(
          'Good User interface loreum ipsum Good User interface loreum ipsum Good User interface loreum ipsum Good User interface loreum ipsum Good User interface loreum ipsum ',
          trimLines: 2,
          trimMode: TrimMode.Line,
          trimExpandedText: " show less",
          trimCollapsedText: " show more",
          moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: TColors.primary),
          lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: TColors.primary),
        ),

        const SizedBox(height: TSizes.spaceBtwItems,),
        TRoundedContainer(
          backgroundColor: dark? TColors.darkerGrey: TColors.grey,
          child: Padding(
            padding: const EdgeInsets.all(TSizes.md),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("EComm", style: Theme.of(context).textTheme.titleMedium),
                    Text("02 Nov 2023", style: Theme.of(context).textTheme.bodyMedium,),

                  ],
                ),
                const SizedBox(height: TSizes.spaceBtwItems,),
                const ReadMoreText(
                  'Good User interface loreum ipsum Good User Good User interface loreum ipsum Good User Good User interface loreum ipsum Good User Good User interface loreum ipsum Good User',
                  trimLines: 2,
                  trimMode: TrimMode.Line,
                  trimExpandedText: " show less",
                  trimCollapsedText: " show more",
                  moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: TColors.primary),
                  lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: TColors.primary),
                ),

              ],
            ),
          ),

        ),
        const SizedBox(height: TSizes.spaceBtwSections,),
      ],
    );
  }
}
