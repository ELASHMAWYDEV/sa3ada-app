import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:sa3ada_app/firebase_options.dart';
import 'utils/app_routes.dart';
import 'utils/constants.dart';
import 'utils/services/firebase.dart';
import 'utils/services/api_service.dart';
import 'utils/services/connection_service.dart';
import 'utils/services/localization_service.dart';
import 'utils/services/navigation_service.dart';
import 'utils/services/storage_service.dart';
import 'utils/translations/app_translations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Get.putAsync(() => ConnectionService.init(), permanent: true);
  await Get.putAsync(() => StorageService.init(), permanent: true);
  Get.put(FirebaseService.init(), permanent: true);
  Get.put(LocalizationService.init(), permanent: true);
  Get.put(NavigationService.init(), permanent: true);
  Get.put(ApiService(), permanent: true);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: Get.find<NavigationService>().navigationKey,
      title: kAppTitle,
      translations: AppTranslations(),
      locale: Get.find<LocalizationService>().activeLocale,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: SupportedLocales.all,
      fallbackLocale: SupportedLocales.arabic,
      getPages: AppRoutes.routes,
      initialRoute: AppRoutes.initialRoute,
      theme: ThemeData(
          scaffoldBackgroundColor: kPrimaryColor,
          primaryColor: kPrimaryColor,
          textTheme: Theme.of(context).textTheme.apply(
                bodyColor: kSecondaryColor,
                fontFamily: kFontFamilyPrimary,
              ),
          visualDensity: VisualDensity.adaptivePlatformDensity),
    );
  }
}
