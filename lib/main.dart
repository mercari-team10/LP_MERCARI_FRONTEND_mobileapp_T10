import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flutter/scheduler.dart' as sh;
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hms_patient_frontend/routes/routes.dart';
import 'package:hms_patient_frontend/ui/app.dart';
import 'package:path_provider/path_provider.dart';
import 'injection.dart';

Future<void> main() async{
	WidgetsFlutterBinding.ensureInitialized();
  sh.timeDilation = 1.0;
	getIt.registerSingleton<AppRouter>(AppRouter()); 
	// await Future.value([
  //   // await configureLocalTimeZone(),
	// 	// await Firebase.initializeApp(),
	// ]);
	// const HiveDatabase().registerAllAdapters();
	await Future.value([
		await configureInjection(),
		// await Hive.initFlutter(),
		// await Hive.openBox<String>('theme'),
		await openHiveBox<String>('theme'),
		await openHiveBox<bool>('user'),
		await openHiveBox<String>('schedules')
	]);
  runApp(const App());
}

Future<Box> openHiveBox<T>(String boxName) async{
	
    if (!kIsWeb && !Hive.isBoxOpen(boxName)) {
      Hive.init((await getApplicationDocumentsDirectory()).path);
    }
    
    return await Hive.openBox<T>(boxName);
}