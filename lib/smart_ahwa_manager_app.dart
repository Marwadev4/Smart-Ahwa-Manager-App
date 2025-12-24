import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_ahwa_manager_app/core/routing/app_router.dart';
import 'package:smart_ahwa_manager_app/core/routing/routes.dart';
import 'package:smart_ahwa_manager_app/core/theming/colors.dart';

class SmartAhwaManagerApp extends StatelessWidget {
  const SmartAhwaManagerApp({super.key, required this.appRouter});
  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      child: MaterialApp(
        title: 'مدير القهوة الذكي',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Tajawal',
          primaryColor: ColorsManager.normal,
          scaffoldBackgroundColor: ColorsManager.light,
        ),
        locale: const Locale('ar'),
        supportedLocales: const [Locale('ar')],
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        initialRoute: Routes.homeScreen,

        onGenerateRoute: appRouter.generateRoute,
      ),
    );
  }
}
