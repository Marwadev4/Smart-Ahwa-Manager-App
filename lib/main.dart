import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_ahwa_manager_app/core/di/dependency_injection.dart';
import 'package:smart_ahwa_manager_app/core/helpers/custom_observer.dart';
import 'package:smart_ahwa_manager_app/core/routing/app_router.dart';
import 'package:smart_ahwa_manager_app/core/theming/colors.dart';
import 'package:smart_ahwa_manager_app/smart_ahwa_manager_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: ColorsManager.normal),
  );
  await setupDi();
  Bloc.observer = CustomBlocObserver();
  await ScreenUtil.ensureScreenSize();
  runApp(SmartAhwaManagerApp(appRouter: AppRouter()));
}
