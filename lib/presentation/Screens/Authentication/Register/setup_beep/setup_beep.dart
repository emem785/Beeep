import 'package:beep/core/utils/enums.dart';
import 'package:beep/core/widgets/common_widgets/common_button.dart';
import 'package:beep/core/widgets/common_widgets/custom_text_form_field.dart';
import 'package:beep/core/widgets/common_widgets/spinner.dart';
import 'package:beep/infrastructure/models/buddy.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
                CustomTextField(controller: _lastName, title: 'Last Name'),
                CustomTextFieldNum(
                    controller: _phoneNumber, title: 'Phone Number'),
                CustomTextField(
                    controller: _relationship, title: 'Relationship'),
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
                            userUpdating: (e) => LoadingIndicator());
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
                        userBloc.add(AddBuddy(Buddy(
                            firstname: _firstName.text,
                            lastname: _lastName.text,
                            phonenumber: _phoneNumber.text,
                            relationship: _relationship.text)));
                      }
                      // Navigator.pushNamed(context, '/SetupBeepFour');
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
