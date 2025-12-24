import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:smart_ahwa_manager_app/core/local_db/local_db.dart';
import 'package:smart_ahwa_manager_app/features/home/data/repos/home_repo.dart';
import 'package:smart_ahwa_manager_app/features/home/logic/home_cubit.dart';
import 'package:sqflite/sqflite.dart';

final getIt = GetIt.instance;

/// Dependency Injection
Future<void> setupDi() async {
  Database database = await createDatabase();

  // local db
  getIt.registerLazySingleton<LocalDB>(() => LocalDB(database));

  // home
  getIt.registerLazySingleton<HomeRepo>(() => HomeRepo(getIt<LocalDB>()));
  getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt<HomeRepo>()));
}

Future<Database> createDatabase() async {
  Logger().i('Creating database...');
  return await openDatabase(
    'smart_ahwa_manager.db',
    version: 1,
    onCreate: (database, version) {
      Logger().i('Creating TABLE...');
      database.execute(
        'CREATE TABLE orders (id INTEGER PRIMARY KEY, customerName TEXT, drink TEXT, notes TEXT, status TEXT, image TEXT)',
      );
    },
  );
}
