import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import '/common/theme.dart';
import '../app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:firebase_core/firebase_core.dart';
// import '../app/services/settings_service.dart';
// import 'app/providers/api_provider.dart';
import 'app/providers/api_provider.dart';
import 'app/services/auth_service.dart';
import 'common/transalations/translator.dart';
// import 'app/services/global_service.dart';

Future initServices() async {
  Get.log('starting services ...');
  await GetStorage.init();
  // await Get.putAsync(() => TranslationService().init());
  // await Get.putAsync(() => GlobalService().init());
  await Firebase.initializeApp();
  // await Get.putAsync(() => FirebaseProvider().init());
  await Get.putAsync(() => AuthService().init());
  await Get.putAsync(() => ApiProvider().init()).then((value) {
    Get.find<AuthService>().getCurrentUser(
        // {"email": "karomhatre@gmail.com", "otp": "1234", "type": "gmail"}
        );
  });
  // await Get.putAsync(() => SettingsService().init());
  Get.log('All services started...');
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // ONE SIGNAL
  // if (kDebugMode) {
  //   OneSignal.Debug.setLogLevel(OSLogLevel.verbose);
  // }
  OneSignal.initialize("a8b16c1a-d8b6-4778-b007-8cab1d490de2");
  OneSignal.Notifications.requestPermission(true);

  await initServices();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  var lang = await GetStorage().read("lang") ?? "en";
  Locale locale =
      lang == "en" ? const Locale("en", "EN") : const Locale("mr", "MAR");

  runApp(MyApp(locale: locale));
}

class MyApp extends StatelessWidget {
  final Locale locale;
  const MyApp({super.key, required this.locale});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: Translator(),
      locale: locale,
      title:
          "Flutter Starter Project", //Get.find<SettingsService>().setting.value.appName!,
      initialRoute: AppPages.INITIAL,
      onReady: () async {
        // await Get.putAsync(() => FireBaseMessagingService().init());
      },
      getPages: AppPages.routes,
      // localizationsDelegates: [GlobalMaterialLocalizations.delegate],
      // supportedLocales: Get.find<TranslationService>().supportedLocales(),
      // translationsKeys: Get.find<TranslationService>().translations,
      // locale: Get.find<SettingsService>().getLocale(),
      // fallbackLocale: Get.find<TranslationService>().fallbackLocale,
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.cupertino,
      themeMode: getThemeMode(),
      theme: getThemeData(),
      // darkTheme: Get.find<SettingsService>().getDarkTheme(),
    );
  }
}
