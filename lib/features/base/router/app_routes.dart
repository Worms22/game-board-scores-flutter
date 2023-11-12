// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/widgets.dart';

abstract class Routes {
  static const String users = '/users';
  static const String userDetail = '/detail';
  static final _UserDestinations userDestinations = _UserDestinations(users);

  static const String home = '/home';

  static const String splash = '/splash';

  static const String start = '/start';

  static const String mainPage = '/mainPage';

  static const String login = '/login';

  static const String registration = '/registration';
  static const String registrationStep2 = '/registrationStep2';

  static const String saved = '/saved';

  static const String profile = '/profile';
  static const String changePassword = '/changePassword';


}

@immutable
abstract class _Destinations {
  _Destinations(this.root)
      : assert(
          root.startsWith('/'),
          '_Destinations.root must begin with: `/`',
        );

  final String root;

  /// Concatenate a route with the root.
  String call(String route) {
    assert(route.startsWith('/'), 'Route must begin with: `/`');
    return root + route;
  }
}

class _UserDestinations extends _Destinations {
  _UserDestinations(super.root);

  /// Result: `/auth/login`
  String get detail => this(Routes.userDetail);
}
