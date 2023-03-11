import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'long_process_platform_interface.dart';

class MethodChannelLongProcess extends LongProcessPlatform {
  @visibleForTesting
  final methodChannel = const MethodChannel('long_process');

  @override
  Future<num?> getWithAsync(int count) {
    final param = {
      'count': count,
    };
    return methodChannel.invokeMethod<num>('getWithAsync', param);
  }

  @override
  Future<num?> getWithSync(int count) {
    final param = {
      'count': count,
    };
    return methodChannel.invokeMethod<num>('getWithSync', param);
  }
}
