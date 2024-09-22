import 'package:ecomm/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/custom_shapes/conatiners/rounded_conatiner.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';

class TSingleAddress extends StatelessWidget {
  const TSingleAddress({super.key, required this.selectedAddress});

  final bool selectedAddress;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return TRoundedContainer(
      padding: const EdgeInsets.all(TSizes.md),
      width: double.infinity,
      showBorder: true,
      backgroundColor: selectedAddress? TColors.primary.withOpacity(0.5): Colors.transparent,
      borderColor: selectedAddress? Colors.transparent : dark? TColors.darkerGrey : TColors.grey,
      margin: const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
      child: Stack(
        children: [
          Positioned(
            right: 5,
            top: 0,
            child: Icon(
              selectedAddress? Iconsax.tick_circle5 : null,
              color: selectedAddress? dark? TColors.light : TColors.dark : null,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'John',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: TSizes.sm/2,),
              const Text("+91 0000000000",maxLines: 1,overflow: TextOverflow.ellipsis,),
              const SizedBox(height: TSizes.sm/2,),
              const Text("256 Baker Street lorem ipsum  lorem ipsum, USA - 122001", softWrap: true,)
            ],
          )
        ],
      ),
    );
  }
}
