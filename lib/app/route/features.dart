import 'package:go_router/go_router.dart';

class FeaturesRoutes {

  static List<RouteBase> getAuthRoutes () => <RouteBase>[
    GoRoute(
      path: 'home',
      name: 'home'
    ),
    
  ];
}
