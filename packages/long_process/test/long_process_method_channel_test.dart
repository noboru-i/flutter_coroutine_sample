import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:long_process/long_process_method_channel.dart';

void main() {
  MethodChannelLongProcess platform = MethodChannelLongProcess();
  const MethodChannel channel = MethodChannel('long_process');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  // test('getPlatformVersion', () async {
  //   expect(await platform.getPlatformVersion(), '42');
  // });
}
