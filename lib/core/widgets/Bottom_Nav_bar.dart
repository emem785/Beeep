import 'package:beep/application/blocs/lawyer_bloc/lawyer_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../application/blocs/navigation_bloc/navigation_bloc.dart';
import 'nav_widget.dart';

class BottomBar extends StatefulWidget {
  final int activeIndex;
  final Function(int) onPressed;

  const BottomBar({
    Key key,
    @required this.activeIndex,
    @required this.onPressed,
  }) : super(key: key);

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  final navList = List<String>.unmodifiable(["Beeep", "Find Lawyers", "More"]);
  @override
  Widget build(BuildContext context) {
    final navigationBloc = BlocProvider.of<NavigationBloc>(context);
    final lawyerBloc = BlocProvider.of<LawyerBloc>(context);
    return Container(
      color: Colors.white,
      height: 50,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            for (var i = 0; i < navList.length; i++)
              InkWell(
                onTap: () {
                  widget.onPressed(i);
                  navigationBloc.add(ChangeNavState(i));
                  if (i == 1) {
                    lawyerBloc.add(GetLawyers());
                  }
                },
                child: NavWidget(
                  itemText: navList[i],
                  isSelected: i == widget.activeIndex,
                ),
              )
          ],
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        ),
      ),
    );
  }
}
