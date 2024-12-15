import 'package:crypto_tracker/core/app/constants.dart';
import 'package:crypto_tracker/features/crypto/domain/entities/coin.dart';
import 'package:crypto_tracker/features/crypto/domain/entities/page_list_request.dart';
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

  PageListRequest _pageListRequest = PageListRequest.empty();
  bool _hasNextData = true;

  getCoins() async {
    emit(state.copyWith(
      isLoading: true,
    ));
    if (!_hasNextData) {
      emit(state.copyWith(
        isLoading: false,
      ));
      return;
    }
    final result = await _getCoinsUseCase(_pageListRequest);
    _pageListRequest = _pageListRequest.increment();

    result.fold((l) {}, (r) {
      _hasNextData = r.length >= Constants.pageSize;
      emit(
        state.copyWith(
          coins: [...state.coins, ...r],
          isLoading: false,
        ),
      );
    });
  }
}
