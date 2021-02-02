package com.ailiwean.wan_android.scan

import android.content.Context
import android.util.AttributeSet
import com.ailiwean.core.Result
import com.ailiwean.core.view.style2.NBZxingView

class ScanView @JvmOverloads constructor(context: Context, attributeSet: AttributeSet? = null, def: Int = 0) : NBZxingView(context, attributeSet, def) {

    lateinit var backRun: (String) -> Unit

    override fun resultBack(content: Result) {
        super.resultBack(content)
        backRun(content.text)
    }

    override fun resultBackFile(content: com.ailiwean.core.zxing.core.Result?) {
        super.resultBackFile(content)
        content?.let {
            backRun(it.text)
        }
    }

    fun bindResult(run: (String) -> Unit) {
        this.backRun = run
    }

}