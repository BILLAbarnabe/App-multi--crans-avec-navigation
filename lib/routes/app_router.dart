import 'package:go_router/go_router.dart';

import '../screens/booking_screen.dart';
import '../screens/detail_screen.dart';
import '../screens/home_screen.dart';
import '../screens/list_screen.dart';

final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/destinations',
      builder: (context, state) => const ListScreen(),
    ),
    GoRoute(
      path: '/destination/:id',
      builder: (context, state) {
        final id = state.pathParameters['id'] ?? '';
        return DetailScreen(id: id);
      },
    ),
    GoRoute(
      path: '/booking/:id',
      builder: (context, state) {
        final id = state.pathParameters['id'] ?? '';
        return BookingScreen(destinationId: id);
      },
    ),
  ],
);
