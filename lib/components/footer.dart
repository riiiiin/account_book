import 'package:flutter/material.dart';

int itemIndex = 0;

class Footer extends StatefulWidget {
  final Sink<int>? viewCtrl;

  Footer({Key? key, required this.viewCtrl}) : super(key: key);

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
    ];
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: pageIndex, 
      onTap: (_pageIndex) {
        pageIndex = _pageIndex;
        widget.viewCtrl?.add(_pageIndex);
      }, 
      items: navigationItem(),
    );
  }
}
