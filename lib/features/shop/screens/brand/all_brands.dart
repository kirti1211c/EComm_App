import 'package:ecomm/common/widgets/brands/brand_card.dart';
import 'package:ecomm/common/widgets/layouts/grid_layout.dart';
import 'package:ecomm/common/widgets/products/sortable/sortable_products.dart';
import 'package:ecomm/common/widgets/texts/section_heading.dart';
import 'package:ecomm/features/shop/controllers/product/brand_controller.dart';
import 'package:ecomm/features/shop/screens/brand/brand_products.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/shimmers/brand_shimmer.dart';
import '../../../../utils/constants/sizes.dart';
import '../../models/brand_model.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final brandController = BrandController.instance;
    return Scaffold(
      appBar: const TAppBar(title: Text("Brand"),showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              const TSectionHeading(title: "Brands", showActionButton: false,),
              const SizedBox(height: TSizes.spaceBtwItems,),

              Obx(() {
                  if(brandController.isLoading.value) return const TBrandsShimmer();

                  if (brandController.allBrands. isEmpty) {
                    return Center(
                      child: Text("No Data Found!", style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white),),
                    );
                  }

                  return TGridLayout(
                      itemCount: brandController.allBrands.length,
                      mainAxisExtent: 80,
                      itemBuilder: (_, index){
                        final brand= brandController.allBrands[index];
                        return  TBrandCard(
                          showBorder: true,
                          brand: brand,
                          onTap: () => Get.to(()=> BrandProducts(brand: brand,)),
                        );
                      }
                  );
                }
              ),

            ],
          ),
        ),
      ),
    );
  }
}
