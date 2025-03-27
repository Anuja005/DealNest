import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../../../utils/helpers/helper_functions.dart';

class MyTermsAndConditionCheckbox extends StatelessWidget {
  const MyTermsAndConditionCheckbox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Row(
      children: [
        SizedBox(
            width: 24,
            height: 24,
            child: Checkbox(value: true, onChanged: (value) {})),
        SizedBox(width: 12),
        Text.rich(
          TextSpan(children: [
            TextSpan(
              text: '${TTexts.iAgreeTo} ',
              style:
                  Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 13),
            ),
            TextSpan(
              text: '${TTexts.privacyPolicy} ',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 12,
                    color: dark ? TColors.white : TColors.primary,
                    decoration: TextDecoration.underline,
                    decorationColor: dark ? TColors.white : TColors.primary,
                  ),
            ),
            TextSpan(
              text: '${TTexts.and} ',
              style:
                  Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 13),
            ),
            TextSpan(
              text: TTexts.termsOfUse,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 12,
                    color: dark ? TColors.white : TColors.primary,
                    decoration: TextDecoration.underline,
                    decorationColor: dark ? TColors.white : TColors.primary,
                  ),
            ),
          ]),
        ),
      ],
    );
  }
}
