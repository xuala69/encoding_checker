package com.example.encoding_checker

import android.media.MediaCodecList
import androidx.annotation.NonNull

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

/** EncodingCheckerPlugin */
class EncodingCheckerPlugin: FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel : MethodChannel

  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "encoding_checker")
    channel.setMethodCallHandler(this)
  }

  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
    if (call.method == "getPlatformVersion") {
      result.success("Android ${android.os.Build.VERSION.RELEASE}")
    }else if (call.method == "checkH265Support") {
      result.success(isH265Supported())
    } else {
      result.notImplemented()
    }
  }

  private fun isH265Supported(): Boolean {
    val numCodecs = MediaCodecList.getCodecCount()
    for (i in 0 until numCodecs) {
      val codecInfo = MediaCodecList.getCodecInfoAt(i)
      if (codecInfo.isEncoder) {
        continue
      }

      val supportedTypes = codecInfo.supportedTypes
      for (type in supportedTypes) {
        if (type.equals("video/hevc", ignoreCase = true) ||
          type.equals("video/x265", ignoreCase = true)
        ) {
          return true
        }
      }
    }
    return false
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }
}
