// import 'package:flutter/material.dart';
// import 'package:kleanitemployee/routes/app_pages.dart';
//
// // import 'app/routes/app_pages.dart';
// import 'base/color_data.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatefulWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   State<MyApp> createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(
//         scaffoldBackgroundColor: backGroundColor, // Global background color
//         primaryColor: greenColor,
//         buttonTheme: ButtonThemeData(
//           buttonColor: greenColor, // Default button color
//         ),
//       ),
//       debugShowCheckedModeBanner: false,
//       initialRoute: "/",
//       routes: AppPages.routes,
//     );
//   }
// }
//
// import 'package:flutter/material.dart';
// import 'package:kleanitemployee/routes/app_pages.dart';
// import 'package:kleanitemployee/routes/app_routes.dart';
//
// import 'base/color_data.dart';
// import 'data/prefs.dart';
// // import 'utils/prefs.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatefulWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   State<MyApp> createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   String initialRoute = Routes.loginRoute; // Default to LoginScreen
//
//   @override
//   void initState() {
//     super.initState();
//     checkLogin();
//   }
//
//   Future<void> checkLogin() async {
//     final token = await Prefs.getToken();
//     setState(() {
//       initialRoute = token != null ? Routes.homeScreenRoute : Routes.loginRoute;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(
//         scaffoldBackgroundColor: backGroundColor,
//         primaryColor: greenColor,
//         buttonTheme: ButtonThemeData(
//           buttonColor: greenColor,
//         ),
//       ),
//       debugShowCheckedModeBanner: false,
//       initialRoute: initialRoute,
//       routes: AppPages.routes,
//     );
//   }
// }
//
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:kleanitemployeeapp/routes/app_pages.dart';
// import 'package:kleanitemployeeapp/routes/app_routes.dart';
//
// // import 'package:kleanitemployee/routes/app_pages.dart';
// // import 'package:kleanitemployee/routes/app_routes.dart';
//
// import 'base/color_data.dart';
// import 'data/prefs.dart';
// import 'firebase_options.dart';
// import 'initialization_settings.dart';
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(); // ✅ Initialize Firebase before runApp
//   FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
//
//   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
//   FirebaseMessaging.onMessage.listen(_firebaseMessagingForegroundHandler);
//   // 🔐 Setup Stripe
//   await setupFlutterNotifications();
// }
//
// Future<void> setupFlutterNotifications() async {
//   const AndroidInitializationSettings initializationSettingsAndroid =
//       AndroidInitializationSettings('@mipmap/ic_launcher');
//
//   const InitializationSettings initializationSettings = InitializationSettings(
//     android: initializationSettingsAndroid,
//   );
//
//   await flutterLocalNotificationsPlugin.initialize(initializationSettings);
// }
//
// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//   showFlutterNotification(message);
// }
//
// Future<void> _firebaseMessagingForegroundHandler(RemoteMessage message) async {
//   showFlutterNotification(message);
// }
//
// class MyApp extends StatefulWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   State<MyApp> createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   String initialRoute = Routes.loginRoute; // Default route
//
//   @override
//   void initState() {
//     super.initState();
//     checkLogin();
//   }
//
//   Future<void> checkLogin() async {
//     final token = await Prefs.getToken();
//     setState(() {
//       initialRoute = token != null ? Routes.homeScreenRoute : Routes.loginRoute;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(
//         scaffoldBackgroundColor: backGroundColor,
//         primaryColor: greenColor,
//         buttonTheme: ButtonThemeData(buttonColor: greenColor),
//       ),
//       debugShowCheckedModeBanner: false,
//       initialRoute: initialRoute,
//       routes: AppPages.routes,
//     );
//   }
// }
//
// import 'package:firebase_analytics/firebase_analytics.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
//
// import 'base/color_data.dart';
// import 'data/prefs.dart';
// import 'firebase_options.dart';
// import 'routes/app_pages.dart';
// import 'routes/app_routes.dart';
//
// // Optional if you want analytics tracking
// final FirebaseAnalytics analytics = FirebaseAnalytics.instance;
// // 🔔 Local notifications plugin
// final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//     FlutterLocalNotificationsPlugin();
//
// /// Background FCM handler
// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
//   showFlutterNotification(message);
// }
//
// /// Show notification
// void showFlutterNotification(RemoteMessage message) {
//   final notification = message.notification;
//   final android = message.notification?.android;
//   if (notification != null && android != null) {
//     flutterLocalNotificationsPlugin.show(
//       notification.hashCode,
//       notification.title,
//       notification.body,
//       const NotificationDetails(
//         android: AndroidNotificationDetails(
//           'default_channel', // Channel ID
//           'Default', // Channel name
//           channelDescription: 'Default channel for notifications',
//           importance: Importance.max,
//           priority: Priority.high,
//         ),
//       ),
//     );
//   }
// }
//
// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
//   FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
//
//   // 🔧 Android local notifications setup
//   const androidInit = AndroidInitializationSettings('@mipmap/ic_launcher');
//   const initSettings = InitializationSettings(android: androidInit);
//   await flutterLocalNotificationsPlugin.initialize(
//     initSettings,
//     // onSelectNotification: (payload) async {
//     //   // Navigate if needed
//     //   // You can also parse the payload here
//     // },
//   );
//
//   runApp(const MyApp());
// }
//
// class MyApp extends StatefulWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   State<MyApp> createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   String initialRoute = Routes.loginRoute;
//
//   @override
//   void initState() {
//     super.initState();
//     checkLogin();
//
//     // 🎯 Foreground notifications
//     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//       showFlutterNotification(message);
//     });
//
//     // 🧭 When app is opened by tapping a notification
//     FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
//       // Example: Go to Home on notification tap
//       Navigator.pushNamed(context, Routes.homeScreenRoute);
//     });
//   }
//
//   Future<void> checkLogin() async {
//     final token = await Prefs.getToken();
//     setState(() {
//       initialRoute = token != null ? Routes.homeScreenRoute : Routes.loginRoute;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Kleanit Employee App',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         scaffoldBackgroundColor: backGroundColor,
//         primaryColor: greenColor,
//         buttonTheme: ButtonThemeData(buttonColor: greenColor),
//       ),
//       initialRoute: initialRoute,
//       routes: AppPages.routes,
//     );
//   }
// }

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'base/color_data.dart';
import 'data/prefs.dart';
import 'firebase_options.dart';
import 'routes/app_pages.dart';
import 'routes/app_routes.dart';

