import 'package:betterheroapp/Routes/routes.dart';
import 'package:betterheroapp/routes/google_auth.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
  WidgetsFlutterBinding.ensureInitialized();

  // This is the last thing you need to add.
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseAnalytics analytics = await FirebaseAnalytics.instance;

  runApp(
    BetterHeroApp(
      sharedPreferences: sharedPreferences,
    ),
  );
}

class BetterHeroApp extends StatefulWidget {
  final SharedPreferences sharedPreferences;
  const BetterHeroApp({super.key, required this.sharedPreferences});

  @override
  State<BetterHeroApp> createState() => _BetterHeroAppState();
}

class _BetterHeroAppState extends State<BetterHeroApp> {
  Future permissionRequest() async {
    LocationPermission permission = await Geolocator.checkPermission();
    try {
      switch (permission) {
        case LocationPermission.denied:
          await Geolocator.requestPermission();
          break;

        default:
      }
    } catch (e) {
      print(e);
    }
  }

  Future deeplink() async {
    final PendingDynamicLinkData? initialLink =
        await FirebaseDynamicLinks.instance.getInitialLink();

    if (initialLink != null) {
      print("Link->" + initialLink.link.toString());
    } else {
      print("Link-> null");
    }
  }

  @override
  void initState() {
    super.initState();
    deeplink();
    permissionRequest();
  }

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => GoogleSignInProvider(),
        child: MultiProvider(
          providers: [
            Provider<AppRouter>(
                create: (_) => AppRouter(preferences: widget.sharedPreferences))
          ],
          child: Builder(
            builder: (context) {
              final GoRouter goRouter =
                  Provider.of<AppRouter>(context, listen: false).router;
              SystemChrome.setSystemUIOverlayStyle(
                SystemUiOverlayStyle(
                  statusBarColor: Colors.white,
                ),
              );
              return MaterialApp.router(
                debugShowCheckedModeBanner: false,
                routerConfig: goRouter,
              );
            },
          ),
        ),
      );
}
