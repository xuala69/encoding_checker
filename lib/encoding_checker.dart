
import 'encoding_checker_platform_interface.dart';

class EncodingChecker {
  Future<String?> getPlatformVersion() {
    return EncodingCheckerPlatform.instance.getPlatformVersion();
  }
  Future<bool?> checkH265Support() {
    return EncodingCheckerPlatform.instance.checkH265Support();
  }
}
