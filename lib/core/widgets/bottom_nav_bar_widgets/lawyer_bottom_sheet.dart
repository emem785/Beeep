import 'package:beep/application/blocs/lawyer_bloc/lawyer_bloc.dart';
import 'package:beep/core/widgets/common_widgets/spinner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../utils/StyleGuide.dart';

class LawyerBottomSheet extends StatefulWidget {
  @override
  _LawyerBottomSheetState createState() => _LawyerBottomSheetState();
}

class _LawyerBottomSheetState extends State<LawyerBottomSheet> {
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
                            style: nunitoMidBold,
                          ),
                          subtitle: Text(
                              '${law.distance.toStringAsFixed(2)} km away',
                              style: nunitoMid),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              GestureDetector(
                                child: Icon(Icons.message),
                                onTap: () async {
                                  String url = 'sms:${law.phone}';
                                  await launch(url);
                                },
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 16.0),
                                child: GestureDetector(
                                  child: Icon(Icons.call),
                                  onTap: () async {
                                    String url = 'tel:${law.phone}';
                                    await launch(url);
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
