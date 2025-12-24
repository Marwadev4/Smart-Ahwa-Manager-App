import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_ahwa_manager_app/core/di/dependency_injection.dart';
import 'package:smart_ahwa_manager_app/core/routing/routes.dart';
import 'package:smart_ahwa_manager_app/features/home/logic/home_cubit.dart';
import 'package:smart_ahwa_manager_app/features/home/ui/home_screen.dart';

/// Manage Routes
class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<HomeCubit>()..getOrders(),
            child: const HomeScreen(),
          ),
        );

      default:
        return MaterialPageRoute(
          builder: (context) =>
              Scaffold(body: Text('No route defined for ${settings.name}')),
        );
    }
  }
}
