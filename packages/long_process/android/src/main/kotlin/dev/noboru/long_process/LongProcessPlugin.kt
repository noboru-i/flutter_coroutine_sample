package dev.noboru.long_process

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import kotlinx.coroutines.*

class LongProcessPlugin : FlutterPlugin, MethodCallHandler {
    private lateinit var channel: MethodChannel

    private val mainScope = CoroutineScope(Dispatchers.Main)

    override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "long_process")
        channel.setMethodCallHandler(this)
    }

    override fun onMethodCall(call: MethodCall, result: Result) {
        when (call.method) {
            // This is a simple case.
            "getWithSync" -> {
                try {
                    val count = call.argument<Long>("count")!!
                    val fibonacciResult = fibonacci(count)
                    result.success(fibonacciResult)
                } catch (e: Throwable) {
                    result.error("ERROR", "unknown error on getWithAsync", e)
                }
            }
            // This is the case of a joining task.
            "getWithAsync" -> {
                mainScope.launch(Dispatchers.IO) {
                    supervisorScope {
                        try {
                            val count = call.argument<Long>("count")!!
                            var fibonacciResult: Long? = null
                            awaitAll(
                                async { fibonacciResult = fibonacci(count) },
                                async { threeSecondsProcess() })
                            result.success(fibonacciResult)
                        } catch (e: Throwable) {
                            result.error("ERROR", "unknown error on getWithAsync", e)
                        }
                    }
                }
            }
        }
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
        mainScope.cancel()
    }

    // dummy of long process
    private fun fibonacci(n: Long): Long {
        if (n == 0L || n == 1L) {
            return n
        }
        return fibonacci(n - 2) + fibonacci(n - 1)
    }

    private fun threeSecondsProcess() {
        Thread.sleep(3000)
    }
}
