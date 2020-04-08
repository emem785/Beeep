import 'package:beep/models/buddy.dart';
import 'package:beep/models/card.dart';
import 'package:beep/models/user.dart';
import 'package:beep/utils/enums.dart';
import 'package:flutter/material.dart';

class UxControl with ChangeNotifier {
  menu _setPage = menu.navHome;

  plan currentPlan = plan.basicPlan;

  final List<Buddy> _buddyList = [];

  List<BankCard> _userCards = [];

  User _currentUser = User(
      'firstName', 'lastName', 'twitterHandle', 'phoneNumber', [], plan.noPlan);

  // final User user;

  menu get currentPage => _setPage;

  List<Buddy> get buddyList => _buddyList;

  User get currentUser => _currentUser;

  List<BankCard> get cardsList => _userCards;

  home(BuildContext context) {
    if (_setPage == menu.navHomeWithSheet) {
      Navigator.pop(context);
    }
    _setPage = menu.navHome;
    notifyListeners();
  }

  homeWithSheet(BuildContext context) {
    if (_setPage == menu.navHomeWithSheet) {
      Navigator.pop(context);
      _setPage = menu.navHome;
    } else {
      _setPage = menu.navHomeWithSheet;
    }
    notifyListeners();
  }

  homeToMenu(BuildContext context) {
    if (_setPage == menu.navHomeWithSheet) {
      Navigator.pop(context);
    }
    _setPage = menu.navMenu;
    notifyListeners();
  }

  addBuddy(Buddy buddy) {
    _buddyList.add(buddy);
    notifyListeners();
  }

  regUser(String firstName, String lastName, String phoneNumber,
      String twitterHandle) {
    List<Buddy> buddies = [];
    
    _currentUser = User(firstName, lastName, twitterHandle, phoneNumber, buddies, currentPlan);
    notifyListeners();
  }

  setPlan(plan _plan) {
    currentPlan = _plan;
    notifyListeners();
  }

  addCard(String bankNUmber, String expDate, String cvv) {
    _userCards
        .add(BankCard(cardNumber: bankNUmber, expDate: expDate, cvv: cvv));
    notifyListeners();
  }

  notify(){    
    notifyListeners();
      }

  setCurrentPage(menu _page) {
    _setPage = _page;
    notifyListeners();
  }
}
