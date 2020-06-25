import 'package:beep/core/utils/StyleGuide.dart';
import 'package:beep/core/widgets/common_widgets/common_button.dart';
import 'package:beep/infrastructure/models/lawyers.dart';
import 'package:beep/infrastructure/models/user.dart';
import 'package:beep/presentation/Screens/MenuPages/profile_pages/change_password.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:beep/application/blocs/user_bloc/user_bloc.dart';

class ProfileMenu extends StatefulWidget {
  final User user;

  const ProfileMenu({Key key, @required this.user}) : super(key: key);
  @override
  _ProfileMenuState createState() => _ProfileMenuState();
}

class _ProfileMenuState extends State<ProfileMenu> {
  final _formKey = GlobalKey<FormState>();
  final _key = GlobalKey<ScaffoldState>();
  TextEditingController _firstname;
  TextEditingController _lastname;
  TextEditingController _phonenumber;
  TextEditingController _twitterhandle;
  TextEditingController _email;

  @override
  void initState() {
    super.initState();
    _firstname = TextEditingController(text: widget.user.firstname);
    _lastname = TextEditingController(text: widget.user.lastname);
    _phonenumber = TextEditingController(text: widget.user.phone);
    _twitterhandle = TextEditingController(text: widget.user.twitterHandle);
    _email = TextEditingController(text: widget.user.email);
  }

  @override
  void dispose() {
    super.dispose();
    _firstname.dispose();
    _lastname.dispose();
    _phonenumber.dispose();
    _twitterhandle.dispose();
    _email.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userBloc = BlocProvider.of<UserBloc>(context);
    return Scaffold(
      key: _key,
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () => Navigator.pop(context)),
        titleSpacing: 0.1,
        title: Text(
          'Profile',
          style: TextStyle(color: Colors.black),
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
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        CusTextFine(
                            controller: _firstname, labelText: 'First Name'),
                        CusTextFine(
                            controller: _lastname, labelText: 'Last Name'),
                        CusTextFine(
                            controller: _phonenumber,
                            num: true,
                            labelText: 'Phone Number'),
                        CusTextFine(
                            controller: _twitterhandle,
                            labelText: 'Twitter Handle'),
                        CusTextFine(controller: _email, labelText: 'Email'),
                      ],
                    ),
                    BlocConsumer<UserBloc, UserState>(
                      listener: (_, state) {
                        return state.maybeMap(
                            orElse: () => 1,
                            userError: (e) => _key.currentState.showSnackBar(
                                SnackBar(content: Text(e.failure.message))),
                            userUpdated: (u) => _key.currentState
                                .showSnackBar(SnackBar(content: Text(u.msg))));
                      },
                      builder: (_, state) {
                        return state.maybeMap(
                            orElse: () => SizedBox(),
                            userUpdating: (u) => Center(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 0, vertical: 8),
                                  child: Center(
                                      child:
                                          SpinKitWave(color: Colors.green,size: 30)),
                                )));
                      },
                    ),
                    CommonButton(
                        text: 'Save Changes',
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            userBloc.add(UpdateUser(
                                _firstname.text,
                                _lastname.text,
                                _email.text,
                                _phonenumber.text,
                                _twitterhandle.text));

                            //Navigator.pop(context);
                          }
                        }),
                    CommonButton(
                        onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChangePassword())),
                        text: 'Change Password',
                        isBrown: true),
                    SizedBox(height: 16)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CusTextFine extends StatelessWidget {
  final TextEditingController controller;
  final bool num;
  final String labelText;

  const CusTextFine(
      {Key key, this.controller, this.num = false, this.labelText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        height: 80,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            color: customGrey),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(32, 8, 0, 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Positioned(
                    child: Text(
                      'Edit',
                      style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'Nunito',
                          fontWeight: FontWeight.w600,
                          color: Colors.green[900]),
                    ),
                    left: 290,
                    top: 14,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: labelText,
                      labelStyle: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Nunito'),
                      border: InputBorder.none,
                    ),
                    controller: controller,
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                    cursorColor: Colors.green[700],
                    keyboardType:
                        num ? TextInputType.number : TextInputType.text,
                    validator: (value) =>
                        (value.isEmpty) ? 'Enter a valid $labelText' : null,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}