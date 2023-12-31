import 'package:firebase_sample/components/button.dart';
import 'package:firebase_sample/components/calendar.dart';
import 'package:firebase_sample/components/text_field.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
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
          Story(
            name: 'Components/TextField1',
            builder: (context) => MyTextField(
              controller: TextEditingController(),
              labelText: 'パスワード',
              placeholder: 'password',
              isPassword: true,
            ),
          ),
          Story(
            name: 'Components/TextField2',
            builder: (context) => MyTextField(
              controller: TextEditingController(),
              labelText: 'メールアドレス',
              placeholder: 'mail',
              isPassword: false,
            ),
          ),
          Story(
            name: 'Components/Calendar',
            builder: (context) => MyCalendar(title: 'Calendar'),
          ),
        ],
      );
}

void main() {
  initializeDateFormatting('ja').then((_) => runApp(const MyApp()));
}
