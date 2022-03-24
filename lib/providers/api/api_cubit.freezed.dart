// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'api_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ApiStateTearOff {
  const _$ApiStateTearOff();

  ApiConstructor call(
      {required Set<API> inProgress,
      required Option<dynamic> value,
      required Option<ApiFailure> failure,
      required Option<dynamic> value2,
      required Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption}) {
    return ApiConstructor(
      inProgress: inProgress,
      value: value,
      failure: failure,
      value2: value2,
      apiFailureOrSuccessOption: apiFailureOrSuccessOption,
    );
  }
}

/// @nodoc
const $ApiState = _$ApiStateTearOff();

/// @nodoc
mixin _$ApiState {
  Set<API> get inProgress => throw _privateConstructorUsedError;
  Option<dynamic> get value => throw _privateConstructorUsedError;
  Option<ApiFailure> get failure => throw _privateConstructorUsedError;
  Option<dynamic> get value2 => throw _privateConstructorUsedError;
  Option<Either<ApiFailure, dynamic>> get apiFailureOrSuccessOption =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ApiStateCopyWith<ApiState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiStateCopyWith<$Res> {
  factory $ApiStateCopyWith(ApiState value, $Res Function(ApiState) then) =
      _$ApiStateCopyWithImpl<$Res>;
  $Res call(
      {Set<API> inProgress,
      Option<dynamic> value,
      Option<ApiFailure> failure,
      Option<dynamic> value2,
      Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption});
}

/// @nodoc
class _$ApiStateCopyWithImpl<$Res> implements $ApiStateCopyWith<$Res> {
  _$ApiStateCopyWithImpl(this._value, this._then);

  final ApiState _value;
  // ignore: unused_field
  final $Res Function(ApiState) _then;

  @override
  $Res call({
    Object? inProgress = freezed,
    Object? value = freezed,
    Object? failure = freezed,
    Object? value2 = freezed,
    Object? apiFailureOrSuccessOption = freezed,
  }) {
    return _then(_value.copyWith(
      inProgress: inProgress == freezed
          ? _value.inProgress
          : inProgress // ignore: cast_nullable_to_non_nullable
              as Set<API>,
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as Option<dynamic>,
      failure: failure == freezed
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Option<ApiFailure>,
      value2: value2 == freezed
          ? _value.value2
          : value2 // ignore: cast_nullable_to_non_nullable
              as Option<dynamic>,
      apiFailureOrSuccessOption: apiFailureOrSuccessOption == freezed
          ? _value.apiFailureOrSuccessOption
          : apiFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
    ));
  }
}

/// @nodoc
abstract class $ApiConstructorCopyWith<$Res>
    implements $ApiStateCopyWith<$Res> {
  factory $ApiConstructorCopyWith(
          ApiConstructor value, $Res Function(ApiConstructor) then) =
      _$ApiConstructorCopyWithImpl<$Res>;
  @override
  $Res call(
      {Set<API> inProgress,
      Option<dynamic> value,
      Option<ApiFailure> failure,
      Option<dynamic> value2,
      Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption});
}

/// @nodoc
class _$ApiConstructorCopyWithImpl<$Res> extends _$ApiStateCopyWithImpl<$Res>
    implements $ApiConstructorCopyWith<$Res> {
  _$ApiConstructorCopyWithImpl(
      ApiConstructor _value, $Res Function(ApiConstructor) _then)
      : super(_value, (v) => _then(v as ApiConstructor));

  @override
  ApiConstructor get _value => super._value as ApiConstructor;

  @override
  $Res call({
    Object? inProgress = freezed,
    Object? value = freezed,
    Object? failure = freezed,
    Object? value2 = freezed,
    Object? apiFailureOrSuccessOption = freezed,
  }) {
    return _then(ApiConstructor(
      inProgress: inProgress == freezed
          ? _value.inProgress
          : inProgress // ignore: cast_nullable_to_non_nullable
              as Set<API>,
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as Option<dynamic>,
      failure: failure == freezed
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Option<ApiFailure>,
      value2: value2 == freezed
          ? _value.value2
          : value2 // ignore: cast_nullable_to_non_nullable
              as Option<dynamic>,
      apiFailureOrSuccessOption: apiFailureOrSuccessOption == freezed
          ? _value.apiFailureOrSuccessOption
          : apiFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
    ));
  }
}

/// @nodoc

class _$ApiConstructor implements ApiConstructor {
  const _$ApiConstructor(
      {required this.inProgress,
      required this.value,
      required this.failure,
      required this.value2,
      required this.apiFailureOrSuccessOption});

  @override
  final Set<API> inProgress;
  @override
  final Option<dynamic> value;
  @override
  final Option<ApiFailure> failure;
  @override
  final Option<dynamic> value2;
  @override
  final Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption;

  @override
  String toString() {
    return 'ApiState(inProgress: $inProgress, value: $value, failure: $failure, value2: $value2, apiFailureOrSuccessOption: $apiFailureOrSuccessOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ApiConstructor &&
            const DeepCollectionEquality()
                .equals(other.inProgress, inProgress) &&
            const DeepCollectionEquality().equals(other.value, value) &&
            const DeepCollectionEquality().equals(other.failure, failure) &&
            const DeepCollectionEquality().equals(other.value2, value2) &&
            const DeepCollectionEquality().equals(
                other.apiFailureOrSuccessOption, apiFailureOrSuccessOption));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(inProgress),
      const DeepCollectionEquality().hash(value),
      const DeepCollectionEquality().hash(failure),
      const DeepCollectionEquality().hash(value2),
      const DeepCollectionEquality().hash(apiFailureOrSuccessOption));

  @JsonKey(ignore: true)
  @override
  $ApiConstructorCopyWith<ApiConstructor> get copyWith =>
      _$ApiConstructorCopyWithImpl<ApiConstructor>(this, _$identity);
}

abstract class ApiConstructor implements ApiState {
  const factory ApiConstructor(
      {required Set<API> inProgress,
      required Option<dynamic> value,
      required Option<ApiFailure> failure,
      required Option<dynamic> value2,
      required Option<Either<ApiFailure, dynamic>>
          apiFailureOrSuccessOption}) = _$ApiConstructor;

  @override
  Set<API> get inProgress;
  @override
  Option<dynamic> get value;
  @override
  Option<ApiFailure> get failure;
  @override
  Option<dynamic> get value2;
  @override
  Option<Either<ApiFailure, dynamic>> get apiFailureOrSuccessOption;
  @override
  @JsonKey(ignore: true)
  $ApiConstructorCopyWith<ApiConstructor> get copyWith =>
      throw _privateConstructorUsedError;
}
