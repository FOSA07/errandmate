import 'package:go_router/go_router.dart';

import '../view/screen/authentication/create.dart';
import '../view/screen/authentication/login.dart';
import '../view/screen/authentication/otp.dart';
import '../view/screen/authentication/reset.password.dart';

class AuthenticationRoutes {

  static List<RouteBase> getAuthRoutes () {

    List<RouteBase> routes = [
      GoRoute(
        path: 'login',
        name: 'signin',
        builder: (context, state) => Login(),
      ),
      GoRoute(
        path: 'create-account',
        name: 'signup',
        builder: (context, state) => CreateAccount(),
      ),
      GoRoute(
        path: 'reset-password',
        name: 'resetpassword',
        builder: (context, state) => ResetPassword(),
      ),
      GoRoute(
        path: 'otp',
        name: 'otp',
        builder: (context, state) => const OTP(),
      )
    ];

    return routes;
  }
}