import 'long_process_platform_interface.dart';

class LongProcess {
  Future<num?> getWithAsync(int count) {
    return LongProcessPlatform.instance.getWithAsync(count);
  }

  Future<num?> getWithSync(int count) {
    return LongProcessPlatform.instance.getWithSync(count);
  }
}
