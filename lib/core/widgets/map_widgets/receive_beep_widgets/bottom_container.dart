import 'package:beep/application/blocs/lawyer_bloc/lawyer_bloc.dart';
import 'package:beep/application/cubits/receive_beep_cubit/receive_beep_cubit.dart';
import 'package:beep/core/utils/StyleGuide.dart';
import 'package:beep/core/widgets/common_widgets/spinner.dart';
import 'package:beep/infrastructure/models/buddy.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../application/blocs/map_bloc/map_bloc.dart';

class BottomContainerLoading extends StatelessWidget {
  final double height;
  const BottomContainerLoading({
    Key key,
    @required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[100],
      height: height,
      child: Center(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "Waiting for details",
              style: nunitoMidBold,
            ),
            LoadingIndicator()
          ],
        ),
      )),
    );
  }
}

class BottomContainer extends StatelessWidget {
  final double height;
  final Buddy buddy;
  const BottomContainer({
    Key key,
    @required this.height,
    @required this.buddy,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[100],
      height: height,
      child: Center(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "Showing the live location of ${buddy.firstname} ${buddy.lastname}",
              style: nunitoMidBold,
            ),
            SizedBox(height: 24),
            GestureDetector(
                child: Text("Get lawyers around location",
                    style: nunitoMidBoldGreen),
                onTap: () {
                  BlocProvider.of<ReceiveBeepCubit>(context).getLawyers();
                  BlocProvider.of<LawyerBloc>(context).add(GetBuddyLawyers());
                })
          ],
        ),
      )),
    );
  }
}
