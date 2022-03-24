// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'routes.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    SplashPageRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
          routeData: routeData, child: const SplashPage());
    },
    AuthWrapperRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
          routeData: routeData, child: const AuthWrapper());
    },
    HomeRootRoute.name: (routeData) {
      final args = routeData.argsAs<HomeRootRouteArgs>();
      return AdaptivePage<dynamic>(
          routeData: routeData, child: HomeRoot(args.patient, key: args.key));
    },
    SignInRoute.name: (routeData) {
      return AdaptivePage<dynamic>(routeData: routeData, child: const SignIn());
    },
    RegisterRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
          routeData: routeData, child: const Register());
    },
    HomePageRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
          routeData: routeData, child: const HomePage());
    },
    HospitalsListRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
          routeData: routeData, child: const HospitalsList());
    },
    DoctorsListRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
          routeData: routeData, child: const DoctorsList());
    },
    BookAppointmentRoute.name: (routeData) {
      final args = routeData.argsAs<BookAppointmentRouteArgs>(
          orElse: () => const BookAppointmentRouteArgs());
      return AdaptivePage<dynamic>(
          routeData: routeData,
          child: BookAppointment(key: args.key, symptoms: args.symptoms));
    },
    DoctorDetailRoute.name: (routeData) {
      final args = routeData.argsAs<DoctorDetailRouteArgs>();
      return AdaptivePage<dynamic>(
          routeData: routeData,
          child: DoctorDetail(key: args.key, doctors: args.doctors));
    },
    ReportsRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
          routeData: routeData, child: const Reports());
    },
    BillsRoute.name: (routeData) {
      return AdaptivePage<dynamic>(routeData: routeData, child: const Bills());
    },
    HomeTabRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
          routeData: routeData, child: const HomeTab());
    },
    ProfileRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
          routeData: routeData, child: const Profile());
    },
    AppointmentsRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
          routeData: routeData, child: const Appointments());
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(SplashPageRoute.name, path: '/'),
        RouteConfig(AuthWrapperRoute.name, path: '/auth-wrapper', children: [
          RouteConfig(SignInRoute.name,
              path: '', parent: AuthWrapperRoute.name),
          RouteConfig(RegisterRoute.name,
              path: 'Register', parent: AuthWrapperRoute.name)
        ]),
        RouteConfig(HomeRootRoute.name, path: '/home-root', children: [
          RouteConfig(HomePageRoute.name,
              path: '',
              parent: HomeRootRoute.name,
              children: [
                RouteConfig(HomeTabRoute.name,
                    path: 'home-tab', parent: HomePageRoute.name),
                RouteConfig(ProfileRoute.name,
                    path: 'Profile', parent: HomePageRoute.name),
                RouteConfig(AppointmentsRoute.name,
                    path: 'Appointments', parent: HomePageRoute.name)
              ]),
          RouteConfig(HospitalsListRoute.name,
              path: 'hospitals-list', parent: HomeRootRoute.name),
          RouteConfig(DoctorsListRoute.name,
              path: 'doctors-list', parent: HomeRootRoute.name),
          RouteConfig(BookAppointmentRoute.name,
              path: 'book-appointment', parent: HomeRootRoute.name),
          RouteConfig(DoctorDetailRoute.name,
              path: 'doctor-detail', parent: HomeRootRoute.name),
          RouteConfig(ReportsRoute.name,
              path: 'Reports', parent: HomeRootRoute.name),
          RouteConfig(BillsRoute.name,
              path: 'Bills', parent: HomeRootRoute.name)
        ])
      ];
}

/// generated route for
/// [SplashPage]
class SplashPageRoute extends PageRouteInfo<void> {
  const SplashPageRoute() : super(SplashPageRoute.name, path: '/');

  static const String name = 'SplashPageRoute';
}

/// generated route for
/// [AuthWrapper]
class AuthWrapperRoute extends PageRouteInfo<void> {
  const AuthWrapperRoute({List<PageRouteInfo>? children})
      : super(AuthWrapperRoute.name,
            path: '/auth-wrapper', initialChildren: children);

  static const String name = 'AuthWrapperRoute';
}

