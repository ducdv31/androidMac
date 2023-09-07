package com.ducdv.testshoto.ext

import android.content.Context
import android.hardware.camera2.CameraAccessException
import android.hardware.camera2.CameraManager
import androidx.core.content.ContextCompat

fun Context.getCameraIdList(): List<String>? {
    val cameraIdList: MutableList<String> = ArrayList()
    val cameraManager = ContextCompat.getSystemService(this, CameraManager::class.java) as CameraManager?
    try {
        val cameraIds = cameraManager!!.cameraIdList
        for (cameraId in cameraIds) {
            cameraIdList.add(cameraId)
        }
    } catch (e: CameraAccessException) {
        e.printStackTrace()
    }
    return cameraIdList
}