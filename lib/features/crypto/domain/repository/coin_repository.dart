import 'package:crypto_tracker/core/app/type_aliases.dart';
import 'package:crypto_tracker/features/crypto/domain/entities/coin.dart';

abstract class CoinRepository {
  FutureFailable<List<Coin>> getCoins();
}
