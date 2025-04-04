import 'package:deal_nest/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:deal_nest/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';

class MyChoiceChip extends StatelessWidget {
  const MyChoiceChip({
    super.key,
    required this.text,
    required this.selected,
    this.onSelected,
  });

  final String text;
  final bool selected;
  final void Function(bool)? onSelected;

  @override
  Widget build(BuildContext context) {
    final isColor = THelperFunctions.getColor(text) != null;
    return Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
      child: ChoiceChip(
        label: isColor ? SizedBox() : Text(text),
        selected: selected,
        onSelected: onSelected,
        labelStyle: TextStyle(color: selected ? TColors.white : null),
        avatar: isColor
            ? MyCircularContainer(
                width: 50,
                height: 50,
                backgroundColor: THelperFunctions.getColor(text)!)
            : null,
        labelPadding: isColor ? EdgeInsets.all(0) : null,
        // Make icon in the center
        padding: isColor ? EdgeInsets.all(0) : null,
        shape: isColor ? CircleBorder() : null,
        backgroundColor: isColor ? THelperFunctions.getColor(text)! : null,
      ),
    );
  }
}
