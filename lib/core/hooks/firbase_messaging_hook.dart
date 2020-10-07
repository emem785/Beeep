import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

FirebaseMessaging useFirebaseMessagingHook() => use(_FirebaseMessagingHook());

class _FirebaseMessagingHook extends Hook<FirebaseMessaging> {
  @override
  _FirebaseMessagingHookState createState() => _FirebaseMessagingHookState();
}

class _FirebaseMessagingHookState
    extends HookState<FirebaseMessaging, _FirebaseMessagingHook> {
  FirebaseMessaging firebaseMessaging = FirebaseMessaging();

  static Future<dynamic> myBackgroundMessageHandler(
      Map<String, dynamic> message) async {
    if (message.containsKey('data')) {
      // Handle data message
      final dynamic data = message['data'];
    }

    if (message.containsKey('notification')) {
      // Handle notification message
      final dynamic notification = message['notification'];
    }

    // Or do other work.
  }

  @override
  void initHook() {
    firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print("$message");
      },
      onBackgroundMessage: myBackgroundMessageHandler,
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");
        Navigator.pushNamed(context, '/ReceiveBeep');
        // _navigateToItemDetail(message);
      },
      onResume: (Map<String, dynamic> message) async {
        print("onResume: $message");
        Navigator.pushNamed(context, '/ReceiveBeep');
        // _navigateToItemDetail(message);
      },
    );
  }

  @override
  FirebaseMessaging build(BuildContext context) => firebaseMessaging;
  
}
