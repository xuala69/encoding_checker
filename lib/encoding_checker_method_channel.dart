import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'encoding_checker_platform_interface.dart';

/// An implementation of [EncodingCheckerPlatform] that uses method channels.
class MethodChannelEncodingChecker extends EncodingCheckerPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('encoding_checker');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<bool?> checkH265Support() async {
    final version = await methodChannel.invokeMethod<bool>('checkH265Support');
    return version;
  }
}
