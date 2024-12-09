import 'package:crypto_tracker/features/crypto/domain/entities/displayable_number.dart';

class Coin {
  Coin({
    required this.id,
    required this.rank,
    required this.name,
    required this.symbol,
    required this.marketCapUsd,
    required this.priceUsd,
    required this.changePercent24Hr,
  });

  final String id;
  final int rank;
  final String name;
  final String symbol;
  final DisplayableNumber marketCapUsd;
  final DisplayableNumber priceUsd;
  final DisplayableNumber changePercent24Hr;
}



