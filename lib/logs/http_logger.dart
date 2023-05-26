import 'dart:developer' as dev;

import 'package:logging/logging.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'logger_color.dart';

part 'http_logger.g.dart';

@riverpod
Logger httpLogger(HttpLoggerRef ref) {
  final httpLogger = Logger('Dio');
  const logWithColor = LoggerColor.green;
  httpLogger.level = Level.INFO;

  final subscription = httpLogger.onRecord.listen(
    (record) => dev.log(
      logWithColor.printLog(record.message),
      level: record.level.value,
      error: record.error,
      stackTrace: record.stackTrace,
      sequenceNumber: record.sequenceNumber,
      name: record.loggerName,
      time: record.time,
      zone: record.zone,
    ),
  );

  ref.onDispose(subscription.cancel);

  return httpLogger;
}
