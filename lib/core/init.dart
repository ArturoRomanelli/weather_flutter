import 'package:flutter/material.dart';
import 'package:stack_trace/stack_trace.dart';

void init() {
  FlutterError.demangleStackTrace = (StackTrace stack) {
    if (stack is Trace) return stack.vmTrace;
    if (stack is Chain) return stack.toTrace().vmTrace;
    return stack;
  };
}
