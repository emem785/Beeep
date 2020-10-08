import 'dart:async';

import 'package:beep/application/blocs/address_bloc/address_bloc.dart';
import 'package:beep/application/blocs/location_bloc/location_bloc.dart';
import 'package:beep/application/cubits/lawyer_tiles_cubit/lawyer_tiles_cubit.dart';
import 'package:beep/core/utils/StyleGuide.dart';
import 'package:beep/core/widgets/map_widgets/top_bar.dart';
import 'package:beep/core/widgets/menu_widgets/more_menu.dart';
import 'package:beep/infrastructure/models/location.dart';
import 'package:beep/infrastructure/models/map_tools.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';

import 'package:provider/provider.dart';
import '../../../../application/blocs/navigation_bloc/navigation_bloc.dart';
import '../../../../application/blocs/location_bloc/location_bloc.dart';
import 'beep_buttons.dart';
import 'map.dart';

class HomeMap extends StatefulWidget {
  @override
  _HomeMapState createState() => _HomeMapState();
}

class _HomeMapState extends State<HomeMap> {
  _showDialogue(
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

  @override
  Widget build(BuildContext context) {
    final locationBloc = Provider.of<LocationBloc>(context);
    final lawyerTileCubit = Provider.of<LawyerTilesCubit>(context);
    return Container(
      child: Stack(
        children: <Widget>[
          Container(
              child: BlocConsumer<LocationBloc, LocationState>(
                  builder: (context, state) {
            return state.maybeMap(
                orElse: () => SizedBox(),
                mapRendered: (r) {
                  return Map(
                      mapTool: r.mapTool,
                      markerStream: r.mapTool.markerStreamController.stream);
                },
                broadcastStarted: (b) {
                  return Map(
                      mapTool: b.mapTool,
                      markerStream: b.mapTool.markerStreamController.stream);
                },
                broadcastStopped: (n) {
                  return Map(
                      mapTool: n.mapTool,
                      markerStream: n.mapTool.markerStreamController.stream);
                });
          }, listener: (context, state) {
            return state.maybeMap(
                orElse: () => 1,
                mapRendered: (m) =>
                    context.bloc<AddressBloc>().add(GetAddress()));
          })),
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              width: 150.0,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: BlocBuilder<NavigationBloc, NavigationState>(
                  builder: (context, state) {
                    return state.maybeMap(
                        orElse: () => SizedBox(),
                        mapHome: (m) =>
                            BlocBuilder<LocationBloc, LocationState>(
                              builder: (context, state) => state.map(
                                  initial: (i) => SizedBox(),
                                  broadcastStarted: (b) =>
                                      StopBeep(locationBloc: locationBloc),
                                  broadcastStopped: (n) =>
                                      ResumeBeep(locationBloc: locationBloc),
                                  mapRendered: (r) =>
                                      StartBeep(locationBloc: locationBloc)),
                            ));
                  },
                ),
              ),
            ),
          ),
          BlocListener<LawyerTilesCubit, LawyerTilesState>(
            listener: (context, state) {
              return state.maybeMap(
                  orElse: () => 1,
                  lawyerSelected: (l) {
                    return _showDialogue(context, lawyerTileCubit, l.index);
                  });
            },
            child: BlocBuilder<AddressBloc, AddressState>(
                builder: (context, state) {
              return state.map(
                  addressInitial: (i) => TopBar(address: ""),
                  addressLoading: (l) =>
                      TopBar(address: "Getting Address ...."),
                  addressFailure: (f) =>
                      TopBar(address: "Failed to get address"),
                  addressGotten: (g) => TopBar(address: g.address));
            }),
          ),
        ],
      ),
    );
  }
}
