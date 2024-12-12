import 'package:crypto_tracker/features/crypto/domain/entities/coin.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:crypto_tracker/features/crypto/domain/use_cases/get_coins_use_case.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'crypto_list_state.dart';

part 'crypto_list_cubit.freezed.dart';

@injectable
class CryptoListCubit extends Cubit<CryptoListState> {
  CryptoListCubit(
    this._getCoinsUseCase,
  ) : super(CryptoListState.initial());

  final GetCoinsUseCase _getCoinsUseCase;

  getCoins() async {
    final result = await _getCoinsUseCase();

    result.fold(
        (l) {},
        (r) => emit(
              state.copyWith(coins: r),
            ));
  }
}
