import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_failure.freezed.dart';

@freezed
abstract class ApiFailure with _$ApiFailure {
	const factory ApiFailure.serverError() = ServerError;
  const factory ApiFailure.unknownError() = UnknownError;
  const factory ApiFailure.someThingWrong() = SomeThingWrong;
  const factory ApiFailure.failTofetchRequest() = FailTofetchRequest;
  const factory ApiFailure.errorWhileMakingRequest() = ErrorWhileMakingRequest;
  const factory ApiFailure.noInternet() = NoInterenet;
}