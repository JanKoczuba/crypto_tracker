import 'package:freezed_annotation/freezed_annotation.dart';

part 'coins_response.g.dart';

@JsonSerializable()
class CoinsResponse {
  const CoinsResponse({
    required this.data,
  });

  factory CoinsResponse.fromJson(Map<String, dynamic> json) =>
      _$CoinsResponseFromJson(json);

  final List<CoinDto> data;
}

@JsonSerializable()
class CoinDto {
  const CoinDto({
    required this.id,
    required this.rank,
    required this.name,
    required this.symbol,
    required this.marketCapUsd,
    required this.priceUsd,
    required this.changePercent24Hr,
  });

  factory CoinDto.fromJson(Map<String, dynamic> json) => _$CoinDtoFromJson(json);

  final String id;
  final String rank;
  final String name;
  final String symbol;
  final String marketCapUsd;
  final String priceUsd;
  final String changePercent24Hr;
}
