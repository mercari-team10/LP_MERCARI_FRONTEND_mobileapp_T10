import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';

import '../../infrastructure/failures/api_failure.dart';

class Toast implements FlushbarHelper {

	static Duration _animationDuration() => const Duration(milliseconds: 500);

  static Flushbar<dynamic> createApiError(ApiFailure apiFailure,
          {Duration? duration}) =>
      createError(
        message: apiFailure.map(
            serverError: (_) => 'A server error occurred',
            unknownError: (_) => 'An unknown error occurred',
            someThingWrong: (_) =>
                'Something went wrong while making your request',
            failTofetchRequest: (_) =>
                "Not able to fetch your request now. Please try again later!",
            errorWhileMakingRequest: (_) =>
                'An error occurred while proceeding with your request',
            noInternet: (_) => 'Seems like you are offline 😑'),
      );

	// static Flushbar<dynamic> createDBError(DBFailure dbFailure,
  //         {Duration? duration}) => createError(
	// 					message: dbFailure.map(
	// 						unknownError: (_) => 'An unknown error occurred while proceeding with your request', 
	// 						dataNotExists: (_) => "We have no records for the requested request"
	// 					));

  static Flushbar createSuccess(
      {required String message,
      String? title,
      Duration duration = const Duration(seconds: 3)}) {
    return Flushbar(
      title: title,
      message: message,
      icon: const Icon(
        Icons.check_circle,
        color: Colors.green,
      ),
      leftBarIndicatorColor: Colors.green,
			animationDuration: _animationDuration(),
      duration: duration,
    );
  }

  /// Get an information notification flushbar
  static Flushbar createInformation(
      {required String message,
      String?title,
      Duration duration = const Duration(seconds: 3)}) {
    return Flushbar(
      title: title,
      message: message,
      icon: const Icon(
        Icons.info_outline,
        size: 28.0,
        color: Colors.blue,
      ),
			animationDuration: _animationDuration(),
      leftBarIndicatorColor: Colors.blue,
      duration: duration,
    );
  }

  /// Get a error notification flushbar
  static Flushbar createError(
      {required String message,
      String? title,
      Duration duration = const Duration(seconds: 3)}) {
    return Flushbar(
      title: title,
      message: message,
      icon: const Icon(
        Icons.warning,
        size: 28.0,
        color: Colors.red,
      ),
      animationDuration: _animationDuration(),
      leftBarIndicatorColor: Colors.red,
      duration: duration,
    );
  }

  /// Get a flushbar that can receive a user action through a button.
  static Flushbar createAction(
      {required String message,
      required MaterialButton button,
      String? title,
      Duration duration = const Duration(seconds: 3)}) {
    return Flushbar(
      title: title,
      message: message,
      duration: duration,
			animationDuration: _animationDuration(),
      mainButton: button,
    );
  }

  // Get a flushbar that shows the progress of a async computation.
  static Flushbar createLoading(
      {required String message,
      required LinearProgressIndicator linearProgressIndicator,
      String? title,
			IconData? iconData,
      Duration duration = const Duration(seconds: 3),
      AnimationController? progressIndicatorController,
      Color? progressIndicatorBackgroundColor}) {
    return Flushbar(
      title: title,
      message: message,
      icon: Icon(
        iconData??Icons.cloud_upload,
        color: Colors.blue[300],
      ),
			animationDuration: _animationDuration(),
      duration: duration,
      showProgressIndicator: true,
      progressIndicatorController: progressIndicatorController,
      progressIndicatorBackgroundColor: progressIndicatorBackgroundColor,
    );
  }

  /// Get a flushbar that shows an user input form.
  // static Flushbar createInputFlushbar({required Form textForm}) {
  //   return Flushbar(
  //     duration: null,
  //     userInputForm: textForm,
  //   );
  // }
}
