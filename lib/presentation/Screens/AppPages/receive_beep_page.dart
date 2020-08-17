import 'package:beep/application/blocs/address_bloc/address_bloc.dart';
import 'package:beep/application/blocs/lawyer_bloc/lawyer_bloc.dart';
import 'package:beep/application/blocs/map_bloc/map_bloc.dart';
import 'package:beep/application/cubits/receive_beep_cubit/receive_beep_cubit.dart';
import 'package:beep/core/widgets/map_widgets/receive_beep_widgets/receive_beep.dart';
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
        body: MultiBlocProvider(
          providers: [
            BlocProvider(
                create: (_) => getIt<MapBloc>()..add(RenderBuddyMap())),
            BlocProvider(
                create: (_) => getIt<AddressBloc>()..add(GetBuddyAddress())),
            BlocProvider(create: (_) => getIt<LawyerBloc>()),
            BlocProvider(create: (_) => ReceiveBeepCubit())
          ],
          child: ReceiveBeep(),
        ),
      );
    });
  }
}
