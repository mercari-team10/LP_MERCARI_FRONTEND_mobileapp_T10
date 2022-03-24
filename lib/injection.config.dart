// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'infrastructure/api/api_implementations.dart' as _i4;
import 'infrastructure/auth/auth_implementation.dart' as _i6;
import 'infrastructure/database/hive/hive_class.dart' as _i7;
import 'infrastructure/interfaces/api_inteface.dart' as _i3;
import 'infrastructure/interfaces/auth_interface.dart' as _i5;
import 'providers/api/api_cubit.dart' as _i8;
import 'providers/auth/auth_cubit.dart'
    as _i9; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.lazySingleton<_i3.ApiInterface>(() => _i4.ApiImplementation());
  gh.lazySingleton<_i5.AuthInterface>(() => _i6.AuthImplementation());
  gh.factory<_i7.HiveDatabase>(() => _i7.HiveDatabase());
  gh.factory<_i8.ApiCubit>(() => _i8.ApiCubit(get<_i3.ApiInterface>()));
  gh.factory<_i9.AuthCubit>(() => _i9.AuthCubit(get<_i5.AuthInterface>()));
  return get;
}
