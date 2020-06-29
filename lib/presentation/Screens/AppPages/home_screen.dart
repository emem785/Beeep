import 'package:beep/application/blocs/map_bloc/map_bloc.dart';
import 'package:beep/core/widgets/Bottom_Nav_bar.dart';
import 'package:beep/core/widgets/map_home.dart';
import 'package:beep/core/widgets/menu_widgets/more_menu.dart';
import 'package:beep/core/widgets/sheet.dart';
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
  @override
  void initState() {
    super.initState();
    initUniLinks();
  }

  Future<Null> initUniLinks() async {
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      String initialLink = await getInitialLink();
      // Parse the link and warn the user, if it is not correct,
      // but keep in mind it could be `null`.
      if (initialLink != null) {
        Navigator.pushNamed(context, '/ReceiveBeep',
            arguments: {"phone": initialLink.substring(33)});
      }
    } on PlatformException {
      // Handle exception by warning the user their action did not succeed
      // return?
    }
  }

  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  int navIndex = 0;
  double _height = 0;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt<LocationBloc>(),
        ),
        BlocProvider(
          create: (_) => getIt<LawyerBloc>(),
        ),
        BlocProvider(
          create: (_) => getIt<MapBloc>(),
        )
      ],
      child: LayoutBuilder(builder: (context, size) {
        return Scaffold(
          key: _globalKey,
          bottomNavigationBar: BottomBar(
            activeIndex: navIndex,
            onPressed: (i) => setState(() => navIndex = i),
          ),
          body: Container(
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
                    width: size.maxWidth,
                    duration: Duration(milliseconds: 100),
                    curve: Curves.linear,
                    child: Sheet(),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
