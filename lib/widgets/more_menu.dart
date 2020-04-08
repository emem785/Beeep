import 'package:beep/Providers/ux_control_provider.dart';
import 'package:beep/Screens/MenuPages/profile%20pages/profiles_menu.dart';
import 'package:beep/widgets/menu_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class MoreMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 64, horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 35.0),
              child: Text('More',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Nunito')),
            ),
            Consumer<UxControl>(builder: (context, ux, _) {
              return InkWell(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProfileMenu(
                              firstName: ux.currentUser.firstName,
                              lastName: ux.currentUser.lastName,
                              phonenumber: ux.currentUser.phoneNumber,
                              twitterhandle: ux.currentUser.twitterHandle,
                            ))),
                child: MenuItem(
                    icon: SvgPicture.asset('assets/images/profile.svg'),
                    mainText: 'Profile',
                    subText: 'Edit your profile details'),
              );
            }),
            InkWell(
              onTap: () => Navigator.pushNamed(context, 'PlanPage'),
              child: MenuItem(
                  icon: SvgPicture.asset('assets/images/plan.svg'),
                  mainText: 'Plan',
                  subText: 'Review your subscription plan'),
            ),
            Consumer<UxControl>(builder: (context, card, _) {
              return InkWell(
                onTap: () {
                  if (card.cardsList.isEmpty) {
                    Navigator.pushNamed(context, 'CardPage');
                  } else {
                    Navigator.pushNamed(context, 'CardPageOne',arguments: {"purchase": false});
                  }
                },
                child: MenuItem(
                    icon: SvgPicture.asset('assets/images/payment.svg'),
                    mainText: 'Payment',
                    subText: 'Add or Remove Cards'),
              );
            }),
            InkWell(
              onTap: () {},
              child: MenuItem(
                  icon: SvgPicture.asset('assets/images/invite.svg'),
                  mainText: 'Invite',
                  subText: 'Spread the word'),
            ),
            InkWell(
              onTap: () {},
              child: MenuItem(
                  icon: SvgPicture.asset('assets/images/logout.svg'),
                  mainText: 'Log Out',
                  subText: 'Log out of your account'),
            ),
          ],
        ),
      ),
    );
  }
}
