import 'package:beep/core/widgets/common_widgets/common_button.dart';
import 'package:beep/core/widgets/common_widgets/cus_text.dart';
import 'package:flutter/material.dart';

class ForgotPasswordTwo extends StatefulWidget {
  @override
  _ForgotPasswordTwoState createState() => _ForgotPasswordTwoState();
}

class _ForgotPasswordTwoState extends State<ForgotPasswordTwo> {
  final _formKey = GlobalKey<FormState>();
  final _key = GlobalKey<ScaffoldState>();
  TextEditingController _smsCode;

  @override
  void initState() {
    super.initState();
    _smsCode = TextEditingController(text: "");
  }

  @override
  void dispose() {
    super.dispose();
    _smsCode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.brown,
            ),
            onPressed: () => Navigator.pop(context)),
        titleSpacing: 0.1,
        title: Text(
          'Back',
          style: TextStyle(color: Colors.brown),
        ),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 16, 24, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Phone number verification', style: TextStyle(fontSize: 20)),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 16, 0, 24),
                child: Text(
                    'A text message containing a 4-digit\ncode have been sent to 07000000000',
                    style: TextStyle(fontSize: 14)),
              ),
              Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      CusText(controller: _smsCode, title: '4-digit code'),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 24),
                        child: InkWell(
                          onTap: () {},
                          child: Text(
                            'Didn’t get the code?',
                            style:
                                TextStyle(fontFamily: 'Nunito', fontSize: 14),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () => Navigator.pop(context),
                        child: Text(
                          'Change number',
                          style: TextStyle(
                              fontFamily: 'Nunito',
                              fontSize: 14,
                              color: Colors.brown,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: CommonButton(
                            onPressed: () {
                              if (_formKey.currentState.validate()) {
                                Navigator.pushNamed(
                                    context, '/ForgotPassword3');
                              }
                            },
                            text: 'Request Code'),
                      )
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
