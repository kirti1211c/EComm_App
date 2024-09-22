import 'package:ecomm/common/widgets/custom_shapes/conatiners/circular_container.dart';
import 'package:ecomm/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';

class TChoiceChip extends StatelessWidget {
  const TChoiceChip({super.key, required this.text, required this.selected, this.onSelected});

  final String text; final bool selected;
  final void Function(bool)? onSelected;

  @override
  Widget build(BuildContext context) {
    final isColor = THelperFunctions.getColor(text) !=null;
    return Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
      child: ChoiceChip(
        label: THelperFunctions.getColor(text) !=null ? const SizedBox() : Text(text),
        selected: selected,
        onSelected: onSelected,
        labelStyle: TextStyle(color: selected? TColors.black : null),
        avatar: THelperFunctions.getColor(text) !=null ? TCircularContainer(width: 50, height: 50,backgroundColor: THelperFunctions.getColor(text)!,) : null,
        shape: isColor ? const CircleBorder(): null,
        labelPadding: THelperFunctions.getColor(text) !=null ? const EdgeInsets.all(0): null,
        padding: THelperFunctions.getColor(text) !=null ? const EdgeInsets.all(0): null,
        backgroundColor: isColor ? THelperFunctions.getColor(text)! : null,
      ),
    );
  }
}
