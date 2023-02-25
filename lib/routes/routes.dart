import 'package:betterheroapp/screens/donationPage/donation.dart';
import 'package:betterheroapp/screens/loginPage/phonelogin.dart';
import 'package:betterheroapp/screens/ngoprofilepage/ngoprofilehomepage.dart';
import 'package:betterheroapp/screens/profilepage/profilepage.dart';
import 'package:betterheroapp/screens/searchpage/searchpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:betterheroapp/newuserboardingpage/newuserboardingpage.dart';
import 'package:betterheroapp/screens/onboardingPage/onboardingpage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../screens/homePage/home.dart';
import '../screens/loginPage/loginpage.dart';

class AppRouter {
  SharedPreferences? preferences;
  AppRouter({
    required this.preferences,
  });

  GoRouter get router => _goRouter;

  late final GoRouter _goRouter = GoRouter(
    initialLocation: '/',
    routes: <RouteBase>[
      GoRoute(
        path: '/search',
        name: 'searchpage',
        builder: (context, state) {
          return SearchPage(
            searchResult: state.queryParams["searchText"],
          );
        },
      ),
      GoRoute(
        path: '/profile',
        name: 'profilePage',
        builder: (context, state) {
          return UserProfilePage(
            profilePic: state.queryParams["profilePic"],
            name: state.queryParams["name"],
          );
        },
      ),
      GoRoute(
        path: '/userboardingpage',
        name: 'userboarding',
        builder: (context, state) {
          return NewUserOnBoardingPage(
            sharedPreferences: preferences,
          );
        },
      ),
      GoRoute(
        path: '/phonelogin',
        name: 'phonelogin',
        builder: (context, state) {
          return const PhoneLogin();
        },
      ),
      GoRoute(
        path: '/login',
        name: 'login',
        builder: (context, state) {
          return const Login();
        },
      ),
      GoRoute(
        path: '/onboard',
        name: 'onboard',
        builder: (context, state) {
          return const OnBoardingPage();
        },
      ),
      GoRoute(
        name: 'home',
        path: '/',
        builder: (context, state) {
          return const Home();
        },
        routes: [
          GoRoute(
            path: 'ngoprofile',
            name: 'ngoprofilePage',
            builder: (context, state) {
              return NGOProfileHomePage(
                ngoUID: state.queryParams["ngoUID"],
                ngoBio: state.queryParams["ngoBio"],
                ngoCauses: state.queryParams['ngoCauses'],
                ngoLogoPhoto: state.queryParams['ngoLogoPhoto'],
                ngoName: state.queryParams['ngoName'],
                ngoRating: state.queryParams['ngoRating'],
                ngoTeamPhoto: state.queryParams['ngoTeamPhoto'],
                ngoWorkingPhotos: state.extra as List<dynamic>,
              );
            },
            routes: [
              GoRoute(
                path: 'donationpage',
                name: 'donationpage',
                builder: (context, state) {
                  return DonationFormPage();
                },
              ),
            ],
          ),
        ],
      ),
      // GoRoute(
      //   name: 'searchScreen',
      //   path: '/searching/:searchText',
      //   builder: (context, state) => SearchSection(
      //     state.params['searchText'].toString(),
      //   ),
      // ),
    ],
    redirect: (BuildContext context, GoRouterState state) {
      final User? loggedIn = FirebaseAuth.instance.currentUser;
      final bool logggingIn = state.subloc == '/login';
      final bool? onBoardingPage = preferences!.getBool('onboarding');
      final onBoardingRoute = state.subloc == '/userboardingpage';

      if (onBoardingPage == null || onBoardingPage == false) {
        return onBoardingRoute ? null : '/userboardingpage';
      }
      if (loggedIn == null) {
        return logggingIn ? null : '/login';
      }
      return null;
    },
  );
}
