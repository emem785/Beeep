import 'package:beep/application/blocs/map_bloc/map_bloc.dart';
import 'package:beep/application/cubits/lawyer_tiles_cubit/lawyer_tiles_cubit.dart';
import 'package:beep/core/utils/StyleGuide.dart';
import 'package:flutter/material.dart';

Future<bool> onWillPop(MapBloc mapBloc, BuildContext context) async {
  return (await showDialog(
        context: context,
        builder: (context) => new AlertDialog(
          title: new Text('Are you sure?', style: nunitoMid),
          content: new Text('Do you want to stop receiving Broadcast',
              style: nunitoMid),
          actions: <Widget>[
            new FlatButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: new Text('NO', style: nunitoMidPromptPink),
            ),
            new FlatButton(
              onPressed: () {
                mapBloc.add(StopSecondBroadcast());
                Navigator.of(context).pop(true);
              },
              child: new Text('YES', style: nunitoMidPrompt),
            ),
          ],
        ),
      )) ??
      false;
}

showDialogue(
    BuildContext context, LawyerTilesCubit lawyerTilesCubit, String index) {
  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        print("engaged");
        return AlertDialog(
          title: Text("Are you sure you want to hire this lawyer",
              style: nunitoMid),
          actions: <Widget>[
            FlatButton(
                child: Text("YES", style: nunitoMidPrompt),
                onPressed: () {
                  lawyerTilesCubit.confirmEngagement(index);
                  Navigator.of(context).pop();
                }),
            FlatButton(
                child: Text("NO", style: nunitoMidPromptPink),
                onPressed: () {
                  lawyerTilesCubit.engagementNotConfirmed();
                  Navigator.of(context).pop();
                }),
          ],
        );
      });
}

showErrorDialogue(BuildContext context, MapBloc mapBloc) {
  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        print("engaged");
        return AlertDialog(
          title: Text(
              "There was an error establishing a connection to your buddy, do you want to try and reconnect?",
              style: nunitoMid),
          actions: <Widget>[
            FlatButton(
                child: Text("YES", style: nunitoMidPrompt),
                onPressed: () {
                  mapBloc.add(RenderBuddyMap());
                  Navigator.of(context).pop();
                }),
            FlatButton(
                child: Text("NO", style: nunitoMidPromptPink),
                onPressed: () {
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil('/HomeScreen', (route) => false);
                }),
          ],
        );
      });
}

showDialogueDone(BuildContext context, MapBloc mapBloc) {
  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        print("engaged");
        return AlertDialog(
          title: Text(
              "Your Buddy Has ended the beeep Session",
              style: nunitoMid),
          actions: <Widget>[
            FlatButton(
                child: Text("Go Home", style: nunitoMidPromptPink),
                onPressed: () {
                  // Navigator.of(context)
                  //     .pushNamedAndRemoveUntil('/HomeScreen', (route) => false);
                  Navigator.popUntil(context, (route) => route.isFirst);
                }),
          ],
        );
      });
}
