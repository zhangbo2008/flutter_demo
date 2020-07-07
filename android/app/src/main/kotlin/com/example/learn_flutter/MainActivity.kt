package com.flutter.study_app

import android.os.Bundle
import io.flutter.app.FlutterActivity
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity : FlutterActivity() {
    //通讯名称,回到手机桌面
    private val chanel = "android/back/desktop"
    protected fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        GeneratedPluginRegistrant.registerWith(this)
        initBackTop()
    }

    //注册返回到手机桌面事件
    private fun initBackTop() {
        MethodChannel(getFlutterView(), chanel).setMethodCallHandler(
                { methodCall, result ->
                    if (methodCall.method.equals(eventBackDesktop)) {
                        moveTaskToBack(false)
                        result.success(true)
                    }
                }
        )
    }

    companion object {
        //返回手机桌面事件
        const val eventBackDesktop = "backDesktop"
    }
}