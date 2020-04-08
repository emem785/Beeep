import 'package:beep/Providers/ux_control_provider.dart';
import 'package:beep/widgets/common_button.dart';
import 'package:beep/widgets/cus_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterOne extends StatefulWidget {
  @override
  _RegisterOneState createState() => _RegisterOneState();
}

class _RegisterOneState extends State<RegisterOne> {
  TextStyle style = TextStyle(fontFamily: 'Nunito');
  final _formKey = GlobalKey<FormState>();
  final _key = GlobalKey<ScaffoldState>();
  TextEditingController _firstName;
  TextEditingController _lastName;
  TextEditingController _phoneNumber;
  TextEditingController _twitterHandle;
  TextEditingController _password;

  @override
  void initState() {
    super.initState();
    _firstName = TextEditingController(text: "");
    _lastName = TextEditingController(text: "");
    _phoneNumber = TextEditingController(text: "");
    _twitterHandle = TextEditingController(text: "@");
    _password = TextEditingController(text: "");
  }

  @override
  void dispose() {
    super.dispose();
    _firstName.dispose();
    _lastName.dispose();
    _phoneNumber.dispose();
    _twitterHandle.dispose();
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
          padding: const EdgeInsets.fromLTRB(24, 12, 24, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Account setup', style: TextStyle(fontSize: 20)),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 8, 0, 24),
                child: Text(
                    'Let’s be friends, My name is  Beeep. What’s yours?',
                    style: TextStyle(fontSize: 14)),
              ),
              Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      CusText(controller: _firstName, title: 'First Name'),
                      CusText(controller: _lastName, title: 'Last Name'),
                      CusTextNum(
                          controller: _phoneNumber, title: 'Phone Number'),
                      CusText(
                          controller: _twitterHandle,
                          title: 'Twitter Handle (Optional)',
                          isOptional: true),
                      CusTextPas(controller: _password, header: 'Password'),
                      Consumer<UxControl>(
                        builder: (context, userBud, _) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: CommonButton(
                                onPressed: () {
                                  if (_formKey.currentState.validate()) {
                                    userBud.regUser(
                                        _firstName.text,
                                        _lastName.text,
                                        _phoneNumber.text,
                                        _twitterHandle.text);

                                    Navigator.pushNamed(
                                        context, '/RegisterTwo');
                                  }
                                },
                                text: 'Continue'),
                          );
                        },
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
