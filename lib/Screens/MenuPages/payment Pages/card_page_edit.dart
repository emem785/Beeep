import 'package:beep/Providers/ux_control_provider.dart';
import 'package:beep/utils/StyleGuide.dart';
import 'package:beep/widgets/common_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CardPageEdit extends StatefulWidget {
  @override
  _CardPageEditState createState() => _CardPageEditState();
}

class _CardPageEditState extends State<CardPageEdit> {
  TextEditingController _cardNumber;
  TextEditingController _expDate;
  TextEditingController _cvv;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _cardNumber = TextEditingController(text: "");
    _expDate = TextEditingController(text: "");
    _cvv = TextEditingController(text: "");
  }

  @override
  void dispose() {
    super.dispose();
    _cardNumber.dispose();
    _expDate.dispose();
    _cvv.dispose();
  }

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
          'Back',
          style: TextStyle(color: Colors.black, fontFamily: 'NUnito'),
        ),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
         child:    Padding(
          padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Card details', style: nunitoLarge),
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: Text('Add a new card to your buddy account'),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 24, 0, 8),
                          child: Text(
                            'Card Number',
                            style:
                                TextStyle(fontSize: 14, fontFamily: 'Nunito'),
                          ),
                        ),
                        TextFormField(
                          controller: _cardNumber,
                          validator: (value) => (value.length < 16)
                              ? "Please enter valid Card Number\n(card number cannot be less than 16 digits)"
                              : null,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(gapPadding: 0.1),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 6),
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        ConstrainedBox(
                          constraints: BoxConstraints(maxWidth: 160),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 24, 0, 8),
                                child: Text(
                                  'Valid thru',
                                  style: TextStyle(
                                      fontSize: 14, fontFamily: 'Nunito'),
                                ),
                              ),
                              TextFormField(
                                controller: _expDate,
                                validator: (value) => (value.isEmpty)
                                    ? "Please enter valid\nexpiry date "
                                    : null,
                                keyboardType: TextInputType.datetime,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(gapPadding: 0.1),
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 6),
                                ),
                              )
                            ],
                          ),
                        ),
                        ConstrainedBox(
                          constraints: BoxConstraints(maxWidth: 160),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 24, 0, 8),
                                child: Text(
                                  'CVV',
                                  style: TextStyle(
                                      fontSize: 14, fontFamily: 'Nunito'),
                                ),
                              ),
                              TextFormField(
                                controller: _cvv,
                                validator: (value) =>
                                    (value.length > 3 || value.isEmpty)
                                        ? "Please enter valid\ncvv number"
                                        : null,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(gapPadding: 0.1),
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 6),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Consumer<UxControl>(builder: (context, card, _) {
                    return CommonButton(
                        text: 'Add Card',
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            Navigator.pushNamed(context, 'CardPageThree');
                            card.addCard(
                                _cardNumber.text, _expDate.text, _cvv.text);
                          }
                        });
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
