import 'package:firebase_sample/components/button.dart';
import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Storybook(
        stories: [
          Story(
            name: 'Components/Button',
            builder: (context) => MyButton(
              size: 'large',
              onPressed: () => print('Button Pressed!'),
              text: 'Button',
            ),
          ),
        ],
      );
}

void main() {
  runApp(const MyApp());
}
