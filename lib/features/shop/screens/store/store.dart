import 'package:ecomm/common/widgets/appbar/appbar.dart';
import 'package:ecomm/common/widgets/custom_shapes/conatiners/search_container.dart';
import 'package:ecomm/common/widgets/layouts/grid_layout.dart';
import 'package:ecomm/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:ecomm/common/widgets/texts/section_heading.dart';
import 'package:ecomm/features/shop/screens/brand/all_brands.dart';
import 'package:ecomm/features/shop/screens/store/widgets/category_tab.dart';
import 'package:ecomm/utils/constants/colors.dart';
import 'package:ecomm/utils/constants/sizes.dart';
import 'package:ecomm/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/appbar/tabbar.dart';
import '../../../../common/widgets/brands/brand_card.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: TAppBar(
          title: Text('Store', style: Theme.of(context).textTheme.headlineMedium,),
          actions: [
            TCartCounterIcon(onPressed: (){}),
          ],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxIsScrolled){
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                backgroundColor: THelperFunctions.isDarkMode(context) ? TColors.black: TColors.white,
                expandedHeight: 440,
      
                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(TSizes.defaultSpace),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      const SizedBox(height: TSizes.spaceBtwItems,),
                      const TSearchContainer(text: 'Search in Store', showBorder: true, showBackground: false,padding: EdgeInsets.zero),
                      const SizedBox(height: TSizes.spaceBtwSections,),
      
                      //Featured Brands
                      TSectionHeading(title: 'Featured Brands', onPressed: () => Get.to(()=> const AllBrandsScreen()),),
                      const SizedBox(height: TSizes.spaceBtwItems / 1.5,),
      
                      TGridLayout(itemCount: 4,mainAxisExtent: 80, itemBuilder: (_, index){
                        return const TBrandCard();
                      }),
      
                    ],
                  ),
                ),
      
                //Tabs
                bottom: const TTabBar(tabs: [
                  Tab(child: Text('Sports'),),
                  Tab(child: Text('Furniture'),),
                  Tab(child: Text('Electronics'),),
                  Tab(child: Text('Clothes'),),
                  Tab(child: Text('Cosmetics'),),
                ],
                ),
      
              ),
            ];
          },
          body: const TabBarView(
            children: [
              TCategoryTab(),
              TCategoryTab(),
              TCategoryTab(),
              TCategoryTab(),
              TCategoryTab(),
            ],
          ),
        ),
      ),
    );
  }
}

