import 'package:intl/intl.dart';

import '../../configs/app_config.dart';

/// convert date and time form timestamp
extension DateTimeFormatter on String {
  /// 01/06/2023
  String toDateFormat() {
    try {
      DateTime timeStamp = DateTime.parse(this);
      var output = DateFormat('dd/MM/yyyy').format(timeStamp);
      return output;
    } catch (e) {
      logger.d("Exception occurred on toDateFormat : $e");
    }
    return '';
  }

  /// 01/06/2023 12:15 PM
  String toDateTimeFormat() {
    try {
      DateTime timeStamp = DateTime.parse(this);
      var output = DateFormat('dd/MM/yyyy hh:mm a').format(timeStamp);
      return output;
    } catch (e) {
      logger.d("Exception occurred on toDateTimeFormat : $e");
    }
    return '';
  }

  ///14:00
  String to24HourTimeFormat() {
    try {
      DateTime timeStamp = DateTime.parse(this);
      var output = DateFormat('HH:mm').format(timeStamp);
      return output;
    } catch (e) {
      logger.d("Exception occurred on to24HourTimeFormat : $e");
    }
    return '';
  }

  /// 10:10 AM
  String to12HourTimeFormat() {
    try {
      DateTime timeStamp = DateTime.parse(this);
      var output = DateFormat('hh:mm a').format(timeStamp);
      return output;
    } catch (e) {
      logger.d("Exception occurred on to12HourTimeFormat : $e");
    }
    return '';
  }

  /// UTC time format -  01/06/2023 12:15 PM
  String toUTCDateTimeFormat() {
    try {
      DateTime dateTime = DateTime.parse(this);
      DateTime timeStamp = dateTime.toUtc();
      var output = DateFormat('dd/MM/yyyy hh:mm a').format(timeStamp);
      return output;
    } catch (e) {
      logger.d("Exception occurred on toUTCDateTimeFormat : $e");
    }
    return '';
  }

  /// Local time format -  01/06/2023 12:15 PM
  /// required this UTC format to convert local
  /// 2023-04-27 04:31:00.000Z
  String toLocalDateTimeFormat() {
    try {
      DateTime dateTime = DateTime.parse(this);
      DateTime timeStamp = dateTime.toLocal();
      var output = DateFormat('dd/MM/yyyy hh:mm a').format(timeStamp);
      return output;
    } catch (e) {
      logger.d("Exception occurred on toLocalDateTimeFormat : $e");
    }
    return '';
  }
}
