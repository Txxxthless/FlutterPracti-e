import 'package:flutter/material.dart';
import 'package:flutter_application_1/error_page.dart';
import 'package:flutter_application_1/home_page.dart';
import 'package:flutter_application_1/login_page.dart';
import 'package:flutter_application_1/page_one.dart';
import 'package:flutter_application_1/page_one_details.dart';
import 'package:flutter_application_1/page_two.dart';
import 'package:flutter_application_1/profile_page.dart';
import 'package:go_router/go_router.dart';

bool loggedIn = true;

void main() {
  runApp(
    AppWidget(),
  );
}

class AppWidget extends StatelessWidget {
  final _router = GoRouter(
    initialLocation: '/',
    errorBuilder: (context, state) => const ErrorPage(),
    redirect: (context, state) {
      if (!loggedIn) {
        return '/login';
      }
      return null;
    },
    routes: [
      GoRoute(
        name: HomePage.name,
        path: '/',
        builder: (context, state) => HomePage(),
        routes: [
          GoRoute(
            name: ProfilePage.name,
            path: 'profile/:id',
            builder: (context, state) {
              final id = state.pathParameters['id']!;
              return ProfilePage(id: int.parse(id));
            },
          ),
        ],
      ),
      GoRoute(
        name: PageOne.name,
        path: '/one',
        builder: (context, state) => PageOne(),
        routes: [
          GoRoute(
            name: PageOneDetails.name,
            path: 'details',
            builder: (context, state) => PageOneDetails(),
          ),
        ],
      ),
      GoRoute(
        name: PageTwo.name,
        path: '/two',
        builder: (context, state) {
          final extra = state.extra! as String;
          return PageTwo(greetings: extra);
        },
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => LoginPage(),
      ),
    ],
  );

  AppWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
        useMaterial3: true,
      ),
      routerConfig: _router,
    );
  }
}
