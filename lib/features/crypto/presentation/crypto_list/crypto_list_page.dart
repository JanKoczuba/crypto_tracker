import 'package:crypto_tracker/features/crypto/domain/entities/coin.dart';
import 'package:crypto_tracker/features/crypto/domain/entities/displayable_number.dart';
import 'package:crypto_tracker/features/crypto/presentation/crypto_list/widgets/coin_list_item.dart';
import 'package:flutter/material.dart';

class CryptoListPage extends StatefulWidget {
  const CryptoListPage({super.key});

  @override
  State<CryptoListPage> createState() => _CryptoListPageState();
}

class _CryptoListPageState extends State<CryptoListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: 10,
        itemBuilder: (context, index) {
          return CoinListItem(
            coin: Coin(
              id: "bitcoin",
              rank: 1,
              name: "Bitcoin",
              symbol: "BTC",
              marketCapUsd: 1241273958896.75.formatCurrencyDouble(),
              priceUsd: 62828.15.formatCurrencyDouble(),
              changePercent24Hr: 0.1.formatPercentDouble(),
            ),
          );
        },
      ),
    );
  }
}
