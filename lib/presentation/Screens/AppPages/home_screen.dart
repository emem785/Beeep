import 'dart:async';

import 'package:beep/application/blocs/address_bloc/address_bloc.dart';
import 'package:beep/application/blocs/map_bloc/map_bloc.dart';
import 'package:beep/application/cubits/lawyer_tiles_cubit/lawyer_tiles_cubit.dart';
import 'package:beep/core/hooks/firbase_messaging_hook.dart';
import 'package:beep/core/hooks/unilink_hook.dart';
import 'package:beep/core/widgets/bottom_nav_bar_widgets/Bottom_Nav_bar.dart';
import 'package:beep/core/widgets/bottom_nav_bar_widgets/lawyer_bottom_sheet.dart';
import 'package:beep/core/widgets/map_widgets/map_home_widgets/map_home.dart';
import 'package:beep/core/widgets/menu_widgets/more_menu.dart';
import 'package:beep/injectable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get_it/get_it.dart';
import '../../../application/blocs/navigation_bloc/navigation_bloc.dart';
import '../../../application/blocs/location_bloc/location_bloc.dart';
import '../../../application/blocs/lawyer_bloc/lawyer_bloc.dart';
import 'package:uni_links/uni_links.dart';
import 'package:flutter/services.dart';

class HomeInitializer extends HookWidget {
  @override
  Widget build(BuildContext context) {
    useUnilinkHook();
    final firebase = useFirebaseMessagingHook();
    return BlocProvider(
        create: (_) => getIt<LocationBloc>()..add(RenderMap(firebase)),
        child: HomeScreen());
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //TODO: Initialize firebase

  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  int navIndex = 0;
  double _height = 0;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<AddressBloc>()),
        BlocProvider(create: (_) => getIt<LawyerBloc>()),
        BlocProvider(create: (_) => getIt<LawyerTilesCubit>()),
      ],
      child: Scaffold(
        key: _globalKey,
        bottomNavigationBar: BottomBar(
          activeIndex: navIndex,
          onPressed: (i) => setState(() => navIndex = i),
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: <Widget>[
              HomeMap(),
              BlocConsumer<NavigationBloc, NavigationState>(
                builder: (_, state) {
                  return state.maybeMap(
                      orElse: () => SizedBox(), menu: (m) => MoreMenu());
                },
                listener: (_, state) {
                  return state.map(
                      mapHome: (h) => setState(() => _height = h.i),
                      showLawyers: (s) => setState(() => _height = s.i),
                      menu: (m) => setState(() => _height = m.i));
                },
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: AnimatedContainer(
                  height: _height,
                  width: MediaQuery.of(context).size.width,
                  duration: Duration(milliseconds: 100),
                  curve: Curves.linear,
                  child: LawyerBottomSheet(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
