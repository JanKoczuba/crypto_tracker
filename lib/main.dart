import 'package:crypto_tracker/core/di/di.dart';
import 'package:crypto_tracker/core/presentation/styles/app_theme.dart';
import 'package:crypto_tracker/features/crypto/presentation/crypto_list/crypto_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FlavorConfig(
    name: Environment.prod,
    variables: {
      "baseUrl": "https://api.coincap.io/v2/",
    },
  );

  await configureDependencies(environment: Environment.prod);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = sl<GoRouter>();

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      title: 'Crypto Tracker',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      highContrastTheme: AppTheme.highContrastLightTheme,
      highContrastDarkTheme: AppTheme.highContrastDarkTheme,
      themeMode: ThemeMode.system,
    );
  }
}
