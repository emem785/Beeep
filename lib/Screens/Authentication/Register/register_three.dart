import 'package:beep/Screens/AppPages/home_screen.dart';
import 'package:beep/utils/StyleGuide.dart';

import 'package:beep/widgets/common_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RegisterThree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(24, 216, 24, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SvgPicture.asset('assets/images/Success.svg'),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(top: 34.0),
                child: Text('Success!',
                    style: TextStyle(fontFamily: 'Nunito', fontSize: 24)),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Text(
                  'Phone number verified',
                  style: successSub,
                ),
              ),
            ),
            CommonButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HomeScreen(pageValue: 0))),
                text: 'Go to Home',
                isBrown: true),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: CommonButton(
                  onPressed: () => Navigator.pushNamed(context, '/SetupPage'),
                  text: 'Setup Beeep'),
            )
          ],
        ),
      ),
    );
  }
}
