import 'dart:async';

import 'package:beep/application/blocs/address_bloc/address_bloc.dart';
import 'package:beep/application/blocs/map_bloc/map_bloc.dart';
import 'package:beep/core/widgets/bottom_nav_bar_widgets/Bottom_Nav_bar.dart';
import 'package:beep/core/widgets/bottom_nav_bar_widgets/lawyer_bottom_sheet.dart';
import 'package:beep/core/widgets/map_widgets/map_home_widgets/map_home.dart';
import 'package:beep/core/widgets/menu_widgets/more_menu.dart';
import 'package:beep/injectable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../application/blocs/navigation_bloc/navigation_bloc.dart';
import '../../../application/blocs/location_bloc/location_bloc.dart';
import '../../../application/blocs/lawyer_bloc/lawyer_bloc.dart';
import 'package:uni_links/uni_links.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  StreamSubscription _subscription;
  @override
  void initState() {
    super.initState();
    initUniLinks();
  }

  Future<Null> initUniLinks() async {
    try {
      String initialLink = await getInitialLink();
      if (initialLink != null) {
        Navigator.pushNamed(context, '/ReceiveBeep');
      }
      _subscription = getUriLinksStream().listen((Uri uri) {
        Navigator.pushNamedAndRemoveUntil(
            context, '/ReceiveBeep', ModalRoute.withName('/HomeScreen'));
      }, onError: (err) {
        _subscription.cancel();
        print(err.toString());
      });
    } on PlatformException {
      _subscription.cancel();
    }
  }

  @override
  void dispose() {
    super.dispose();
    _subscription.cancel();
  }

  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  int navIndex = 0;
  double _height = 0;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<LocationBloc>()..add(RenderMap())),
        BlocProvider(create: (_) => getIt<AddressBloc>()..add(GetAddress())),
        BlocProvider(create: (_) => getIt<LawyerBloc>()),
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
