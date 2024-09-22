import 'package:ecomm/common/widgets/layouts/grid_layout.dart';
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
import '../../../../common/widgets/texts/section_heading.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                  const TPromoSlider(banners: [TImages.promoBanner1,TImages.promoBanner2,TImages.promoBanner3]),
                  const SizedBox(height: TSizes.spaceBtwSections,),

                  //Heading
                  TSectionHeading(title: 'Popular Products', onPressed: ()=> Get.to(()=> const AllProducts()),),
                  const SizedBox(height: TSizes.spaceBtwItems,),

                  //Popular Products
                  TGridLayout(itemCount: 2, itemBuilder: (_, index) => const TProductCardVertical())


                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}