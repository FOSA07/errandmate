import 'package:go_router/go_router.dart';

import '../view/screen/authentication/create.account.dart';
import '../view/screen/authentication/create.password.dart';
import '../view/screen/authentication/login.dart';
import '../view/screen/authentication/otp.dart';
import '../view/screen/authentication/pin.changed.dart';
import '../view/screen/authentication/reset.password.dart';

class AuthenticationRoutes {

  static List<RouteBase> getAuthRoutes () {

    List<RouteBase> routes = [
      GoRoute(
        path: 'login',
        name: 'signin',
        builder: (context, state) => const Login(),
      ),
      GoRoute(
        path: 'create-account',
        name: 'signup',
        builder: (context, state) => const CreateAccount(),
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
      ),
      GoRoute(
        path: 'create-password',
        name: 'createpassword',
        builder: (context, state) => const CreatePassword(),
      ),
      GoRoute(
        path: 'pin-changed',
        name: 'pinchanged',
        builder: (context, state) => const PinChanged(),
      )
    ];

    return routes;
  }
}