final FirebaseAnalytics analytics = FirebaseAnalytics.instance;

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

/// Background FCM handler
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  showFlutterNotification(message);
}

/// Show notification
void showFlutterNotification(RemoteMessage message) {
  final notification = message.notification;
  final android = message.notification?.android;
  if (notification != null && android != null) {
    flutterLocalNotificationsPlugin.show(
      notification.hashCode,
      notification.title,
      notification.body,
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'default_channel', // Channel ID
          'Default', // Channel name
          channelDescription: 'Default channel for notifications',
          importance: Importance.max,
          priority: Priority.high,
        ),
      ),
    );
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  const androidInit = AndroidInitializationSettings('@mipmap/ic_launcher');
  const initSettings = InitializationSettings(android: androidInit);
  await flutterLocalNotificationsPlugin.initialize(initSettings);
  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    final screen = message.data['screen'];
    final orderId = message.data['orderId'];

    if (screen == 'orderDetails' && orderId != null) {
      // Navigator.pushNamed(
      //   context,
      //   Routes.bookingDetails,
      //   arguments: int.parse(orderId),
      // );
      // navigatorKey.currentState?.pushNamed(Routes.tabBooking);
      print("object");
      print("object");
    }
  });

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String initialRoute = Routes.loginRoute;

  @override
  void initState() {
    super.initState();
    checkLogin();

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      showFlutterNotification(message);
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      Navigator.pushNamed(context, Routes.homeScreenRoute);
    });
  }

  Future<void> checkLogin() async {
    final token = await Prefs.getToken();
    setState(() {
      initialRoute = token != null ? Routes.homeScreenRoute : Routes.loginRoute;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kleanit Employee App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: backGroundColor,
        primaryColor: greenColor,
        buttonTheme: ButtonThemeData(buttonColor: greenColor),
      ),
      initialRoute: initialRoute,
      routes: AppPages.routes,
    );
  }
}
