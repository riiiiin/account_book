import 'package:firebase_sample/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

DateTime _focusedDay = DateTime.now();

class MyCalendar extends StatefulWidget {
  const MyCalendar({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyCalendar> createState() => _MyCalendarState();
}

class _MyCalendarState extends State<MyCalendar> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: TableCalendar(
        locale: 'ja_JP',
        daysOfWeekHeight: 30,
        rowHeight: 50,
        firstDay: DateTime.utc(2022, 4, 1),
        lastDay: DateTime.utc(2025, 12, 31),
        focusedDay: _focusedDay,
        calendarFormat: CalendarFormat.month,
        startingDayOfWeek: StartingDayOfWeek.sunday,
        calendarStyle: const CalendarStyle(
            defaultTextStyle:
                TextStyle(fontFamily: 'Roboto', color: primaryColor)),
        headerStyle: const HeaderStyle(
          formatButtonVisible: false,
        ),
        calendarBuilders: CalendarBuilders(
          defaultBuilder: (context, date, _) {
            return Column(
              children: [
                Text(
                  '${date.day}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4), // 適切なスペースを追加
                const Text(
                  '111,111',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              ],
            );
          },
          todayBuilder: (context, date, _) {
            return Stack(
              children: [
                Column(
                  children: [
                    Center(
                      child: Text(
                        '${date.day}',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black, // focusedDayのテキスト色
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Center(
                      child: Text(
                        '111,111',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: const Alignment(0, -1),
                  child: Container(
                    width: 26,
                    height: 26,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromRGBO(0, 149, 255, 0.29), // 赤い丸の色
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
