import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';

class DatePickera extends StatefulWidget {
  final Function selectedDate;
  const DatePickera({ Key? key, required this.selectedDate }) : super(key: key);

  @override
  State<DatePickera> createState() => _DatePickeraState();
}

class _DatePickeraState extends State<DatePickera> {
  String selectedDate = DateTime.now().toString();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
          onPressed: () {
            DatePicker.showDatePicker(
              context,
              showTitleActions: true,
              minTime: DateTime(2022, 1, 1),
              maxTime: DateTime(2023, 12, 31),
              onChanged: (date) {
                print(date);
              },
              onConfirm: (date) {
                print(date);
                setState(() {
                  selectedDate = '${date.year}年${date.month}月${date.day}日';
                });
                widget.selectedDate('${date.year}年${date.month}月${date.day}日');
              },
              currentTime: DateTime.now(),
              locale: LocaleType.jp,
            );
          },
          child: Text(
              selectedDate.toString(),
              style: TextStyle(color: Colors.blue),
          ),
        ),
      ],
    );
  }
}