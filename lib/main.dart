import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'screens/booking_screen.dart';
import 'screens/detail_screen.dart';
import 'screens/home_screen.dart';
import 'screens/list_screen.dart';

class AppTheme {
  static final ValueNotifier<ThemeMode> themeMode = ValueNotifier(ThemeMode.system);

  static ThemeData get lightTheme => ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF4F46E5),
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: const Color(0xFFF5F7FF),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: false,
        ),
      );

  static ThemeData get darkTheme => ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF818CF8),
          brightness: Brightness.dark,
        ),
        scaffoldBackgroundColor: const Color(0xFF111827),
      );

  static void toggleTheme() {
    themeMode.value =
        themeMode.value == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
  }
}

final appRouter = GoRouter(
  routes: [
    GoRoute(
      name: 'home',
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      name: 'destinations',
      path: '/destinations',
      builder: (context, state) => const ListScreen(),
    ),
    GoRoute(
      name: 'destination-detail',
      path: '/destination/:id',
      builder: (context, state) => DetailScreen(
        id: state.pathParameters['id'] ?? '',
      ),
    ),
    GoRoute(
      name: 'booking',
      path: '/booking/:id',
      builder: (context, state) => BookingScreen(
        destinationId: state.pathParameters['id'] ?? '',
      ),
    ),
  ],
);

void main() {
  runApp(const ExploreApp());
}

class ExploreApp extends StatelessWidget {
  const ExploreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: AppTheme.themeMode,
      builder: (context, themeMode, _) {
        return MaterialApp.router(
          title: 'Explore Voyage',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: themeMode,
          routerConfig: appRouter,
        );
      },
    );
  }
}
