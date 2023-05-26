import 'dart:developer' as dev;

import 'package:logging/logging.dart';

import 'logger_color.dart';

(Logger, Logger) initRiverpodLoggers() {
  final riverpodLogger = Logger('RiverpodInfo');
  final riverpodErrorLogger = Logger('RiverpodError');

  riverpodLogger.level = Level.INFO;
  riverpodErrorLogger.level = Level.SEVERE;

  const infoColor = LoggerColor.cyan;
  const errorColor = LoggerColor.red;

  riverpodLogger.onRecord.listen(
    (record) => dev.log(
      infoColor.printLog(record.message),
      level: record.level.value,
      error: record.error,
      stackTrace: record.stackTrace,
      sequenceNumber: record.sequenceNumber,
      name: record.loggerName,
      time: record.time,
      zone: record.zone,
    ),
  );
  riverpodErrorLogger.onRecord.listen(
    (record) => dev.log(
      errorColor.printLog(record.message),
      level: record.level.value,
      error: record.error,
      stackTrace: record.stackTrace,
      sequenceNumber: record.sequenceNumber,
      name: record.loggerName,
      time: record.time,
      zone: record.zone,
    ),
  );

  return (riverpodLogger, riverpodErrorLogger);
}
