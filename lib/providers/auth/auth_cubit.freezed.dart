// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'auth_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AuthStateTearOff {
  const _$AuthStateTearOff();

  _AuthConstructor call(
      {required bool inProgress,
      required bool isAuthenticated,
      required Option<AuthFailure> authFailure,
      required Option<Patient> patient}) {
    return _AuthConstructor(
      inProgress: inProgress,
      isAuthenticated: isAuthenticated,
      authFailure: authFailure,
      patient: patient,
    );
  }
}

/// @nodoc
const $AuthState = _$AuthStateTearOff();

/// @nodoc
mixin _$AuthState {
  bool get inProgress => throw _privateConstructorUsedError;
  bool get isAuthenticated => throw _privateConstructorUsedError;
  Option<AuthFailure> get authFailure => throw _privateConstructorUsedError;
  Option<Patient> get patient => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AuthStateCopyWith<AuthState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res>;
  $Res call(
      {bool inProgress,
      bool isAuthenticated,
      Option<AuthFailure> authFailure,
      Option<Patient> patient});
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res> implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  final AuthState _value;
  // ignore: unused_field
  final $Res Function(AuthState) _then;

  @override
  $Res call({
    Object? inProgress = freezed,
    Object? isAuthenticated = freezed,
    Object? authFailure = freezed,
    Object? patient = freezed,
  }) {
    return _then(_value.copyWith(
      inProgress: inProgress == freezed
          ? _value.inProgress
          : inProgress // ignore: cast_nullable_to_non_nullable
              as bool,
      isAuthenticated: isAuthenticated == freezed
          ? _value.isAuthenticated
          : isAuthenticated // ignore: cast_nullable_to_non_nullable
              as bool,
      authFailure: authFailure == freezed
          ? _value.authFailure
          : authFailure // ignore: cast_nullable_to_non_nullable
              as Option<AuthFailure>,
      patient: patient == freezed
          ? _value.patient
          : patient // ignore: cast_nullable_to_non_nullable
              as Option<Patient>,
    ));
  }
}

/// @nodoc
abstract class _$AuthConstructorCopyWith<$Res>
    implements $AuthStateCopyWith<$Res> {
  factory _$AuthConstructorCopyWith(
          _AuthConstructor value, $Res Function(_AuthConstructor) then) =
      __$AuthConstructorCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool inProgress,
      bool isAuthenticated,
      Option<AuthFailure> authFailure,
      Option<Patient> patient});
}

/// @nodoc
class __$AuthConstructorCopyWithImpl<$Res> extends _$AuthStateCopyWithImpl<$Res>
    implements _$AuthConstructorCopyWith<$Res> {
  __$AuthConstructorCopyWithImpl(
      _AuthConstructor _value, $Res Function(_AuthConstructor) _then)
      : super(_value, (v) => _then(v as _AuthConstructor));

  @override
  _AuthConstructor get _value => super._value as _AuthConstructor;

  @override
  $Res call({
    Object? inProgress = freezed,
    Object? isAuthenticated = freezed,
    Object? authFailure = freezed,
    Object? patient = freezed,
  }) {
    return _then(_AuthConstructor(
      inProgress: inProgress == freezed
          ? _value.inProgress
          : inProgress // ignore: cast_nullable_to_non_nullable
              as bool,
      isAuthenticated: isAuthenticated == freezed
          ? _value.isAuthenticated
          : isAuthenticated // ignore: cast_nullable_to_non_nullable
              as bool,
      authFailure: authFailure == freezed
          ? _value.authFailure
          : authFailure // ignore: cast_nullable_to_non_nullable
              as Option<AuthFailure>,
      patient: patient == freezed
          ? _value.patient
          : patient // ignore: cast_nullable_to_non_nullable
              as Option<Patient>,
    ));
  }
}

/// @nodoc

class _$_AuthConstructor implements _AuthConstructor {
  const _$_AuthConstructor(
      {required this.inProgress,
      required this.isAuthenticated,
      required this.authFailure,
      required this.patient});

  @override
  final bool inProgress;
  @override
  final bool isAuthenticated;
  @override
  final Option<AuthFailure> authFailure;
  @override
  final Option<Patient> patient;

  @override
  String toString() {
    return 'AuthState(inProgress: $inProgress, isAuthenticated: $isAuthenticated, authFailure: $authFailure, patient: $patient)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AuthConstructor &&
            const DeepCollectionEquality()
                .equals(other.inProgress, inProgress) &&
            const DeepCollectionEquality()
                .equals(other.isAuthenticated, isAuthenticated) &&
            const DeepCollectionEquality()
                .equals(other.authFailure, authFailure) &&
            const DeepCollectionEquality().equals(other.patient, patient));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(inProgress),
      const DeepCollectionEquality().hash(isAuthenticated),
      const DeepCollectionEquality().hash(authFailure),
      const DeepCollectionEquality().hash(patient));

  @JsonKey(ignore: true)
  @override
  _$AuthConstructorCopyWith<_AuthConstructor> get copyWith =>
      __$AuthConstructorCopyWithImpl<_AuthConstructor>(this, _$identity);
}

abstract class _AuthConstructor implements AuthState {
  const factory _AuthConstructor(
      {required bool inProgress,
      required bool isAuthenticated,
      required Option<AuthFailure> authFailure,
      required Option<Patient> patient}) = _$_AuthConstructor;

  @override
  bool get inProgress;
  @override
  bool get isAuthenticated;
  @override
  Option<AuthFailure> get authFailure;
  @override
  Option<Patient> get patient;
  @override
  @JsonKey(ignore: true)
  _$AuthConstructorCopyWith<_AuthConstructor> get copyWith =>
      throw _privateConstructorUsedError;
}
