import 'package:errandmate/app/view/screen/onboard/onboard.dart';
import 'package:go_router/go_router.dart';

import '../view/screen/authentication/login.dart';
import '../view/screen/splash.dart';
import 'auth.dart';
import 'redirects/splash.redirect.dart';

final GoRouter routes = GoRouter(
  initialLocation: '/splash',

  routes: [
    GoRoute(
      path: '/splash',
      name: 'splash',
      builder: (context, state) => const AppSplash(),
    ),
    GoRoute(
      path: '/errandmate',
      name: 'errandmate',
      builder: (context, state) => OnBoard(),
      redirect: (context, state) async {
        /// check user status
        /// ---- new user
        /// ---- current user
        bool result = await SplashRedirect.call();

        return result ? null : '/home';
      },
      
    ),
    GoRoute(
      path: '/auth',
      name: 'auth',
      builder: (context, state) => const Login(),

      routes: AuthenticationRoutes.getAuthRoutes(),
    ),
    
]);