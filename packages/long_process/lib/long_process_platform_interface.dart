import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'long_process_method_channel.dart';

abstract class LongProcessPlatform extends PlatformInterface {
  /// Constructs a LongProcessPlatform.
  LongProcessPlatform() : super(token: _token);

  static final Object _token = Object();

  static LongProcessPlatform _instance = MethodChannelLongProcess();

  /// The default instance of [LongProcessPlatform] to use.
  ///
  /// Defaults to [MethodChannelLongProcess].
  static LongProcessPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [LongProcessPlatform] when
  /// they register themselves.
  static set instance(LongProcessPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
