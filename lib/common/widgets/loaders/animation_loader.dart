import 'package:ecomm/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';

class TAnimationLoaderWidget extends StatelessWidget {
  const TAnimationLoaderWidget(
      {super.key,
      required this.text,
      required this.animation,
      this.showAction = false,
      this.actionText,
      this.onActionPressed});

  final String text;
  final String animation;
  final bool showAction;
  final String? actionText;
  final VoidCallback? onActionPressed;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //LottieTodo
          // Lottie.asset(animation, width: MediaQuery.of(context).size.width * 0.4),
          // Display Lottie animation
          Image(
              width: THelperFunctions.screenWidth() * 0.8,
              height: THelperFunctions.screenHeight() * 0.2,
              image: AssetImage(animation)
          ),
          const SizedBox(height: TSizes.defaultSpace),
          Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium!,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: TSizes.defaultSpace),
          showAction
            ? SizedBox(
              width: 250,
              child: OutlinedButton(
                  onPressed: onActionPressed,
                  child: Text(
                    actionText!,
                    style: Theme.of(context).textTheme.bodyMedium!.apply(color: dark ? TColors.white : TColors.black),
                  )
              ),
            )
            : const SizedBox(),

        ],
      ),
    );
  }
}
