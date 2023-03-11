
import 'long_process_platform_interface.dart';

class LongProcess {
  Future<String?> getPlatformVersion() {
    return LongProcessPlatform.instance.getPlatformVersion();
  }
}
