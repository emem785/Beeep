import 'package:beep/widgets/common_button.dart';
import 'package:beep/widgets/cus_text.dart';
import 'package:flutter/material.dart';

class ForgotPasswordFour extends StatefulWidget {
  @override
  _ForgotPasswordFourState createState() => _ForgotPasswordFourState();
}

class _ForgotPasswordFourState extends State<ForgotPasswordFour> {
  final _formKey = GlobalKey<FormState>();
  final _key = GlobalKey<ScaffoldState>();
  TextEditingController _password;

  @override
  void initState() {
    super.initState();
    _password = TextEditingController(text: "");
  }

  @override
  void dispose() {
    
    super.dispose();
    _password.dispose();
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
              Text('Reset your password', style: TextStyle(fontSize: 20)),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 16, 0, 24),
                child: Text(
                    'Please choose a new password to gain access to your Beeep acount.',
                    style: TextStyle(fontSize: 14)),
              ),
              Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      CusTextPas(controller: _password, header: 'Password'),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: CommonButton(
                            onPressed: () => Navigator.pushNamed(
                                context, '/ForgotPassword5'),
                            text: 'Reset'),
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
