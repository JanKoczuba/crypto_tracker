import 'package:crypto_tracker/core/app/type_aliases.dart';
import 'package:crypto_tracker/features/crypto/domain/entities/coin.dart';
import 'package:crypto_tracker/features/crypto/domain/entities/page_list_request.dart';

abstract interface class CoinRepository {
  FutureFailable<List<Coin>> getCoins(
    PageListRequest requestParams,
  );
}
