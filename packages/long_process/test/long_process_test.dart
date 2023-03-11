// import 'package:flutter_test/flutter_test.dart';
// import 'package:long_process/long_process.dart';
// import 'package:long_process/long_process_platform_interface.dart';
// import 'package:long_process/long_process_method_channel.dart';
// import 'package:plugin_platform_interface/plugin_platform_interface.dart';

// class MockLongProcessPlatform
//     with MockPlatformInterfaceMixin
//     implements LongProcessPlatform {

//   @override
//   Future<String?> getPlatformVersion() => Future.value('42');
// }

// void main() {
//   final LongProcessPlatform initialPlatform = LongProcessPlatform.instance;

//   test('$MethodChannelLongProcess is the default instance', () {
//     expect(initialPlatform, isInstanceOf<MethodChannelLongProcess>());
//   });

//   test('getPlatformVersion', () async {
//     LongProcess longProcessPlugin = LongProcess();
//     MockLongProcessPlatform fakePlatform = MockLongProcessPlatform();
//     LongProcessPlatform.instance = fakePlatform;

//     expect(await longProcessPlugin.getPlatformVersion(), '42');
//   });
// }
