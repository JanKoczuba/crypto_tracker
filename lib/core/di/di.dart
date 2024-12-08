import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'package:crypto_tracker/core/di/di.config.dart';

final sl = GetIt.instance;

@injectableInit
FutureOr<void> configureDependencies({required String environment}) =>
    sl.init(environment: environment);
