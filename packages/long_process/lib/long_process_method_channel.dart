import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'long_process_platform_interface.dart';

/// An implementation of [LongProcessPlatform] that uses method channels.
class MethodChannelLongProcess extends LongProcessPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('long_process');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
