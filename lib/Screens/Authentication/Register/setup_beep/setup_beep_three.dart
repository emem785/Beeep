import 'package:beep/Providers/ux_control_provider.dart';
import 'package:beep/models/buddy.dart';
import 'package:beep/utils/enums.dart';
import 'package:beep/widgets/common_button.dart';
import 'package:beep/widgets/cus_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 40, 24, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Add a Beeep Buddy',
                  style: TextStyle(fontSize: 24, fontFamily: 'Nunito')),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text('Someone who would receive your Beeep alerts.'),
              ),
              Consumer<UxControl>(
                builder: (context, buddy, child) {
                  return Container(
                      child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: buddy.buddyList.isEmpty
                              ? Text('empty')
                              : Column(
                                  children: buddy.buddyList.map((userBud) {
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 16.0),
                                        child: Text(
                                          'Buddy ${buddy.buddyList.lastIndexOf(userBud) + 1}',
                                          style: TextStyle(
                                              fontFamily: 'Nunito',
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(
                                            border:
                                                Border.all(color: Colors.brown),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5))),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 8, horizontal: 8),
                                          child: Text(
                                              '${userBud.firstName}\n\n${userBud.lastName}\n\n${userBud.phoneNumber}\n\n${userBud.relationship}'),
                                        ),
                                      ),
                                    ],
                                  );
                                }).toList())));
                },
              ),
              CusText(controller: _firstName, title: 'First Name'),
              CusText(controller: _lastName, title: 'Last Name'),
              CusTextNum(controller: _phoneNumber, title: 'Phone Number'),
              CusText(controller: _relationship, title: 'Relationship'),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
  
                  
                  Consumer<UxControl>(
                    builder: (context, buddy, child) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: GestureDetector(
                            onTap: () {
                              buddy.addBuddy(Buddy(
                                  firstName: _firstName.text,
                                  lastName: _lastName.text,
                                  phoneNumber: _phoneNumber.text,
                                  relationship: _relationship.text));
                            },
                            child: Text(
                              'Add User',
                              style: TextStyle(
                                  fontFamily: 'Nunito',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.brown),
                            )),
                      );
                    },
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: CommonButton(
                  text: 'Save',
                  onPressed: () =>
                      Navigator.pushNamed(context, '/SetupBeepFour'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
