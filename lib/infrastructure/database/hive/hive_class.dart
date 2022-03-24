import 'package:dartz/dartz.dart';
import 'package:hive/hive.dart';
import 'package:hms_patient_frontend/infrastructure/failures/api_failure.dart';
import 'package:hms_patient_frontend/infrastructure/models/patient.dart';
import 'package:injectable/injectable.dart';

enum HiveBoxType {
  patient,
}

const Map<HiveBoxType, String> hiveDBName =  {
  HiveBoxType.patient : 'patient',
};

const Map<Object, String> hiveDBNameUsingClass = {
	Patient :  'patient',
};

@injectable
class HiveDatabase{
	// final HiveBoxType dbName;
	/// default name is user
  const HiveDatabase();
	
	void registerAllAdapters() {
    // Hive.registerAdapter(UserAdapter());
    // Hive.registerAdapter(PeopleAdapter());
    // Hive.registerAdapter(CouncilAdapter());
    // Hive.registerAdapter(SubCouncilAdapter());
    // Hive.registerAdapter(EntityAdapter());
  }

	Future<void> openAllBoxes() async{
    await Future.value([
			await Hive.openBox<String>(hiveDBName[HiveBoxType.patient]!)
      // await Hive.openBox<User>(hiveDBName[HiveBoxType.user]!),
      // await Hive.openBox<People>(hiveDBName[HiveBoxType.people]!),
      // await Hive.openBox<Council>(hiveDBName[HiveBoxType.councilData]!),
    ]);
  }

	 Future<void> deleteAllBoxes () async{
    await Hive.deleteFromDisk();
  }
	Future<Either<ApiFailure,Box<T>>> getBox<T>(
		// {required HiveBoxType boxtype}
	) async{
		try {
			await openBox();
			return right(Hive.box<T>(hiveDBNameUsingClass[T]!));
		} catch (e) {
			return left(const ApiFailure.unknownError());
		}
	} 
	/// DONT FORGET TO SPECIFY THE CLASS [IMP!!!!]
	Future<void> openBox<T>(
		// {required HiveBoxType boxtype}
	) async{
    if(!Hive.isBoxOpen(hiveDBNameUsingClass[T]!)){
      await Hive.openBox<String>(hiveDBNameUsingClass[T]!);
    }
    return;
  }
	
	Future<void>openAllBoxesWithCondition()async{
    await Future.value([
			await openBox<Patient>()
      // await openBox<Council>(),
      // await openBox<People>(),
      // await openBox<User>(),
    ]);
  }	
}