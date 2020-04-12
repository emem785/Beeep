import 'package:beep/Providers/ux_control_provider.dart';
import 'package:beep/models/navigation_item.dart';
import 'package:beep/widgets/Bottom_Nav_bar.dart';
import 'package:beep/widgets/map_home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  final int pageValue;

  const HomeScreen({Key key, this.pageValue}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var getPage = Provider.of<UxControl>(context);
    return Scaffold(
      bottomNavigationBar: BottomNavyBar(
        navList: [
          NavigationItem("Beeep", () => getPage.home(context)),
          NavigationItem("Find Lawyer", () => getPage.homeWithSheet(context)),
          NavigationItem("More", () => getPage.homeToMenu(context)),
        ],
        pageValue: widget.pageValue,
      ),
      body: WillPopScope(child: MapHome(),onWillPop:()=> Future.value(false),),
    );
  }
 
}
