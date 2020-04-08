import 'package:beep/utils/enums.dart';
import 'package:flutter/cupertino.dart';

class PaymentProvider with ChangeNotifier{

  plan _setPlan = plan.noPlan;

  plan get planType => _setPlan;


  chooseBasicPlan(){
    _setPlan = plan.basicPlan;
    print(_setPlan.toString());
    notifyListeners();

  }

  chooseEssentialPlan(){
    _setPlan = plan.essentialPlan;
    notifyListeners();
  }
}