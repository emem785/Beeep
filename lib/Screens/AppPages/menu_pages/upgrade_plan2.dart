import 'package:beep/Screens/AppPages/home_screen.dart';
import 'package:beep/utils/StyleGuide.dart';
import 'package:beep/widgets/common_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UpgradePlan2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(24, 232, 24, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
                        Flex(direction: Axis.horizontal, children: <Widget>[
              Expanded(child: SvgPicture.asset('assets/images/Success.svg'))
            ]),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(top: 34.0),
                child: Text(
                  'Payment successful',
                  style: TextStyle(fontFamily: 'Nunito', fontSize: 24),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Text(
                  ' Your account has been upgraded to the yearly subscription',
                  style: successSub,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: CommonButton(
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HomeScreen(pageValue: 2))),
                  text: 'Go Home'),
            ),
          ],
        ),
      ),
    );
  }
}
