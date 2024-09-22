import 'package:flutter/material.dart';

import '../../../../../common/widgets/texts/section_heading.dart';
import '../../../../../utils/constants/sizes.dart';

class TBillingAddressSection extends StatelessWidget {
  const TBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TSectionHeading(title: "Shipping Address", buttonTitle: "Change", onPressed: (){},),
        Text('Ecomm', style: Theme.of(context).textTheme.bodyLarge,),

        const SizedBox(width: TSizes.spaceBtwItems/2,),
        Row(
          children: [
            const Icon(Icons.phone,color: Colors.grey,size: 16,),
            const SizedBox(width: TSizes.spaceBtwItems,),
            Text('+01 00000000', style: Theme.of(context).textTheme.bodyMedium,),
          ],
        ),
        const SizedBox(width: TSizes.spaceBtwItems/2,),

        Row(
          children: [
            const Icon(Icons.location_history,color: Colors.grey,size: 16,),
            const SizedBox(width: TSizes.spaceBtwItems,),
            Expanded(child: Text('Indiana Johns, India', style: Theme.of(context).textTheme.bodyMedium, softWrap: true,)),
          ],
        ),
        const SizedBox(width: TSizes.spaceBtwItems/2,),
      ],
    );
  }
}
