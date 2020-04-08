import 'package:beep/Providers/ux_control_provider.dart';
import 'package:beep/models/lawyers.dart';
import 'package:beep/models/navigation_item.dart';
import 'package:beep/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class BottomNavyBar extends StatefulWidget {
  final List<NavigationItem> navList;
  final ValueChanged<Function> func;
  final int pageValue;

  const BottomNavyBar({Key key, this.navList, this.func, this.pageValue})
      : super(key: key);
  @override
  _BottomNavyBarState createState() => _BottomNavyBarState();
}

class _BottomNavyBarState extends State<BottomNavyBar> {
  int selectedIndex;
  @override
  void initState() {
    super.initState();
    selectedIndex = widget.pageValue;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UxControl>(builder: (context, ux, child) {
      return Container(
        color: Colors.white,
        height: 50,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: widget.navList.map((item) {
              var itemIndex = widget.navList.indexOf(item);
              return GestureDetector(
                child: _buildNavItem(item, selectedIndex == itemIndex),
                onTap: () {
                  setState(() {
                    selectedIndex = itemIndex;
                  });
                  item.doStuff();
                  switch (ux.currentPage) {
                    case menu.navHomeWithSheet:
                      {
                        _showModal(context);
                      }
                      break;
                    case menu.navHome:
                      {
                        setState(() {
                          selectedIndex = 0;
                          itemIndex = 0;
                        });
                      }
                      break;
                    case menu.navMenu:
                      {
                        setState(() {
                          selectedIndex = 2;
                          itemIndex = 2;
                        });
                      }
                  }
                },
              );
            }).toList(),
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          ),
        ),
      );
    });
  }

  Widget _buildNavItem(NavigationItem item, bool isSelected) {
    return isSelected
        ? Container(
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.brown))),
            child: Center(
              child: Text(
                item.text,
                style: TextStyle(
                    fontSize: 17, color: Colors.brown, fontFamily: 'Nunito', fontWeight: FontWeight.w600),
              ),
            ),
            width: 120,
          )
        : Container(
            child: Center(
                child: Text(
              item.text,
              style: TextStyle(fontSize: 16, fontFamily: 'Nunito',fontWeight: FontWeight.w600),
            )),
            width: 120);
  }

  _showModal(BuildContext context) {
    final List<Lawyers> lawyers = [
      Lawyers(
          distance: '0.5',
          name: 'Barr. Victor Blessing',
          phoneNumber: '11222344',
          profilePic: SvgPicture.asset('assets/images/logo.svg')),
      Lawyers(
          distance: '0.5',
          name: 'Barr. John Doe',
          phoneNumber: '11222344',
          profilePic: SvgPicture.asset('assets/images/logo.svg')),
      Lawyers(
          distance: '0.5',
          name: 'Barr. Victor Blessing',
          phoneNumber: '11222344',
          profilePic: SvgPicture.asset('assets/images/logo.svg')),
      Lawyers(
          distance: '0.5',
          name: 'Barr. John Doe',
          phoneNumber: '11222344',
          profilePic: SvgPicture.asset('assets/images/logo.svg')),
      Lawyers(
          distance: '0.5',
          name: 'Barr. Victor Blessing',
          phoneNumber: '11222344',
          profilePic: SvgPicture.asset('assets/images/logo.svg')),
      Lawyers(
          distance: '0.5',
          name: 'Barr. Victor Blessing',
          phoneNumber: '11222344',
          profilePic: SvgPicture.asset('assets/images/logo.svg')),
      Lawyers(
          distance: '0.5',
          name: 'Barr. Victor Blessing',
          phoneNumber: '11222344',
          profilePic: SvgPicture.asset('assets/images/logo.svg'))
    ];
    showBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            color: Colors.transparent,
            child: Container(
              height: 200,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.black12,
                      blurRadius: 2,
                      spreadRadius: 1,
                      offset: Offset(0, -2))
                ],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: ListView(
                    children: lawyers.map((law) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    child: ListTile(
                      leading: CircleAvatar(child: law.profilePic),
                      title: Text(
                        law.name,
                        style: TextStyle(
                            fontFamily: 'Nunito',
                            fontWeight: FontWeight.w600,
                            fontSize: 16),
                      ),
                      subtitle: Text(
                        '${law.distance}m away',
                        style: TextStyle(fontFamily: 'Nunito', fontSize: 16),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          GestureDetector(
                            child: Icon(Icons.message),
                            onTap: () async {
                              var url = 'sms:${law.phoneNumber}';
                              try {
                                await launch(url);
                              } catch (e) {
                                print(e.toString());
                              }
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: GestureDetector(
                              child: Icon(Icons.call),
                              onTap: () async {
                                var url = 'tel:${law.phoneNumber}';
                                try {
                                  await launch(url);
                                } catch (e) {
                                  print(e.toString());
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList()),
              ),
            ),
          );
        });
  }
}
