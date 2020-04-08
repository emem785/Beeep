import 'package:beep/models/buddy.dart';
import 'package:beep/utils/enums.dart';

class User{
  
  final String firstName;
  final String lastName;
  final String twitterHandle;
  final String phoneNumber;
  final List<Buddy> userBuddies;  
  final plan userPlan;

  User(this.firstName, this.lastName, this.twitterHandle , this.phoneNumber, this.userBuddies, this.userPlan);  

  
}