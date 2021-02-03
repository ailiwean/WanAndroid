package com.ailiwean.wan_android.scan;

import android.app.Activity;
import android.content.Intent;

import androidx.annotation.NonNull;

import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;

public class MethodChannelExecute implements MethodChannel.MethodCallHandler {

    public static String CHANNEL = "com.ailiwean.wanandroid.scan";
    public static String METHOD = "scan";
    private static MethodChannelExecute methodCallHandler;

    Activity rootActivity;

    private MethodChannel.Result result;

    private MethodChannelExecute() {
    }

    public static void register(BinaryMessenger binaryMessenger, Activity activity) {
        MethodChannel methodChannel = new MethodChannel(binaryMessenger, CHANNEL);
        methodCallHandler = new MethodChannelExecute();
        methodCallHandler.rootActivity = activity;
        methodChannel.setMethodCallHandler(methodCallHandler);
    }

    public static void setResult(Object result) {
        if (methodCallHandler != null && methodCallHandler.result != null)
            methodCallHandler.result.success(result.toString());
    }

    @Override
    public void onMethodCall(@NonNull MethodCall call, @NonNull MethodChannel.Result result) {
        if (call.method.contains(METHOD)) {
            this.result = result;
            startActivity();
        }
    }

    public void startActivity() {
        rootActivity.startActivityForResult(new Intent(rootActivity, ScanActivity.class), ScanActivity.requestCode);
    }

}
