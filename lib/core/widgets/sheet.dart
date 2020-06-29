import 'package:beep/application/blocs/lawyer_bloc/lawyer_bloc.dart';
import 'package:beep/core/widgets/common_widgets/spinner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Sheet extends StatefulWidget {
  @override
  _SheetState createState() => _SheetState();
}

class _SheetState extends State<Sheet> {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.black12,
                blurRadius: 1,
                spreadRadius: 1,
                offset: Offset(0, -2))
          ],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: BlocBuilder<LawyerBloc, LawyerState>(
            builder: (context, state) {
              return state.maybeMap(
                  orElse: () => SizedBox(),
                  error: (e) {
                    return Center(child: Text(e.failure.message));
                  },
                  loading: (s) => LoadingIndicator(),
                  loaded: (l) {
                    return ListView(
                        children: l.lawyers.map((law) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        child: ListTile(
                          leading: CircleAvatar(
                              child:
                                  SvgPicture.asset('assets/images/logo.svg')),
                          title: Text(
                            law.firstname + "" + law.lastname,
                            style: TextStyle(
                                fontFamily: 'Nunito',
                                fontWeight: FontWeight.w600,
                                fontSize: 16),
                          ),
                          subtitle: Text(
                            '${law.distance.toStringAsFixed(2)} km away',
                            style:
                                TextStyle(fontFamily: 'Nunito', fontSize: 16),
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              GestureDetector(
                                child: Icon(Icons.message),
                                onTap: () async {
                                  var url = 'sms:${law.phone}';
                                },
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 16.0),
                                child: GestureDetector(
                                  child: Icon(Icons.call),
                                  onTap: () async {
                                    var url = 'tel:${law.phone}';
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList());
                  });
            },
          ),
        ),
      ),
    );
  }
}
