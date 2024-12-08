import 'dart:developer';

import 'package:flutter/foundation.dart';

void safePrint(Object object, [String? tag]) {
  if (kDebugMode) {
    log("${tag != null ? "[${tag.toUpperCase()}]" : ''}[${DateTime.now()}]: $object");
  }
}
