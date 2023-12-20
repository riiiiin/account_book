import 'package:firebase_sample/utils/styles.dart';
import 'package:flutter/material.dart';

int itemIndex = 0;

class Footer extends StatefulWidget {
  final Sink<int>? viewCtrl;

  const Footer({Key? key, required this.viewCtrl}) : super(key: key);

  @override
  _Footer createState() => _Footer();
}

class _Footer extends State<Footer> {
  int pageIndex = 0;

  navigationItem() {
    return const [
      BottomNavigationBarItem(
        icon: Icon(Icons.create_rounded),
        label: 'Input',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.calendar_today),
        label: 'Calendar',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.settings),
        label: 'Setting',
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(126, 151, 168, 0.24),
            blurRadius: 7,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: BottomNavigationBar(
        currentIndex: pageIndex,
        selectedItemColor: secondaryColor,
        unselectedItemColor: primaryColor,
        onTap: (index) {
          setState(() {
            pageIndex = index;
          });
          widget.viewCtrl?.add(pageIndex);
        },
        items: navigationItem(),
      ),
    );
  }
}
