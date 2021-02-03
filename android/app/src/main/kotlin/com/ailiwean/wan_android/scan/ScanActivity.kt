package com.ailiwean.wan_android.scan

import android.app.Activity
import android.content.Intent
import android.graphics.Color
import android.graphics.drawable.ColorDrawable
import android.os.Build
import android.os.Bundle
import android.util.Log
import android.view.View
import android.view.WindowManager
import androidx.appcompat.app.AppCompatActivity
import com.ailiwean.wan_android.R
import kotlinx.android.synthetic.main.scan_layout.*


class ScanActivity : AppCompatActivity() {

    companion object {
        @JvmField
        val requestCode = this@Companion.hashCode()
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.scan_layout)
        fullScreen()
        scanView.synchLifeStart(this)
        scanView.bindResult {
            setResult(Activity.RESULT_OK, Intent().apply {
                putExtra("data", it)
            })
            finish()
        }
    }

    private fun fullScreen() {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
            window.statusBarColor = Color.TRANSPARENT
            window.clearFlags(WindowManager.LayoutParams.FLAG_TRANSLUCENT_STATUS)
            window.decorView.systemUiVisibility = (View.SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN
                    or View.SYSTEM_UI_FLAG_LAYOUT_STABLE)
        }
    }
}