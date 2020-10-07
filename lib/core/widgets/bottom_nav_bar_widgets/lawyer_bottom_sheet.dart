import 'package:beep/application/blocs/lawyer_bloc/lawyer_bloc.dart';
import 'package:beep/application/cubits/lawyer_tiles_cubit/lawyer_tiles_cubit.dart';
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
                        child: InkWell(
                          onTap: () => context
                              .bloc<LawyerTilesCubit>()
                              .engageLawyer(law.phone),
                          child: ListTile(
                            leading: CircleAvatar(
                                child: SvgPicture.asset(
                                    'assets/images/user_default.svg'),
                                backgroundColor: Color(0xFF32BEA6)),
                            title:
                                BlocBuilder<LawyerTilesCubit, LawyerTilesState>(
                              builder: (context, state) {
                                return state.maybeMap(
                                    orElse: () => Text(
                                          law.firstname + "  " + law.lastname,
                                          style: nunitoMidBold,
                                        ),
                                    lawyerEngaged: (e) => Text(
                                          law.firstname + "  " + law.lastname,
                                          style: e.engagedLawyersIndex
                                                  .contains(law.phone)
                                              ? nunitoMidBoldGreen
                                              : nunitoMidBold,
                                        ),
                                    initial: (i) => Text(
                                          law.firstname + "  " + law.lastname,
                                          style: i.engagedLawyersIndex
                                                  .contains(law.phone)
                                              ? nunitoMidBoldGreen
                                              : nunitoMidBold,
                                        ));
                              },
                            ),
                            subtitle: Text(
                                '${law.distance.toStringAsFixed(2)} km away',
                                style: nunitoSmallBold),
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
                        ));
                  }).toList());
                });
          },
        ),
      ),
    );
  }

  Future<void> _comfirmLawyer(LawyerTilesCubit lawyerTilesCubit) async {
    return showDialog(
      context: context,
      builder: (context) => new AlertDialog(
        title: new Text('Are you sure?', style: nunitoMid),
        content: new Text('Do you want to stop receiving Broadcast',
            style: nunitoMid),
        actions: <Widget>[
          new FlatButton(
            onPressed: () => print("not comfirmed"),
            child: new Text('NO', style: nunitoMidPromptPink),
          ),
          new FlatButton(
            onPressed: () {
              print("comfirmed");
              Navigator.of(context).pop();
            },
            child: new Text('YES', style: nunitoMidPrompt),
          ),
        ],
      ),
    );
  }
}
