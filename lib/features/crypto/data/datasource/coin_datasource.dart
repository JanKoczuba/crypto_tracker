import 'package:crypto_tracker/core/data/api/network_module.dart';
import 'package:crypto_tracker/features/crypto/data/models/coins_response.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'coin_datasource.g.dart';

@RestApi()
abstract class CoinDatasource {
  factory CoinDatasource(Dio dio, {String baseUrl}) = _CoinDatasource;

  @GET('/assets')
  Future<CoinsResponse> getCoinsData();
}

@module
abstract class WeatherForecastModule {
  @LazySingleton()
  CoinDatasource provideResolutionApi(
    @Named(baseUrlName) String baseUrl,
    @Named(mainDioName) Dio dio,
  ) {
    return CoinDatasource(dio, baseUrl: baseUrl);
  }
}
