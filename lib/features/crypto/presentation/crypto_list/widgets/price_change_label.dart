import 'package:crypto_tracker/core/presentation/styles/app_borders.dart';
import 'package:crypto_tracker/core/presentation/styles/app_colors.dart';
import 'package:crypto_tracker/core/presentation/styles/app_paddings.dart';
import 'package:crypto_tracker/features/crypto/domain/entities/displayable_number.dart';
import 'package:flutter/material.dart';

class PriceChangeLabel extends StatelessWidget {
  const PriceChangeLabel({
    required this.change,
    super.key,
  });

  final DisplayableNumber change;

  @override
  Widget build(BuildContext context) {
    final contentColor = change.isValuePositive
        ? const Color(0xff00FF00)
        : Theme.of(context).colorScheme.onErrorContainer;
    return Container(
      decoration: BoxDecoration(
        color: change.isValuePositive
            ? AppColors.greenBackground
            : Theme.of(context).colorScheme.errorContainer,
        borderRadius: AppBorders.priceChangeLabel,
      ),
      child: Padding(
        padding: AppPaddings.priceChangeLabel,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              change.isValuePositive
                  ? Icons.keyboard_arrow_up_sharp
                  : Icons.keyboard_arrow_down_sharp,
              color: contentColor,
            ),
            Text(
              change.formatted,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: contentColor),
            ),
          ],
        ),
      ),
    );
  }
}
