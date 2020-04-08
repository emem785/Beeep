
import 'package:beep/Providers/ux_control_provider.dart';
import 'package:beep/Screens/AppPages/home_screen.dart';
import 'package:beep/Screens/AppPages/menu_pages/upgrade_plan2.dart';
import 'package:beep/utils/StyleGuide.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CardPageOne extends StatelessWidget {
  final bool purchase;

  const CardPageOne({Key key, this.purchase = false}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => HomeScreen(pageValue: 2)));
            }),
        titleSpacing: 0.1,
        title: Text(
          'Payment',
          style: TextStyle(color: Colors.black, fontFamily: 'Nunito'),
        ),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 52, 24, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Consumer<UxControl>(builder: (context, ux, _) {
                return Container(
                    child: ux.cardsList.isEmpty
                        ? SizedBox
                        : ListView(
                            shrinkWrap: true,
                            children: ux.cardsList.map((card) {
                              return Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child: purchase
                                      ? CardWidget2(
                                          onTap2: () {
                                            ux.cardsList.removeAt(
                                                ux.cardsList.indexOf(card));
                                            Navigator.pop(context);
                                            Navigator.pushNamed(
                                                context, 'CardPageOne',arguments: {'purchase':true});
                                          },
                                          cardNumber: card.cardNumber,
                                          expDate: card.expDate,
                                          cvv: card.cvv)
                                      : CardWidget(
                                          onTap2: () {
                                            ux.cardsList.removeAt(
                                                ux.cardsList.indexOf(card));
                                            Navigator.pop(context);
                                            Navigator.pushNamed(
                                                context, 'CardPageOne',arguments: {'purchase':false});
                                          },
                                          cardNumber: card.cardNumber,
                                          expDate: card.expDate,
                                          cvv: card.cvv));
                            }).toList()));
              }),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: GestureDetector(
                    onTap: () => Navigator.pushNamed(context, 'CardPageEdit'),
                    child: Text("+Add New Card",
                        style: TextStyle(
                            fontFamily: 'Nunito',
                            fontWeight: FontWeight.w600,
                            fontSize: 14))),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CardWidget extends StatelessWidget {
  final String cardNumber;
  final String expDate;
  final String cvv;
  final Function onTap2;

  const CardWidget(
      {Key key, this.cardNumber, this.expDate, this.cvv, this.onTap2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cardDets = cardNumber.substring(12, 16);
    var dateDets = expDate.substring(0, 2);
    return Container(
      height: 200,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: card,
          boxShadow: [
            BoxShadow(color: Colors.black26, spreadRadius: 1, blurRadius: 5)
          ]),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text('Card Number', style: cardSmall),
            ),
            Text(
              '**** **** **** $cardDets',
              style: cardBig,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Text(
                'Valid thru (mm/yy) \t\t\t\t\t CVV',
                style: cardSmall,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Text(
                  '$dateDets/ ** \t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t ***',
                  style: cardBig),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(268, 8, 0, 0),
              child: GestureDetector(
                onTap: () async {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          content: Text(
                            "Are you sure you want to remove this card?",
                            style: nunitoMid,
                          ),
                          actions: <Widget>[
                            FlatButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text("NO",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'Nunito',
                                      color: Colors.pink[200])),
                            ),
                            FlatButton(
                                onPressed: onTap2,
                                child: Text("YES",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'Nunito',
                                        color: Colors.black))),
                          ],
                        );
                      });
                },
                child: Text('Remove',
                    style: TextStyle(
                        fontFamily: 'Nunito',
                        fontSize: 16,
                        color: spePink,
                        fontWeight: FontWeight.w600)),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CardWidget2 extends StatelessWidget {
  final String cardNumber;
  final String expDate;
  final String cvv;
  final Function onTap2;

  const CardWidget2(
      {Key key, this.cardNumber, this.expDate, this.cvv, this.onTap2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cardDets = cardNumber.substring(12, 16);
    var dateDets = expDate.substring(0, 2);
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=> UpgradePlan2()));
      },
      child: Container(
        height: 200,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: card,
            boxShadow: [
              BoxShadow(color: Colors.black26, spreadRadius: 1, blurRadius: 5)
            ]),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text('Card Number', style: cardSmall),
              ),
              Text(
                '**** **** **** $cardDets',
                style: cardBig,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Text(
                  'Valid thru (mm/yy) \t\t\t\t\t CVV',
                  style: cardSmall,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Text(
                    '$dateDets/ ** \t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t ***',
                    style: cardBig),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(268, 8, 0, 0),
                child: GestureDetector(
                  onTap: () async {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                            content: Text(
                              "Are you sure you want to remove this card?",
                              style: nunitoMid,
                            ),
                            actions: <Widget>[
                              FlatButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text("NO",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'Nunito',
                                        color: Colors.pink[200])),
                              ),
                              FlatButton(
                                  onPressed: onTap2,
                                  child: Text("YES",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'Nunito',
                                          color: Colors.black))),
                            ],
                          );
                        });
                  },
                  child: Text('Remove',
                      style: TextStyle(
                          fontFamily: 'Nunito',
                          fontSize: 16,
                          color: spePink,
                          fontWeight: FontWeight.w600)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
