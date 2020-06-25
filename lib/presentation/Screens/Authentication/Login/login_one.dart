import 'package:beep/core/widgets/common_widgets/common_button.dart';
import 'package:beep/core/widgets/common_widgets/cus_text.dart';
import 'package:beep/presentation/Screens/AppPages/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:beep/application/blocs/sign_in_bloc/signin_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoginOne extends StatefulWidget {
  @override
  _LoginOneState createState() => _LoginOneState();
}

class _LoginOneState extends State<LoginOne> {
  final _formKey = GlobalKey<FormState>();
  final _key = GlobalKey<ScaffoldState>();
  TextEditingController _phoneNumber;
  TextEditingController _password;

  @override
  void initState() {
    super.initState();
    _phoneNumber = TextEditingController(text: "");
    _password = TextEditingController(text: "");
  }

  @override
  void dispose() {
    super.dispose();
    _phoneNumber.dispose();
    _password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final signInBloc = BlocProvider.of<SigninBloc>(context);
    return Scaffold(
      resizeToAvoidBottomInset: true,
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
              Text('Welcome back', style: TextStyle(fontSize: 20)),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 16, 0, 24),
                child: Text('Please log in to Beeep',
                    style: TextStyle(fontSize: 14)),
              ),
              Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      CusTextNum(
                          controller: _phoneNumber, title: 'Phone number'),
                      CusTextPas(controller: _password, header: 'Password'),
                      InkWell(
                        onTap: () =>
                            Navigator.pushNamed(context, '/ForgotPassword'),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 16.0),
                          child: Text(
                            'Forgot password?',
                            style: TextStyle(
                                fontFamily: 'Nunito',
                                fontSize: 14,
                                color: Colors.brown,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                      BlocConsumer<SigninBloc, SignInState>(
                          builder: (_, state) {
                        return state.maybeMap(
                            orElse: () => SizedBox(),
                            authenticating: (a) => Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 0, vertical: 8),
                                  child: Center(
                                      child:
                                          SpinKitWave(color: Colors.green,size: 30)),
                                ));
                      }, listener: (_, state) {
                        state.maybeMap(
                            orElse: () => 1,
                            error: (e) =>
                                _key.currentState.showSnackBar(SnackBar(
                                  content: Text(e.failure.message),
                                )),
                            authenticated: (a) => Navigator.of(context)
                                .pushNamedAndRemoveUntil(
                                    '/HomeScreen', (Route<dynamic> route) => false));
                      }),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: CommonButton(
                            onPressed: () {
                              if (_formKey.currentState.validate()) {
                                signInBloc.add(SignInEventOnSubmit(
                                    _phoneNumber.text, _password.text));
                              }
                            },
                            text: 'Login'),
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
