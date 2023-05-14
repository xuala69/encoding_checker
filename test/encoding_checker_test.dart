import 'package:flutter_test/flutter_test.dart';
import 'package:encoding_checker/encoding_checker.dart';
import 'package:encoding_checker/encoding_checker_platform_interface.dart';
import 'package:encoding_checker/encoding_checker_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockEncodingCheckerPlatform
    with MockPlatformInterfaceMixin
    implements EncodingCheckerPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');

  @override
  Future<bool?> checkH265Support()=> Future.value(false);
}

void main() {
  final EncodingCheckerPlatform initialPlatform = EncodingCheckerPlatform.instance;

  test('$MethodChannelEncodingChecker is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelEncodingChecker>());
  });

  test('getPlatformVersion', () async {
    EncodingChecker encodingCheckerPlugin = EncodingChecker();
    MockEncodingCheckerPlatform fakePlatform = MockEncodingCheckerPlatform();
    EncodingCheckerPlatform.instance = fakePlatform;

    expect(await encodingCheckerPlugin.getPlatformVersion(), '42');
  });
}
