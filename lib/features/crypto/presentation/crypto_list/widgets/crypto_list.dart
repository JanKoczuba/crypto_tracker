import 'package:flutter/material.dart';

import 'package:crypto_tracker/core/presentation/processing_container.dart';
import 'package:crypto_tracker/features/crypto/domain/entities/coin.dart';
import 'package:crypto_tracker/features/crypto/presentation/crypto_list/bloc/crypto_list_cubit.dart';
import 'package:crypto_tracker/features/crypto/presentation/crypto_list/widgets/coin_list_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CryptoList extends StatelessWidget {
  const CryptoList({required this.controller, super.key});

  final ScrollController controller;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CryptoListCubit, CryptoListState>(
      buildWhen: (p, c) => p.coins != c.coins,
      builder: (context, state) {
        final coins = state.coins;
        return ProcessingContainer(
          isProcessing: state.isLoading,
          child: ListView.separated(
            controller: controller,
            shrinkWrap: true,
            itemCount: state.coins.length,
            separatorBuilder: (BuildContext context, int index) {
              return const Divider();
            },
            itemBuilder: (context, index) {
              final coin = coins[index];
              return CoinListItem(
                coin: Coin(
                  id: coin.id,
                  rank: coin.rank,
                  name: coin.name,
                  symbol: coin.symbol,
                  marketCapUsd: coin.marketCapUsd,
                  priceUsd: coin.priceUsd,
                  changePercent24Hr: coin.changePercent24Hr,
                ),
              );
            },
          ),
        );
      },
    );
  }
}
