import 'package:collection/collection.dart';
import 'package:crypto_tracker/core/app/type_aliases.dart';
import 'package:crypto_tracker/core/data/api/repository_request_handler.dart';
import 'package:crypto_tracker/features/crypto/data/datasource/coin_datasource.dart';
import 'package:crypto_tracker/features/crypto/domain/entities/coin.dart';
import 'package:crypto_tracker/features/crypto/domain/entities/displayable_number.dart';
import 'package:crypto_tracker/features/crypto/domain/repository/coin_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CoinRepository)
class DataCoinRepository extends RepositoryRequestHandler
    implements CoinRepository {
  DataCoinRepository(
    this._datasource,
  );

  final CoinDatasource _datasource;

  @override
  FutureFailable<List<Coin>> getCoins() => makeRequest(request: () async {
        final result = await _datasource.getCoinsData();
        return right(
          result.data
              .map((coin) => Coin(
                    id: coin.id,
                    rank: int.parse(coin.rank),
                    name: coin.name,
                    symbol: coin.symbol,
                    marketCapUsd:
                        double.parse(coin.marketCapUsd).formatCurrencyDouble(),
                    priceUsd:
                        double.parse(coin.priceUsd).formatCurrencyDouble(),
                    changePercent24Hr:
                        double.parse(coin.changePercent24Hr).formatPercentDouble(),
                  ))
              .toList(),
        );
      });
}
