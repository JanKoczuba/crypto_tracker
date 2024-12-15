import 'dart:convert';
import 'dart:isolate';

import 'package:crypto_tracker/features/crypto/domain/entities/coin.dart';
import 'package:crypto_tracker/features/crypto/domain/entities/displayable_number.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

part 'coin_value_state.dart';

part 'coin_value_cubit.freezed.dart';

@injectable
class CoinValueCubit extends Cubit<CoinValueState> {
  CoinValueCubit(
    @factoryParam this._coin,
  ) : super(const CoinValueState()) {
    _init();
  }

  late final coin24hValue =
      _coin.priceUsd.value / ((_coin.changePercent24Hr.value / 100) + 1);

  final Coin _coin;
  late final ReceivePort receivePort;

  Future _init() async {
    receivePort = ReceivePort();
    Isolate.spawn(
      _isolateFunction,
      {
        "sp": receivePort.sendPort,
        "coinId": _coin.id,
      },
    );

    receivePort.listen((message) {
      if (message is double) {
        final coinValue = message;
        emit(
          state.copyWith(
            coinValue: coinValue.formatCurrencyDouble(),
            coinPercentageChange:
                (((coinValue - coin24hValue) / coinValue) * 100)
                    .formatPercentDouble(),
          ),
        );
      }
    });
  }

  static void _isolateFunction(Map message) async {
    final SendPort sp = message['sp'];
    final coinId = message['coinId'];
    final wsUrl = Uri.parse('wss://ws.coincap.io/prices?assets=$coinId');
    final channel = WebSocketChannel.connect(
      wsUrl,
    );

    await channel.ready;
    channel.stream.listen((message) {
      final value = double.tryParse(jsonDecode(message)[coinId]) ?? 1.0;
      sp.send(value);
    });
  }

  @override
  Future<void> close() {
    receivePort.close();
    return super.close();
  }
}