/// generated route for
/// [HomeRoot]
class HomeRootRoute extends PageRouteInfo<HomeRootRouteArgs> {
  HomeRootRoute(
      {required Patient patient, Key? key, List<PageRouteInfo>? children})
      : super(HomeRootRoute.name,
            path: '/home-root',
            args: HomeRootRouteArgs(patient: patient, key: key),
            initialChildren: children);

  static const String name = 'HomeRootRoute';
}

class HomeRootRouteArgs {
  const HomeRootRouteArgs({required this.patient, this.key});

  final Patient patient;

  final Key? key;

  @override
  String toString() {
    return 'HomeRootRouteArgs{patient: $patient, key: $key}';
  }
}

/// generated route for
/// [SignIn]
class SignInRoute extends PageRouteInfo<void> {
  const SignInRoute() : super(SignInRoute.name, path: '');

  static const String name = 'SignInRoute';
}

/// generated route for
/// [Register]
class RegisterRoute extends PageRouteInfo<void> {
  const RegisterRoute() : super(RegisterRoute.name, path: 'Register');

  static const String name = 'RegisterRoute';
}

/// generated route for
/// [HomePage]
class HomePageRoute extends PageRouteInfo<void> {
  const HomePageRoute({List<PageRouteInfo>? children})
      : super(HomePageRoute.name, path: '', initialChildren: children);

  static const String name = 'HomePageRoute';
}

/// generated route for
/// [HospitalsList]
class HospitalsListRoute extends PageRouteInfo<void> {
  const HospitalsListRoute()
      : super(HospitalsListRoute.name, path: 'hospitals-list');

  static const String name = 'HospitalsListRoute';
}

/// generated route for
/// [DoctorsList]
class DoctorsListRoute extends PageRouteInfo<void> {
  const DoctorsListRoute() : super(DoctorsListRoute.name, path: 'doctors-list');

  static const String name = 'DoctorsListRoute';
}

/// generated route for
/// [BookAppointment]
class BookAppointmentRoute extends PageRouteInfo<BookAppointmentRouteArgs> {
  BookAppointmentRoute({Key? key, List<String> symptoms = const []})
      : super(BookAppointmentRoute.name,
            path: 'book-appointment',
            args: BookAppointmentRouteArgs(key: key, symptoms: symptoms));

  static const String name = 'BookAppointmentRoute';
}

class BookAppointmentRouteArgs {
  const BookAppointmentRouteArgs({this.key, this.symptoms = const []});

  final Key? key;

  final List<String> symptoms;

  @override
  String toString() {
    return 'BookAppointmentRouteArgs{key: $key, symptoms: $symptoms}';
  }
}

/// generated route for
/// [DoctorDetail]
class DoctorDetailRoute extends PageRouteInfo<DoctorDetailRouteArgs> {
  DoctorDetailRoute({Key? key, required Doctors doctors})
      : super(DoctorDetailRoute.name,
            path: 'doctor-detail',
            args: DoctorDetailRouteArgs(key: key, doctors: doctors));

  static const String name = 'DoctorDetailRoute';
}

class DoctorDetailRouteArgs {
  const DoctorDetailRouteArgs({this.key, required this.doctors});

  final Key? key;

  final Doctors doctors;

  @override
  String toString() {
    return 'DoctorDetailRouteArgs{key: $key, doctors: $doctors}';
  }
}

/// generated route for
/// [Reports]
class ReportsRoute extends PageRouteInfo<void> {
  const ReportsRoute() : super(ReportsRoute.name, path: 'Reports');

  static const String name = 'ReportsRoute';
}

/// generated route for
/// [Bills]
class BillsRoute extends PageRouteInfo<void> {
  const BillsRoute() : super(BillsRoute.name, path: 'Bills');

  static const String name = 'BillsRoute';
}

/// generated route for
/// [HomeTab]
class HomeTabRoute extends PageRouteInfo<void> {
  const HomeTabRoute() : super(HomeTabRoute.name, path: 'home-tab');

  static const String name = 'HomeTabRoute';
}

/// generated route for
/// [Profile]
class ProfileRoute extends PageRouteInfo<void> {
  const ProfileRoute() : super(ProfileRoute.name, path: 'Profile');

  static const String name = 'ProfileRoute';
}

/// generated route for
/// [Appointments]
class AppointmentsRoute extends PageRouteInfo<void> {
  const AppointmentsRoute()
      : super(AppointmentsRoute.name, path: 'Appointments');

  static const String name = 'AppointmentsRoute';
}
