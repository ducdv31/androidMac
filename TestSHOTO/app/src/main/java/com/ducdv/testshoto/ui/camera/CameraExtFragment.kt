package com.ducdv.testshoto.ui.camera

import android.content.Context
import android.graphics.Camera
import android.hardware.camera2.CameraAccessException
import android.hardware.camera2.CameraManager
import android.hardware.usb.UsbDevice
import android.os.Build
import android.os.Bundle
import android.util.Log
import android.view.Gravity
import android.view.LayoutInflater
import android.view.SurfaceHolder
import android.view.View
import android.view.ViewGroup
import androidx.core.content.ContextCompat.getSystemService
import com.ducdv.testshoto.databinding.FragmentCameraExtBinding
import com.ducdv.testshoto.ext.lgScreen
import com.ducdv.testshoto.ext.showToast
import com.jiangdg.ausbc.MultiCameraClient
import com.jiangdg.ausbc.base.CameraFragment
import com.jiangdg.ausbc.callback.ICameraStateCallBack
import com.jiangdg.ausbc.camera.bean.CameraRequest
import com.jiangdg.ausbc.render.env.RotateType
import com.jiangdg.ausbc.widget.IAspectRatio


class CameraExtFragment : CameraFragment() {

    private lateinit var binding: FragmentCameraExtBinding
    private lateinit var camera: Camera

    override fun onCreateView(inflater: LayoutInflater, container: ViewGroup?, savedInstanceState: Bundle?): View? {
        binding = FragmentCameraExtBinding.inflate(inflater, container, false)
        val surfaceHolder = binding.aspectRatioSurfaceView.holder
        surfaceHolder.addCallback(object : SurfaceHolder.Callback {
            override fun surfaceCreated(holder: SurfaceHolder) {
                showToast("surfaceCreated")
                val canvas = holder.lockCanvas()
                // Vẽ hình ảnh, video, đồ họa lên canvas
                holder.unlockCanvasAndPost(canvas)
            }

            override fun surfaceChanged(holder: SurfaceHolder, format: Int, width: Int, height: Int) {
                // Được gọi khi kích thước hoặc định dạng của SurfaceView thay đổi
                showToast("surfaceChanged")
                lgScreen(width.toString(), height.toString())
            }

            override fun surfaceDestroyed(holder: SurfaceHolder) {
                // Được gọi khi SurfaceView bị hủy
                showToast("surfaceDestroyed")
            }
        })
        return binding.root
    }

    override fun getRootView(inflater: LayoutInflater, container: ViewGroup?): View? {
        return binding.root
    }

    override fun getCameraView(): IAspectRatio? {
        return binding.aspectRatioSurfaceView
    }

    override fun getCameraViewContainer(): ViewGroup? {
        return binding.root
    }

    override fun onCameraState(self: MultiCameraClient.ICamera, code: ICameraStateCallBack.State, msg: String?) {
        when (code) {
            ICameraStateCallBack.State.OPENED -> {
                showToast("OPENED")
            }

            ICameraStateCallBack.State.CLOSED -> {
                showToast("CLOSED")
            }

            ICameraStateCallBack.State.ERROR -> {
                showToast("ERROR")
            }
        }
    }

    override fun getGravity(): Int {
        return Gravity.TOP
    }

    override fun getCameraRequest(): CameraRequest {
        return CameraRequest.Builder()
            .setPreviewWidth(1280) // camera preview width
            .setPreviewHeight(720) // camera preview height
            .setRenderMode(CameraRequest.RenderMode.OPENGL) // camera render mode
            .setDefaultRotateType(RotateType.ANGLE_0) // rotate camera image when opengl mode
            .setAudioSource(CameraRequest.AudioSource.SOURCE_AUTO) // set audio source
            .setAspectRatioShow(true) // aspect render,default is true
            .setCaptureRawImage(false) // capture raw image picture when opengl mode
            .setRawPreviewData(false)  // preview raw image when opengl mode
            .create()
    }

    override fun onResume() {
        super.onResume()
        lgScreen(getCurrentCamera().toString(), getCameraIdList().toString())
    }

    private fun getCameraIdList(): List<String>? {
        val cameraIdList: MutableList<String> = ArrayList()
        val cameraManager = getSystemService(requireContext(), CameraManager::class.java) as CameraManager?
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
}