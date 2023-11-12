import 'package:flutter/widgets.dart';

class NavigationService {
  static BuildContext get context {
    return navigatorKey.currentContext!;
  }

  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
}
