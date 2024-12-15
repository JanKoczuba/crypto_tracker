import 'package:crypto_tracker/core/di/di.dart';
import 'package:crypto_tracker/core/presentation/styles/app_spacing.dart';
import 'package:crypto_tracker/features/crypto/domain/entities/coin.dart';
import 'package:crypto_tracker/features/crypto/presentation/crypto_list/bloc/coin_value_cubit.dart';
import 'package:crypto_tracker/features/crypto/presentation/crypto_list/widgets/price_change_label.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoinValueColumn extends StatefulWidget {
  const CoinValueColumn({
    required this.contentColor,
    required this.coin,
    super.key,
  });

  final Color contentColor;
  final Coin coin;

  @override
  State<CoinValueColumn> createState() => _CoinValueColumnState();
}

class _CoinValueColumnState extends State<CoinValueColumn> {
  late final Color contentColor = widget.contentColor;
  late final Coin coin = widget.coin;
  late final CoinValueCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = sl<CoinValueCubit>(param1: coin);
  }

  @override
  void dispose() {
    cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CoinValueCubit, CoinValueState>(
      bloc: cubit,
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              state.coinValue?.formatted ?? coin.priceUsd.formatted,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: contentColor),
            ),
            AppSpacing.height8,
            PriceChangeLabel(
              change: state.coinPercentageChange ?? coin.changePercent24Hr,
            ),
          ],
        );
      },
    );
  }
}
