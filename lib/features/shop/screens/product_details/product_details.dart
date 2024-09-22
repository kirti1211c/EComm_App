import 'package:ecomm/common/widgets/texts/section_heading.dart';
import 'package:ecomm/features/shop/screens/product_details/widgets/bottom_add_to_cart_widget.dart';
import 'package:ecomm/features/shop/screens/product_details/widgets/product_attribute.dart';
import 'package:ecomm/features/shop/screens/product_details/widgets/product_detail_image_slider.dart';
import 'package:ecomm/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:ecomm/features/shop/screens/product_details/widgets/rating_share_widget.dart';
import 'package:ecomm/features/shop/screens/product_reviews/product_reviews.dart';
import 'package:ecomm/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      bottomNavigationBar: TBottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 1 - Product Image Slider
            const TProductImageSlider(),
            // 2 - Product Details
            Padding(
              padding: const EdgeInsets.only(bottom: TSizes.defaultSpace, left: TSizes.defaultSpace, right: TSizes.defaultSpace),
              child: Column(
                children: [
                  //Rating & Share Button
                  const TRatingAndSharing(),

                  //Price, Title, Stock & Brand
                  const TProductMetaData(),

                  //Attributes
                  const ProductAttributes(),
                  const SizedBox(height: TSizes.spaceBtwSections,),
                  
                  //Checkout Button
                  SizedBox(width:double.infinity,child: ElevatedButton(onPressed: (){}, child: const Text("Checkout"))),
                  const SizedBox(height: TSizes.spaceBtwSections,),

                  //Description
                  TSectionHeading(title: "Description", showActionButton: false,),
                  const SizedBox(height: TSizes.spaceBtwItems,),
                  ReadMoreText(
                      "Product Description lorem ipsum Product Description lorem ipsum Product Description lorem ipsum Product Description lorem ipsum Product Description lorem ipsum Product Description lorem ipsum ",
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: " Show More",
                    trimExpandedText: " Less",
                    moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                    lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  ),

                  //Reviews
                  const Divider(),
                  const SizedBox(height: TSizes.spaceBtwItems,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TSectionHeading(title: 'Reviews (199)', showActionButton: false,),
                      IconButton(onPressed: ()=> Get.to(() => ProductReviewsScreen()) , icon: Icon(Iconsax.arrow_right_3, size: 18,))
                    ],
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections,),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

