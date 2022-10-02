package com.example.workmanager

import android.content.Context
import androidx.work.Worker
import androidx.work.WorkerParameters
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.delay
import kotlinx.coroutines.launch

class MyWork(context: Context, workerParams: WorkerParameters) : Worker(context, workerParams) {
    override fun doWork(): Result {
        var x = 0
        CoroutineScope(Dispatchers.IO).launch {
            while (x < 1000000000000) {
                x++
                delay(1000)
            }
        }
        return Result.success()
    }
}