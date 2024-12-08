import 'package:crypto_tracker/features/crypto/presentation/crypto_list/crypto_list_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';

part 'app_router.g.dart';

enum AppRouteEnum {
  crypto,
}

@TypedGoRoute<CryptoListRoute>(
  path: '/',
)
@immutable
class CryptoListRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const CryptoListPage();
  }
}

GoRouter goRouter() {
  return GoRouter(
    initialLocation: '/',
    routes: $appRoutes,
  );
}

@module
abstract class RouterModule {
  @singleton
  GoRouter provideAppRouter() => goRouter();
}
