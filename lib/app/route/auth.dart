import 'package:go_router/go_router.dart';

import '../view/screen/authentication/create.account.dart';
import '../view/screen/authentication/create.password.dart';
import '../view/screen/authentication/login.dart';
import '../view/screen/authentication/otp.dart';
import '../view/screen/authentication/pin.changed.dart';
import '../view/screen/authentication/reset.password.dart';

class AuthenticationRoutes {

  static List<RouteBase> getAuthRoutes () => <RouteBase> [
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
      path: 'otp/:tkn/:uid',
      name: 'otp',
      builder: (context, state) { 
        
        final tkn = state.pathParameters['tkn'];
        final uid = state.pathParameters['uid'];

        return OTP(token: tkn.toString(), uid: uid.toString(),); },
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
}