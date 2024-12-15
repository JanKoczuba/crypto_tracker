import 'package:crypto_tracker/core/app/type_aliases.dart';
import 'package:crypto_tracker/features/crypto/domain/entities/coin.dart';
import 'package:crypto_tracker/features/crypto/domain/entities/page_list_request.dart';
import 'package:crypto_tracker/features/crypto/domain/repository/coin_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetCoinsUseCase {
  GetCoinsUseCase(
    this._coinRepository,
  );

  final CoinRepository _coinRepository;

  FutureFailable<List<Coin>> call(
    PageListRequest requestParams,
  ) async =>
      _coinRepository.getCoins(requestParams);
}
