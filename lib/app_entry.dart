import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:recipes/packages/ui/ui.dart';

import 'features/features.dart';

class RecipeHavenEntry extends ConsumerWidget {
  const RecipeHavenEntry({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final isUserCreated = ref.watch(isUserCreatedPvdr);
    return GetMaterialApp(
      locale: const Locale("en", "US"),
      navigatorObservers: const [],
      onInit: () async {
        final landingCtrl = ref.read(landingCtrlPvdr);
        ref.read(isUserCreatedPvdr.notifier).state =
            AsyncData(await landingCtrl.checkIfUserCreated());
      },
      debugShowCheckedModeBanner: false,
      theme: getThemeData(),
      home: isUserCreated.when(
          data: (isUserCreated) =>
              isUserCreated ? const HomeScreen() : const RecipeHavenLanding(),
          error: (_, __) => const Text("Error"),
          loading: () => const LoadingScaffold()),
    );
  }

  ThemeData getThemeData() {
    return ThemeData(
      textButtonTheme: TextButtonThemeData(
        style: textButtonStyle,
      ),
      scaffoldBackgroundColor: nuteralColor,
      listTileTheme: const ListTileThemeData(
        iconColor: actionIconColor,
      ),
      buttonTheme: const ButtonThemeData(
        padding: EdgeInsets.symmetric(horizontal: 0),
      ),
      appBarTheme: AppBarTheme(
        iconTheme: const IconThemeData(color: Colors.black, size: iconSize20),
        centerTitle: true,
        titleTextStyle: appBar,
        backgroundColor: Colors.grey[100],
        elevation: 0,
      ),
      snackBarTheme: snackBarTheme,
      inputDecorationTheme: inputDecorationTheme,
      iconTheme: const IconThemeData(color: darkPrimary),
      fontFamily: "IBM-Sans",
      primaryColor: primaryColor,
      primaryIconTheme: const IconThemeData(color: darkPrimary),
      colorScheme: ColorScheme.fromSeed(
              seedColor: primaryColor,
              secondary: lightPrimary,
              background: nuteralColor)
          .copyWith(background: nuteralColor),
    );
  }
}
