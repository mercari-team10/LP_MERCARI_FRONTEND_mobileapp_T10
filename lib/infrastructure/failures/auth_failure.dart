import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_failure.freezed.dart';

@freezed
abstract class AuthFailure with _$AuthFailure {
  // Serves as a "catch all" failure if we don't know what exactly went wrong
  const factory AuthFailure.serverError() = ServerError;
  const factory AuthFailure.unknownError() = UnknownError;
  const factory AuthFailure.userNameAlreadyInUse() = UserNameAlreadyInUse;
  const factory AuthFailure.tooManyRequests() = TooManyRequests;
  const factory AuthFailure.notVerified() = NotVerified;
  const factory AuthFailure.disabledAccount() = DisabledAccount;
  const factory AuthFailure.noInternet() = NoInterenet;
  const factory AuthFailure.errorWhileMakingRequest() = ErrorWhileMakingRequest;
  const factory AuthFailure.invalidEmailAndPasswordCombination() =
      InvalidEmailAndPasswordCombination;
}