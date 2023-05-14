import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'encoding_checker_method_channel.dart';

abstract class EncodingCheckerPlatform extends PlatformInterface {
  /// Constructs a EncodingCheckerPlatform.
  EncodingCheckerPlatform() : super(token: _token);

  static final Object _token = Object();

  static EncodingCheckerPlatform _instance = MethodChannelEncodingChecker();

  /// The default instance of [EncodingCheckerPlatform] to use.
  ///
  /// Defaults to [MethodChannelEncodingChecker].
  static EncodingCheckerPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [EncodingCheckerPlatform] when
  /// they register themselves.
  static set instance(EncodingCheckerPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
  Future<bool?> checkH265Support() {
    throw UnimplementedError('checkH265Support method has not been implemented');
  }
}
