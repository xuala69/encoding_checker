# encoding_checker

The sole purpose of this plugin is to check if an android device supports playing h265 encoded videos.

# How to use

1. Create an instance of the plugin *EncodingChecker*

```
final _encodingCheckerPlugin = EncodingChecker();
```

2. Check for h265 support by calling the function *checkH265Support()*

```
final checkResult =await _encodingCheckerPlugin.checkH265Support() 
```
