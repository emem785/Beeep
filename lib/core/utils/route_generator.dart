import 'package:beep/core/widgets/map_home.dart';
import 'package:beep/presentation/Screens/AppPages/home_screen.dart';
import 'package:beep/presentation/Screens/AppPages/menu_pages/upgrade_plan.dart';
import 'package:beep/presentation/Screens/AppPages/menu_pages/upgrade_plan2.dart';
import 'package:beep/presentation/Screens/Authentication/Login/Forgot_Password/forgot_password.dart';
import 'package:beep/presentation/Screens/Authentication/Login/Forgot_Password/forgot_password_five.dart';
import 'package:beep/presentation/Screens/Authentication/Login/Forgot_Password/forgot_password_four.dart';
import 'package:beep/presentation/Screens/Authentication/Login/Forgot_Password/forgot_password_three.dart';
import 'package:beep/presentation/Screens/Authentication/Login/Forgot_Password/forgot_password_two.dart';
import 'package:beep/presentation/Screens/Authentication/Login/login_one.dart';
import 'package:beep/presentation/Screens/Authentication/Register/register_one.dart';
import 'package:beep/presentation/Screens/Authentication/Register/register_three.dart';
import 'package:beep/presentation/Screens/Authentication/Register/register_two.dart';
import 'package:beep/presentation/Screens/Authentication/Register/setup_beep/setup_beep_four.dart';
import 'package:beep/presentation/Screens/Authentication/Register/setup_beep/setup_beep_three.dart';
import 'package:beep/presentation/Screens/Authentication/auth_control.dart';
import 'package:beep/presentation/Screens/Authentication/splash_screen.dart';
import 'package:beep/presentation/Screens/MenuPages/profile_pages/change_password.dart';
import 'package:beep/presentation/Screens/MenuPages/profile_pages/change_password_2.dart';
import 'package:beep/presentation/Screens/MenuPages/profile_pages/profiles_menu.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  RouteFactory generateRoutes() {
    return (settings) {
      final Map<String, dynamic> args = settings.arguments;
      Widget screen;
      switch (settings.name) {
        case '/':
          screen = AuthController();
          break;

        case '/SplashScreen':
          screen = SplashScreen();
          break;

        case '/HomeScreen':
          screen = HomeScreen();
          break;
        //Registration Pages

        case '/RegisterOne':
          screen = RegisterOne();
          break;

        case '/RegisterTwo':
          screen = RegisterTwo(
            phone: args["phone"],
          );
          break;

        case '/RegisterThree':
          screen = RegisterThree();
          break;

        case '/SetupBeepThree':
          screen = SetupBeepThree();
          break;

        case '/SetupBeepFour':
          screen = SetupBeepFour();
          break;

        //Login Pages

        case '/LoginOne':
          screen = LoginOne();
          break;

        //Forgot Password

        case '/ForgotPassword':
          screen = ForgotPassword();
          break;

        case '/ForgotPassword2':
          screen = ForgotPasswordTwo();
          break;

        case '/ForgotPassword3':
          screen = ForgotPasswordThree();
          break;

        case '/ForgotPassword4':
          screen = ForgotPasswordFour();
          break;

        case '/ForgotPassword5':
          screen = ForgotPasswordFive();
          break;

        //Menu Pages

        case 'UpgradePlanTwo':
          screen = UpgradePlan2();
          break;

        case 'ChangePassword':
          screen = ChangePassword();
          break;

        case 'ChangePasswordTwo':
          screen = ChangePassword2();
          break;

        case 'UpgradePlan':
          screen = UpgradePlan();
          break;

        case 'ProfileMenu':
          screen = ProfileMenu(
            user: args["user"],
          );
          break;
      }
      return MaterialPageRoute(builder: (context) => screen);
    };
  }
}