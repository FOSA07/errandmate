import 'package:go_router/go_router.dart';

import '../../utils/serviceLocator/service.locator.dart';

mixin ViewRouter {

  goto(
    String path,
    { bool canBack = true }
  ) {
    canBack 
    ?  locator<GoRouter>().routerDelegate.navigatorKey.currentContext!.push(path)
    : locator<GoRouter>().routerDelegate.navigatorKey.currentContext!.go(path);
  }

}