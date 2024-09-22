import 'package:ecomm/common/widgets/appbar/appbar.dart';
import 'package:ecomm/features/shop/screens/product_reviews/widgets/progress_indicator_and_rating.dart';
import 'package:ecomm/features/shop/screens/product_reviews/widgets/rating_progress_indicator.dart';
import 'package:ecomm/features/shop/screens/product_reviews/widgets/review_details_container.dart';
import 'package:ecomm/utils/constants/colors.dart';
import 'package:ecomm/utils/constants/sizes.dart';
import 'package:ecomm/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/products/ratings/ratings_indicator.dart';

class ProductReviewsScreen extends StatelessWidget {
  const ProductReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(title: Text("Reviews & Ratings"),showBackArrow: true,),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Ratings and reviews are verified and are from people who use the same type of device that you use."),
              const SizedBox(height: TSizes.spaceBtwItems,),

              const TOverallProductRating(),
              const SizedBox(height: TSizes.spaceBtwItems,),
              const TRatingBarIndicator(rating: 4.5,),

              Text('12,611', style: Theme.of(context).textTheme.bodySmall,),
              const SizedBox(height: TSizes.spaceBtwSections,),

              const UserReviewCard(),
              const UserReviewCard(),
              const UserReviewCard(),
              const UserReviewCard(),


            ],
          ),
        ),
      ),
    );
  }
}

