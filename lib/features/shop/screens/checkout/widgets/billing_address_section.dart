import 'package:ecomm/data/repositories/authentication/authentication_repository.dart';
import 'package:ecomm/features/personalization/controllers/address_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../../../common/widgets/texts/section_heading.dart';
import '../../../../../utils/constants/sizes.dart';

class TBillingAddressSection extends StatelessWidget {
  const TBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = AddressController.instance;
    return  Obx(
      ()=> Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TSectionHeading(title: "Shipping Address", buttonTitle: "Change", onPressed: ()=> controller.selectNewAddressPopup(context),),

          controller.selectedAddress.value.id.isNotEmpty ?
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(controller.selectedAddress.value.name, style: Theme.of(context).textTheme.bodyLarge,),

              const SizedBox(width: TSizes.spaceBtwItems/2,),
              Row(
                children: [
                  const Icon(Icons.phone,color: Colors.grey,size: 16,),
                  const SizedBox(width: TSizes.spaceBtwItems,),
                  Text(controller.selectedAddress.value.phoneNumber, style: Theme.of(context).textTheme.bodyMedium,),
                ],
              ),
              const SizedBox(width: TSizes.spaceBtwItems/2,),

              Row(
                children: [
                  const Icon(Icons.location_history,color: Colors.grey,size: 16,),
                  const SizedBox(width: TSizes.spaceBtwItems,),
                  Expanded(child: Text(controller.selectedAddress.value.toString(), style: Theme.of(context).textTheme.bodyMedium, softWrap: true,)),
                ],
              ),
            ],
          ) : Text('Select Address', style: Theme.of(context). textTheme.bodyMedium),
          const SizedBox(width: TSizes.spaceBtwItems/2,),
        ],
      ),
    );
  }
}
