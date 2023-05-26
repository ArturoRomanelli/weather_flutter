import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logging/logging.dart';

class MyProviderObserver extends ProviderObserver {
  const MyProviderObserver({
    required this.logger,
    required this.errorLogger,
  });
  final Logger logger;
  final Logger errorLogger;

  @override
  void providerDidFail(
    ProviderBase<Object?> provider,
    Object error,
    StackTrace stackTrace,
    ProviderContainer container,
  ) {
    errorLogger
      ..info(_log(provider, error, 'throwed'))
      ..info('\tStackTrace:\n$stackTrace');
  }

  @override
  void didUpdateProvider(
    ProviderBase<Object?> provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    if (!kDebugMode) return;
    logger.info(_log(provider, newValue));
  }

  String _log(
    ProviderBase<Object?> provider,
    Object? value, [
    String what = 'updated',
  ]) {
    var logs = '{\n';
    logs += '\t${provider.name}';
    logs += '(${provider.argument})';
    logs += ' ';
    logs += '$what:';
    logs += '\n\t$value';
    logs += '\n}';
    return logs;
  }
}
