# Keep DSD Flutter Plugin
-keep class com.example.dsd_flutter.** { *; }

# Keep native methods and all JNI callbacks
-keepclasseswithmembernames,includedescriptorclasses class * {
    native <methods>;
}

# Keep methods that can be called from native code via JNI
-keepclassmembers class com.example.dsd_flutter.DsdFlutterPlugin {
    public static void sendOutput(java.lang.String);
    public static void sendCallEvent(int, int, int, java.lang.String, int, int, int, int, long, long);
    public static void sendSiteEvent(java.lang.String, long, int, java.lang.String);
    public static void sendSignalEvent(int, int, int, int);
    public static void sendNetworkEvent(int, java.lang.String);
    public static void sendPatchEvent(int, int[], java.lang.String);
    public static void sendGroupAttachmentEvent(int, int, java.lang.String);
    public static void sendAffiliationEvent(int, int, java.lang.String);
}

# Keep Flutter plugin registration
-keep class io.flutter.embedding.engine.** { *; }
-keep class io.flutter.plugin.** { *; }

# Keep EventChannel.EventSink (used from native code)
-keep interface io.flutter.plugin.common.EventChannel$EventSink { *; }
-keep class * implements io.flutter.plugin.common.EventChannel$EventSink { *; }

# Prevent optimization that might break thread synchronization
-keepclassmembers class ** {
    volatile <fields>;
}
