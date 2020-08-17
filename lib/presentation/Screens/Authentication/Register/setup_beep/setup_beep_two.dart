import 'package:beep/core/utils/StyleGuide.dart';
import 'package:beep/core/widgets/common_widgets/common_button.dart';
import 'package:beep/core/widgets/common_widgets/succes_widget.dart';
import 'package:beep/presentation/Screens/AppPages/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SetupBeepFour extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
              child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 216, 24, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SuccessWidget(),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(top: 34.0),
                  child: Text('Registration successful !',
                      style: TextStyle(fontFamily: 'Nunito', fontSize: 24)),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Text(
                    'Beeep Buddy Added',
                    style: successSub,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Text(
                    'Notification messages have been sent to your Beeep buddies via text message. Please also let them know verbally. ',
                    style: successSub,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: CommonButton(
                    onPressed: () => Navigator.pushNamed(context, '/HomeScreen'),
                    text: 'Go Home'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
