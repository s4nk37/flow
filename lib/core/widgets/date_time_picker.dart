import '../utils/theme/app_theme.dart';
import 'package:flutter/cupertino.dart';

class DateTimePickerWidget extends StatelessWidget {
  final Function onDateTimeChanged;
  final DateTime? initialDateTime;

  const DateTimePickerWidget(
      {super.key, required this.onDateTimeChanged, this.initialDateTime});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: CupertinoTheme(
        data: CupertinoThemeData(
          textTheme: CupertinoTextThemeData(
            dateTimePickerTextStyle: TextStyle(
              color: AppTheme.of(context).primary,
              fontWeight: FontWeight.w600,
              fontSize: 15,
            ),
          ),
        ),
        child: CupertinoDatePicker(
          initialDateTime:
              initialDateTime ?? DateTime.now().add(const Duration(seconds: 1)),
          minimumDate: DateTime.now(),
          maximumDate: DateTime.now().add(const Duration(days: 3650)),
          mode: CupertinoDatePickerMode.dateAndTime,
          onDateTimeChanged: (date) => onDateTimeChanged(date),
        ),
      ),
    );
  }
}

class TimePickerWidget extends StatelessWidget {
  final Function onDateTimeChanged;

  const TimePickerWidget({super.key, required this.onDateTimeChanged});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: CupertinoTheme(
        data: CupertinoThemeData(
          textTheme: CupertinoTextThemeData(
            dateTimePickerTextStyle: TextStyle(
              color: AppTheme.of(context).primary,
              fontWeight: FontWeight.w600,
              fontSize: 15,
            ),
          ),
        ),
        child: CupertinoDatePicker(
          initialDateTime: DateTime.now().add(const Duration(seconds: 1)),
          mode: CupertinoDatePickerMode.time,
          onDateTimeChanged: (date) => onDateTimeChanged(date),
        ),
      ),
    );
  }
}
