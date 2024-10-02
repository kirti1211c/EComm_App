import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecomm/common/widgets/layouts/grid_layout.dart';
import 'package:ecomm/features/shop/controllers/home_controller.dart';
import 'package:ecomm/features/shop/screens/all_products/all_products.dart';
import 'package:ecomm/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:ecomm/features/shop/screens/home/widgets/home_categories.dart';
import 'package:ecomm/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:ecomm/utils/constants/image_strings.dart';
import 'package:ecomm/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/custom_shapes/conatiners/primary_header_conatiner.dart';
import '../../../../common/widgets/custom_shapes/conatiners/search_container.dart';
import '../../../../common/widgets/products/product_cards/product_card_vertical.dart';
import '../../../../common/widgets/shimmers/vertical_product_shimmer.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../controllers/product/product_controller.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const TPrimaryHeaderContainer(
              child: Column(
                children: [
                  //Appbar
                  THomeAppBar(),
                  SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),

                  //Searchbar
                  TSearchContainer(text: 'Search in Store'),
                  SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),

                  //Categories
                  Padding(
                    padding: EdgeInsets.only(left: TSizes.defaultSpace),
                    child: Column(
                      children: [
                        //Heading
                        TSectionHeading(
                          title: 'Popular Categories',
                          showActionButton: false,
                          textColor: Colors.white,
                        ),
                        SizedBox(
                          height: TSizes.spaceBtwItems,
                        ),

                        // Categories
                        THomeCategories(),
                      ],
                    ),
                  ),
                  SizedBox(height: TSizes.spaceBtwSections,),
                ],
              ),
            ),

            //Body
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  //Promo Slider
                  const TPromoSlider(),
                  const SizedBox(height: TSizes.spaceBtwSections,),

                  //Heading
                  TSectionHeading(title: 'Popular Products', onPressed: ()=> Get.to(()=>  AllProducts(
                    title: 'Popular Products',
                    futureMethod: controller.fetchAllFeaturedProducts(),
                  )),
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems,),

                  //Popular Products
                  Obx((){
                    if(controller.isLoading.value) return const TVerticalProductShimmer();
                    if(controller.featuredProducts.isEmpty){
                     return Center(child: Text('No Data Found!', style: Theme.of(context). textTheme.bodyMedium));
                    }
                    return TGridLayout(
                      itemCount: controller.featuredProducts.length,
                      itemBuilder: (_, index) =>  TProductCardVertical(product: controller.featuredProducts[index]),
                    );
                  }
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}