part of 'coin_value_cubit.dart';

@freezed
class CoinValueState with _$CoinValueState {
  const factory CoinValueState({
    DisplayableNumber? coinValue,
    DisplayableNumber? coinPercentageChange,
  }) = _CoinValueState;
}
