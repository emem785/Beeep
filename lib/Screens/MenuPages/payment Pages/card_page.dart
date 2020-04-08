import 'package:beep/widgets/common_button.dart';
import 'package:flutter/material.dart';


class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () => Navigator.pop(context)),
        titleSpacing: 0.1,
        title: Text(
          'Payment',
          style: TextStyle(
              color: Colors.black,
              fontFamily: 'Nunito',
              fontWeight: FontWeight.w600),
        ),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(24, 52, 24, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // SvgPicture.asset('assets/images/scene.svg'),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Text(
                'No Cards',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontFamily: 'Nunito'),
              ),
            ),
            Text(
                'You currently do not have a card, please add one to continue enjoying our services.',
                textAlign: TextAlign.center),            
            Padding(
              padding: const EdgeInsets.only(bottom:8.0),
              child: CommonButton(
                text: 'Add Card',
                onPressed: ()=> Navigator.pushNamed(context, 'CardPageEdit'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
