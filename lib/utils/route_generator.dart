import 'package:beep/Screens/AppPages/menu_pages/upgrade_plan2.dart';
import 'package:beep/Screens/Authentication/Login/Forgot%20Password/forgot_password.dart';
import 'package:beep/Screens/Authentication/Login/Forgot%20Password/forgot_password_four.dart';
import 'package:beep/Screens/Authentication/Login/Forgot%20Password/forgot_password_three.dart';
import 'package:beep/Screens/Authentication/Login/Forgot%20Password/forgot_password_two.dart';
import 'package:beep/Screens/MenuPages/payment%20Pages/card_page.dart';
import 'package:beep/Screens/MenuPages/payment%20Pages/card_page_one.dart';
import 'package:beep/Screens/MenuPages/payment%20Pages/card_page_one_plan.dart';
import 'package:beep/Screens/MenuPages/payment%20Pages/card_page_three.dart';
import 'package:beep/Screens/MenuPages/profile%20pages/change_password.dart';
import 'package:beep/Screens/MenuPages/profile%20pages/change_password_2.dart';
import 'package:beep/Screens/MenuPages/profile%20pages/profiles_menu.dart';
import 'package:flutter/cupertino.dart';

import 'package:beep/Screens/AppPages/home_screen.dart';
import 'package:beep/Screens/AppPages/menu_pages/upgrade_plan.dart';
import 'package:beep/Screens/Authentication/Login/Forgot%20Password/forgot_password_five.dart';

import 'package:beep/Screens/Authentication/Login/login_one.dart';
import 'package:beep/Screens/Authentication/Register/register_one.dart';
import 'package:beep/Screens/Authentication/Register/register_three.dart';
import 'package:beep/Screens/Authentication/Register/register_two.dart';
import 'package:beep/Screens/Authentication/Register/setup_beep/setup_beep.dart';
import 'package:beep/Screens/Authentication/Register/setup_beep/setup_beep_four.dart';

import 'package:beep/Screens/Authentication/Register/setup_beep/setup_beep_three.dart';
import 'package:beep/Screens/Authentication/Register/setup_beep/setup_beep_two.dart';

import 'package:beep/Screens/Authentication/splash_screen.dart';
import 'package:beep/Screens/MenuPages/payment%20Pages/card_page_edit.dart';
import 'package:beep/Screens/MenuPages/plan_page.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  RouteFactory generateRoutes() {
    return (settings) {
      final Map<String, dynamic> args = settings.arguments;
      Widget screen;
      switch (settings.name) {
        case '/':
          screen = SplashScreen();
          break;

        case '/HomeScreen':
          screen = HomeScreen(pageValue: args["pageValue"]);
          break;
        //Registration Pages

        case '/RegisterOne':
          screen = RegisterOne();
          break;

        case '/RegisterTwo':
          screen = RegisterTwo();
          break;

        case '/RegisterThree':
          screen = RegisterThree();
          break;

        case '/SetupPage':
          screen = SetupPage();
          break;

        case '/SetupBeepTwo':
          screen = SetupBeepTwo();
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

        case 'CardPage':
          screen = CardPage();
          break;

        case 'CardPageOne':
          screen = CardPageOne();
          break;

        case 'CardPageOnePlan':
          screen = CardPageOnePlan();
          break;

        case 'CardPageEdit':
          screen = CardPageEdit();
          break;

        case 'CardPageThree':
          screen = CardPageThree();

          break;

        case 'UpgradePlanTwo':
          screen = UpgradePlan2();
          break;

        case 'ChangePassword':
          screen = ChangePassword();
          break;

        case 'ChangePasswordTwo':
          screen = ChangePassword2();
          break;

        case 'PlanPage':
          screen = PlanPage();
          break;

        case 'UpgradePlan':
          screen = UpgradePlan();
          break;

        case 'ProfileMenu':
          screen = ProfileMenu(
            firstName: args["firstName"],
            lastName: args["lastName"],
            phonenumber: args["phoneNumber"],
            twitterhandle: args["twitterHandle"],
          );
          break;
      }
      return MaterialPageRoute(builder: (context) => screen);
    };
  }
}
