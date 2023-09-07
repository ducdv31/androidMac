package com.ducdv.testshoto.ui.view

import android.content.Context
import android.hardware.Camera
import android.view.SurfaceHolder
import android.view.SurfaceView

class CameraPreview(context: Context, private val camera: Camera) : SurfaceView(context), SurfaceHolder.Callback {

    private val surfaceHolder: SurfaceHolder = holder.apply {
        addCallback(this@CameraPreview)
    }

    override fun surfaceCreated(holder: SurfaceHolder) {
        try {
            camera.setPreviewDisplay(holder)
            camera.startPreview()
        } catch (e: Exception) {
            // Xử lý lỗi
        }
    }

    override fun surfaceChanged(holder: SurfaceHolder, format: Int, width: Int, height: Int) {
        // Không làm gì trong trường hợp này
    }

    override fun surfaceDestroyed(holder: SurfaceHolder) {
        // Dừng trước khi hủy
        camera.stopPreview()
    }
}