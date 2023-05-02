import 'package:go_router/go_router.dart';

class AppRouter {
  GoRouter router = GoRouter(routes: [
    GoRoute(
      path: '/',
      // builder: (context, state) => screen)
    ),
    GoRoute(
      path: '/login',
      // builder: (context, state) => loginPage
    ),
  ]);
}
