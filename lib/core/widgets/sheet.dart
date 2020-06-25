import 'package:beep/infrastructure/models/lawyers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Sheet extends StatefulWidget {
  @override
  _SheetState createState() => _SheetState();
}

class _SheetState extends State<Sheet> {
  final List<Lawyers> lawyers = [
    Lawyers(
      profilePic: SvgPicture.asset('assets/images/logo.svg'),
      distance: '0.5',
      name: 'Barr. Victor Blessing',
      phoneNumber: '11222344',
    ),
    Lawyers(
      profilePic: SvgPicture.asset('assets/images/logo.svg'),
      distance: '0.5',
      name: 'Barr. John Doe',
      phoneNumber: '11222344',
    ),
    Lawyers(
      profilePic: SvgPicture.asset('assets/images/logo.svg'),
      distance: '0.5',
      name: 'Barr. Victor Blessing',
      phoneNumber: '11222344',
    ),
    Lawyers(
      profilePic: SvgPicture.asset('assets/images/logo.svg'),
      distance: '0.5',
      name: 'Barr. John Doe',
      phoneNumber: '11222344',
    ),
    Lawyers(
      profilePic: SvgPicture.asset('assets/images/logo.svg'),
      distance: '0.5',
      name: 'Barr. Victor Blessing',
      phoneNumber: '11222344',
    ),
    Lawyers(
      profilePic: SvgPicture.asset('assets/images/logo.svg'),
      distance: '0.5',
      name: 'Barr. Victor Blessing',
      phoneNumber: '11222344',
    ),
    Lawyers(
      profilePic: SvgPicture.asset('assets/images/logo.svg'),
      distance: '0.5',
      name: 'Barr. Victor Blessing',
      phoneNumber: '11222344',
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.black12,
                blurRadius: 1,
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
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: GestureDetector(
                        child: Icon(Icons.call),
                        onTap: () async {
                          var url = 'tel:${law.phoneNumber}';
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
  }
}
