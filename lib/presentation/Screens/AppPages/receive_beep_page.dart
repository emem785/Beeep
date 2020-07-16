import 'package:beep/application/blocs/map_bloc/map_bloc.dart';
import 'package:beep/core/widgets/map_widgets/receive_beep.dart';
import 'package:beep/injectable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReceiveBeepPage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, size) {
      return Scaffold(
        key: _globalKey,
        body: BlocProvider(
            create: (_) => getIt<MapBloc>()..add(GetLocationBroadcast("dffd")),
            child: ReceiveBeep()),
      );
    });
  }
}
