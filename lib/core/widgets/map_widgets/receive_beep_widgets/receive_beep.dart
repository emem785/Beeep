import 'dart:async';

import 'package:beep/application/blocs/address_bloc/address_bloc.dart';
import 'package:beep/application/blocs/auth_bloc/auth_bloc.dart';
import 'package:beep/application/cubits/lawyer_tiles_cubit/lawyer_tiles_cubit.dart';
import 'package:beep/application/cubits/receive_beep_cubit/receive_beep_cubit.dart';
import 'package:beep/core/widgets/bottom_nav_bar_widgets/lawyer_bottom_sheet.dart';
import 'package:beep/core/widgets/map_widgets/receive_beep_widgets/bottom_container.dart';
import 'package:beep/core/widgets/map_widgets/receive_beep_widgets/receive_beep_map.dart';
import 'package:beep/core/widgets/map_widgets/top_bar.dart';
import 'package:beep/application/blocs/map_bloc/map_bloc.dart';
import 'package:beep/core/utils/StyleGuide.dart';
import 'package:beep/injectable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import '../map_home_widgets/map.dart';

const double ZOOM = 17;

class ReceiveBeep extends StatefulWidget {
  @override
  _ReceiveBeepState createState() => _ReceiveBeepState();
}

class _ReceiveBeepState extends State<ReceiveBeep> {
  Future<bool> _onWillPop(MapBloc mapBloc) async {
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

  @override
  Widget build(BuildContext context) {
    final mapBloc = Provider.of<MapBloc>(context);

    double _height = MediaQuery.of(context).size.height * 0.18;
    return WillPopScope(
      onWillPop: () => _onWillPop(mapBloc),
      child: LayoutBuilder(builder: (context, size) {
        return Container(
          child: Stack(
            children: <Widget>[
              Container(child: BlocBuilder<MapBloc, MapState>(
                builder: (context, state) {
                  return state.maybeMap(
                    orElse: () => SizedBox(),
                    mapRendered: (r) => ReceiveBeepMap(
                        mapTool: r.mapTool,
                        markerStream: r.mapTool.markerStreamController.stream),
                    broadcastStarted: (b) => ReceiveBeepMap(
                        mapTool: b.mapTool,
                        markerStream: b.mapTool.markerStreamController.stream),
                  );
                },
              )),
              Align(
                alignment: Alignment.bottomCenter,
                child: BlocBuilder<MapBloc, MapState>(
                  builder: (context, state) {
                    return state.maybeMap(
                      orElse: () => SizedBox(),
                      mapRendered: (r) =>
                          BottomContainerLoading(height: size.maxHeight * 0.18),
                      broadcastStarted: (b) => BlocProvider(
                        create: (context) => getIt<LawyerTilesCubit>(),
                        child: BlocConsumer<ReceiveBeepCubit, ReceiveBeepState>(
                          builder: (context, state) {
                            return state.map(
                                initial: (i) => BottomContainer(
                                      height: size.maxHeight * 0.18,
                                      buddy: b.buddy,
                                    ),
                                lawyersGotten: (l) => AnimatedContainer(
                                    height: _height,
                                    curve: Curves.linear,
                                    width: MediaQuery.of(context).size.width,
                                    duration: Duration(milliseconds: 100),
                                    child: LawyerBottomSheet()));
                          },
                          listener: (context, state) {
                            return state.maybeMap(
                                orElse: () => 1,
                                lawyersGotten: (l) =>
                                    _height = size.maxHeight * 0.4);
                          },
                        ),
                      ),
                      loading: (l) =>
                          BottomContainerLoading(height: size.maxHeight * 0.18),
                    );
                  },
                ),
              ),
              BlocBuilder<AddressBloc, AddressState>(builder: (context, state) {
                return state.map(
                    addressInitial: (i) => TopBar(address: ""),
                    addressLoading: (l) =>
                        TopBar(address: "Getting Address ..."),
                    addressFailure: (f) =>
                        TopBar(address: "Failed to get address"),
                    addressGotten: (g) => TopBar(address: g.address));
              }),
              BlocBuilder<ReceiveBeepCubit, ReceiveBeepState>(
                builder: (context, state) {
                  return state.map(
                      initial: (i) => SizedBox(),
                      lawyersGotten: (l) => Positioned(
                            child: GestureDetector(
                                onTap: () {
                                  context
                                      .bloc<ReceiveBeepCubit>()
                                      .hideLawyers();
                                },
                                child: Container(
                                  child: Icon(Icons.arrow_left,
                                      color: Colors.grey),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(50))),
                                  height: 40,
                                  width: 40,
                                )),
                            top: MediaQuery.of(context).size.height * 0.50,
                            right: MediaQuery.of(context).size.width * 0.87,
                          ));
                },
              ),
            ],
          ),
        );
      }),
    );
  }
}
