import 'package:crypto_tracker/core/di/di.dart';
import 'package:crypto_tracker/features/crypto/domain/entities/coin.dart';
import 'package:crypto_tracker/features/crypto/presentation/crypto_list/bloc/crypto_list_cubit.dart';
import 'package:crypto_tracker/features/crypto/presentation/crypto_list/widgets/coin_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CryptoListPage extends StatefulWidget {
  const CryptoListPage({super.key});

  @override
  State<CryptoListPage> createState() => _CryptoListPageState();
}

class _CryptoListPageState extends State<CryptoListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => sl<CryptoListCubit>()..getCoins(),
        child: BlocBuilder<CryptoListCubit, CryptoListState>(
          builder: (context, state) {
            final coins = state.coins;
            return ListView.separated(
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
            );
          },
        ),
      ),
    );
  }
}
