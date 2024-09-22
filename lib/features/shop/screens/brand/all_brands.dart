import 'package:ecomm/common/widgets/brands/brand_card.dart';
import 'package:ecomm/common/widgets/layouts/grid_layout.dart';
import 'package:ecomm/common/widgets/products/sortable/sortable_products.dart';
import 'package:ecomm/common/widgets/texts/section_heading.dart';
import 'package:ecomm/features/shop/screens/brand/brand_products.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../utils/constants/sizes.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(title: Text("Brand"),showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              const TSectionHeading(title: "Brands", showActionButton: false,),
              const SizedBox(height: TSizes.spaceBtwItems,),
              
              TGridLayout(
                  itemCount: 10,
                  mainAxisExtent: 80,
                  itemBuilder: (context, index) => TBrandCard(
                    showBorder: true,
                    onTap: ()=> Get.to(()=> const BrandProducts()),
                  )
              )

            ],
          ),
        ),
      ),
    );
  }
}
