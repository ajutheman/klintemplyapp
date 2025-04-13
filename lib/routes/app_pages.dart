import 'package:flutter/cupertino.dart';

// import 'package:provider_man_app/app/view/booking/booking_detail.dart';
// import 'package:provider_man_app/app/view/chat/chat_screen.dart';
import '../view/home/home_screen.dart';
import '../view/login/forgot_password.dart';
import '../view/login/login_screen.dart';
import '../view/login/reset_password.dart';
import '../view/profile/edit_profile_screen.dart';
import '../view/profile/my_profile_screen.dart';
import '../view/profile/privacy_screen.dart';
import '../view/profile/report_screen.dart';
import '../view/profile/support_screen.dart';
import '../view/profile/term_of_use_screen.dart';
import '../view/signup/select_country.dart';
import '../view/signup/signup_screen.dart';
import '../view/signup/verify_screen.dart';
import 'app_routes.dart';

class AppPages {
  static const initialRoute = Routes.homeRoute;
  static Map<String, WidgetBuilder> routes = {
    //Routes.homeRoute: (context) => const SplashScreen(),
    Routes.homeRoute: (context) => const HomeScreen(),
    Routes.loginRoute: (context) => const LoginScreen(),
    Routes.forgotRoute: (context) => const ForgotPassword(),
    Routes.resetRoute: (context) => const ResetPassword(),
    Routes.signupRoute: (context) => const SignUpScreen(),
    Routes.selectCountryRoute: (context) => const SelectCountry(),
    Routes.verifyRoute: (context) => const VerifyScreen(),
    Routes.homeScreenRoute: (context) => const HomeScreen(),
    // Routes.bookingDetailRoute: (context) => const BookingDetail(),
    // Routes.chatRoute: (context) => const ChatScreen(),
    Routes.myProfileScreenRoute: (context) => const MyProfileScreen(),
    Routes.editProfileScreenRoute: (context) => const EditProfileScreen(),
    Routes.privacyRoute: (context) => const PrivacyScreen(),
    Routes.termOfUseRoute: (context) => const TermOfUseScreen(),
    Routes.supportRoute: (context) => const SupportScreen(),
    Routes.reportRoute: (context) => const ReportScreen()
  };
}
