part of 'user_bloc.dart';

@immutable
@freezed
abstract class UserEvent with _$UserEvent {
  const factory UserEvent.insertUser() = InsertUser;
  const factory UserEvent.updateUser(String firstName, String lastName,
      String email, String phoneNumber, String twitterHandle) = UpdateUser;
  const factory UserEvent.addBuddy(String firstName, String lastName,
      String phoneNumber, String relationship) = AddBuddy;
}
