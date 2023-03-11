import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'long_process_method_channel.dart';

abstract class LongProcessPlatform extends PlatformInterface {
  LongProcessPlatform() : super(token: _token);

  static final Object _token = Object();

  static LongProcessPlatform _instance = MethodChannelLongProcess();

  static LongProcessPlatform get instance => _instance;

  static set instance(LongProcessPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<num?> getWithAsync(int count) {
    throw UnimplementedError('getWithAsync() has not been implemented.');
  }

  Future<num?> getWithSync(int count) {
    throw UnimplementedError('getWithSync() has not been implemented.');
  }
}
