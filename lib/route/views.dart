import 'package:firebase_sample/view/calendar.dart';
import 'package:firebase_sample/view/input.dart';
import 'package:flutter/material.dart';

class Views extends StatefulWidget {
  final Stream<int>? viewCtrl;

  const Views({Key? key, required this.viewCtrl}) : super(key: key);
  @override
  _Views createState() => _Views();
}

class _Views extends State<Views> {
  PageController? _pageController;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    listenPage();
    super.initState();
  }

  @override
  void dispose() {
    _pageController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      children: const [
        Input(),
        Calendar(),
      ],
    );
  }

  listenPage() {
    widget.viewCtrl?.listen((event) {
      // <- listenする
      _pageController?.animateToPage(event,
          duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
    });
  }
}
