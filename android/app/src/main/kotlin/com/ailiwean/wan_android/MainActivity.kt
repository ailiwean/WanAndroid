package com.ailiwean.wan_android

import android.app.Activity
import android.content.Intent
import android.os.Bundle
import com.ailiwean.wan_android.scan.MethodChannelExecute
import com.ailiwean.wan_android.scan.ScanActivity
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity : FlutterActivity() {


    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        flutterEngine?.let {
            GeneratedPluginRegistrant.registerWith(it)
            registerCustomPlugin(it)
        }
    }

    private fun registerCustomPlugin(engine: FlutterEngine) {
        MethodChannelExecute.register(engine.dartExecutor.binaryMessenger, this)
    }


    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        super.onActivityResult(requestCode, resultCode, data)
        //扫码
        if (requestCode == ScanActivity.requestCode && resultCode == Activity.RESULT_OK) {
            MethodChannelExecute.setResult(data?.getStringExtra("data"))
        }

    }

}
