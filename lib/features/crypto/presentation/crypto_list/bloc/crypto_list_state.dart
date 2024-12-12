part of 'crypto_list_cubit.dart';

@freezed
class CryptoListState with _$CryptoListState {
  const factory CryptoListState({
    required List<Coin> coins,
    required bool isLoading,
  }) = _CryptoListState;

  factory CryptoListState.initial() => const CryptoListState(
        coins: [],
        isLoading: false,
      );
}
