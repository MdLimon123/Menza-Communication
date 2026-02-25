import 'package:flutter_extension/views/screen/Splash/onboarding/onboarding_screen.dart';
import 'package:flutter_extension/views/screen/Splash/onboarding/welcome_screen.dart';
import 'package:flutter_extension/views/screen/auth/email_or_phone_verify_screen.dart';
import 'package:flutter_extension/views/screen/auth/login_screen.dart';
import 'package:flutter_extension/views/screen/auth/signup_screen.dart';
import 'package:flutter_extension/views/screen/home/home_screen.dart';
import 'package:get/get.dart';

import '../views/screen/splash/splash_screen.dart';

class AppRoutes {
  static String splashScreen = "/splash_screen";
  static String homeScreen = "/home_screen";
  static String welcomeScreen = "/welcome_screen";
  static String onboardingScreen = "/onboarding_screen";
  static String loginScreen = "/login_screen";
  static String signupScreen = "/signup_screen";
  static String emailOrPhoneVerifyScreen = "/email_or_phone_verify_screen";

  static List<GetPage> page = [
    GetPage(name: splashScreen, page: () => const SplashScreen()),
    GetPage(name: onboardingScreen, page: () => const OnboardingScreen()),
    GetPage(name: welcomeScreen, page: () => const WelcomeScreen()),
    GetPage(name: loginScreen, page: () => const LoginScreen()),
    GetPage(name: signupScreen, page: () => const SignupScreen()),
    GetPage(
      name: emailOrPhoneVerifyScreen,
      page: () => const EmailOrPhoneVerifyScreen(),
    ),
    GetPage(name: homeScreen, page: () => const HomeScreen()),
  ];
}
