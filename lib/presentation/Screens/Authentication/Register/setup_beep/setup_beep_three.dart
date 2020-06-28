import 'package:beep/core/utils/enums.dart';
import 'package:beep/core/widgets/common_widgets/common_button.dart';
import 'package:beep/core/widgets/common_widgets/cus_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

import '../../../../../application/blocs/user_bloc/user_bloc.dart';

class SetupBeepThree extends StatefulWidget {
  final plan opt;
  const SetupBeepThree({Key key, this.opt}) : super(key: key);

  @override
  _SetupBeepThreeState createState() => _SetupBeepThreeState();
}

class _SetupBeepThreeState extends State<SetupBeepThree> {
  TextEditingController _firstName;
  TextEditingController _lastName;
  TextEditingController _phoneNumber;
  TextEditingController _relationship;
  final _formKey = GlobalKey<FormState>();
  final _key = GlobalKey<ScaffoldState>();
  FocusNode focusNode = FocusNode();
  final relationships = [
    DropdownMenuItem(child: Text('father')),
    DropdownMenuItem(child: Text('mother')),
    DropdownMenuItem(child: Text('brother')),
    DropdownMenuItem(child: Text('sister')),
    DropdownMenuItem(child: Text('uncle')),
    DropdownMenuItem(child: Text('aunty')),
    DropdownMenuItem(child: Text('friend')),
    DropdownMenuItem(child: Text('colleague')),
    DropdownMenuItem(child: Text('boss')),
    DropdownMenuItem(child: Text('pastor')),
    DropdownMenuItem(child: Text('mentor')),
    DropdownMenuItem(child: Text('employee')),
  ];

  @override
  void initState() {
    super.initState();
    _firstName = TextEditingController(text: "");
    _lastName = TextEditingController(text: "");
    _phoneNumber = TextEditingController(text: "");
    _relationship = TextEditingController(text: "");
  }

  @override
  void dispose() {
    super.dispose();
    _firstName.dispose();
    _lastName.dispose();
    _phoneNumber.dispose();
    _relationship.dispose();
    focusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userBloc = Provider.of<UserBloc>(context);

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
          'Back',
          style: TextStyle(color: Colors.black, fontFamily: 'NUnito'),
        ),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 40, 24, 0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Add a Beeep Buddy',
                    style: TextStyle(fontSize: 24, fontFamily: 'Nunito')),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text('Someone who would receive your Beeep alerts.'),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 24, 0, 8),
                      child: Text(
                        'First Name',
                        style: TextStyle(fontSize: 14, fontFamily: 'Nunito'),
                      ),
                    ),
                    TextFormField(
                      controller: _firstName,
                      focusNode: focusNode,
                      validator: (value) =>
                          (value.isEmpty) ? "Please enter First Name" : null,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(gapPadding: 0.1),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 6),
                      ),
                    )
                  ],
                ),
                CusText(controller: _lastName, title: 'Last Name'),
                CusTextNum(controller: _phoneNumber, title: 'Phone Number'),
                CusText(controller: _relationship, title: 'Relationship'),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    BlocConsumer<UserBloc, UserState>(
                      listener: (_, state) {
                        return state.maybeMap(
                            userError: (e) => _key.currentState.showSnackBar(
                                SnackBar(content: Text(e.failure.message))),
                            userUpdated: (u) =>
                                Navigator.pushNamed(context, '/SetupBeepFour'),
                            orElse: () => 1);
                      },
                      builder: (_, state) {
                        return state.maybeMap(
                            orElse: () => SizedBox(),
                            userUpdating: (e) => Center(
                                    child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 0, vertical: 8),
                                  child: Center(
                                      child: SpinKitWave(
                                          color: Colors.green, size: 30)),
                                )));
                      },
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: CommonButton(
                    text: 'Save',
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        userBloc.add(AddBuddy(_firstName.text, _lastName.text,
                            _phoneNumber.text, _relationship.text));
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
