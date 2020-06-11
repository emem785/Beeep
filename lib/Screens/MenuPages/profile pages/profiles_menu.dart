import 'package:beep/Providers/ux_control_provider.dart';
import 'package:beep/Screens/MenuPages/profile%20pages/change_password.dart';
import 'package:beep/utils/StyleGuide.dart';
import 'package:beep/widgets/common_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileMenu extends StatefulWidget {
  final String firstName;
  final String lastName;
  final String phonenumber;
  final String twitterhandle;

  const ProfileMenu(
      {Key key,
      this.firstName,
      this.lastName,
      this.phonenumber,
      this.twitterhandle})
      : super(key: key);
  @override
  _ProfileMenuState createState() => _ProfileMenuState();
}

class _ProfileMenuState extends State<ProfileMenu> {
  final _formKey = GlobalKey<FormState>();
  final _key = GlobalKey<ScaffoldState>();
  final _snackbar = SnackBar(content: Text("Changes saved"),);
  TextEditingController _firstname;
  TextEditingController _lastname;
  TextEditingController _phonenumber;
  TextEditingController _twitterhandle;

  @override
  void initState() {
    super.initState();
    _firstname = TextEditingController(text: widget.firstName);
    _lastname = TextEditingController(text: widget.lastName);
    _phonenumber = TextEditingController(text: widget.phonenumber);
    _twitterhandle = TextEditingController(text: widget.twitterhandle);
  }

  @override
  void dispose() {
    super.dispose();
    _firstname.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                  child: Consumer<UxControl>(
                    builder: (context, user, _) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              CusTextFine(
                                  controller: _firstname,
                                  labelText: 'First Name'),
                              CusTextFine(
                                  controller: _lastname, labelText: 'Last Name'),
                              CusTextFine(
                                  controller: _phonenumber,
                                  num: true,
                                  labelText: 'Phone Number'),
                              CusTextFine(
                                  controller: _twitterhandle,
                                  labelText: 'Twitter Handle'),
                            ],
                          ),
                          Consumer<UxControl>(builder: (context, ux, _) {
                            return CommonButton(
                                text: 'Save Changes',
                                onPressed: () {
                                  if (_formKey.currentState.validate()) {
                                    ux.regUser(_firstname.text, _lastname.text,
                                        _phonenumber.text, _twitterhandle.text);
                                        Scaffold.of(context).showSnackBar(_snackbar);
                                    //Navigator.pop(context);
                                  }
                                });
                          }),
                          CommonButton(
                              onPressed:() => Navigator.push(context, MaterialPageRoute(builder: (context)=> ChangePassword())),
                              text: 'Change Password',
                              isBrown: true),
                        ],
                      );
                    },
                  ))
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

  const CusTextFine({Key key, this.controller, this.num=false, this.labelText}) : super(key: key);

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
                    keyboardType: num ?TextInputType.number: TextInputType.text,
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
