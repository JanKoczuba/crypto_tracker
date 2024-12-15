import 'package:crypto_tracker/core/presentation/custom_svg_picture.dart';
import 'package:crypto_tracker/core/presentation/styles/app_paddings.dart';
import 'package:crypto_tracker/core/presentation/styles/app_spacing.dart';
import 'package:crypto_tracker/features/crypto/domain/entities/coin.dart';
import 'package:crypto_tracker/features/crypto/presentation/crypto_list/widgets/coin_value_column.dart';
import 'package:crypto_tracker/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class CoinListItem extends StatelessWidget {
  const CoinListItem({
    required this.coin,
    super.key,
  });

  final Coin coin;

  @override
  Widget build(BuildContext context) {
    final contentColor = Theme.of(context).brightness == Brightness.light
        ? Colors.black
        : Colors.white;

    final path = Assets.svg.values.firstWhere(
      (path) {
        const svgAssetsDirectoryLength = 11;
        final fileExtensionStart = path.indexOf('.') - svgAssetsDirectoryLength;
        return path
                .substring(svgAssetsDirectoryLength)
                .substring(0, fileExtensionStart) ==
            coin.symbol.toLowerCase();
      },
      orElse: () => Assets.svg.questionMark,
    );
    return Padding(
      padding: AppPaddings.coinListItem,
      child: Row(
        children: [
          CustomSvgPicture(
            path,
            color: Theme.of(context).colorScheme.primary,
            size: 85,
          ),
          AppSpacing.width8,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  coin.symbol,
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium
                      ?.copyWith(color: contentColor),
                ),
                AppSpacing.height8,
                Text(
                  coin.name,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: contentColor),
                ),
              ],
            ),
          ),
          const Spacer(),
          CoinValueColumn(
            key: Key('CoinValueColumn${coin.rank}'),
            contentColor: contentColor,
            coin: coin,
          ),
        ],
      ),
    );
  }
}
