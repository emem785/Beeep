import 'package:beep/core/widgets/Bottom_Nav_bar.dart';
import 'package:beep/core/widgets/map_home.dart';
import 'package:beep/core/widgets/menu_widgets/more_menu.dart';
import 'package:beep/core/widgets/sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../application/blocs/navigation_bloc/navigation_bloc.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  int navIndex = 0;
  double _height = 0;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, size) {
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
                  duration: Duration(milliseconds: 200),
                  curve: Curves.linear,
                  child: Sheet(),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
