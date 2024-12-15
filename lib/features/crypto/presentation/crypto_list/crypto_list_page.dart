import 'package:crypto_tracker/core/di/di.dart';
import 'package:crypto_tracker/core/presentation/processing_container.dart';
import 'package:crypto_tracker/features/crypto/presentation/crypto_list/bloc/crypto_list_cubit.dart';
import 'package:crypto_tracker/features/crypto/presentation/crypto_list/widgets/crypto_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CryptoListPage extends StatefulWidget {
  const CryptoListPage({super.key});

  @override
  State<CryptoListPage> createState() => _CryptoListPageState();
}

class _CryptoListPageState extends State<CryptoListPage> {
  late final CryptoListCubit cubit;
  final ScrollController _controller = ScrollController();

  @override
  void initState() {
    super.initState();
    cubit = sl<CryptoListCubit>()..getCoins();
    _controller.addListener(_pagination);
  }

  void _pagination() {
    if (_controller.position.pixels >= _controller.position.maxScrollExtent) {
      cubit.getCoins();
    }
  }

  @override
  void dispose() {
    cubit.close();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => cubit,
        child: BlocBuilder<CryptoListCubit, CryptoListState>(
          buildWhen: (p, c) => p.isLoading != c.isLoading,
          builder: (context, state) {
            return ProcessingContainer(
              isProcessing: state.isLoading,
              child: CryptoList(
                controller: _controller,
              ),
            );
          },
        ),
      ),
    );
  }
}
