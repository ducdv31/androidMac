package com.ducdv.testshoto

import android.content.Context
import android.content.pm.PackageManager
import android.hardware.camera2.CameraAccessException
import android.hardware.camera2.CameraDevice
import android.hardware.camera2.CameraManager
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.util.Log
import androidx.core.app.ActivityCompat
import androidx.core.content.ContextCompat
import android.Manifest
import android.hardware.Camera
import android.view.SurfaceHolder
import com.ducdv.testshoto.databinding.ActivityMainBinding
import com.ducdv.testshoto.ext.getCameraIdList
import com.ducdv.testshoto.ui.view.CameraPreview

class MainActivity : AppCompatActivity() {

    private lateinit var binding: ActivityMainBinding

    private var camera: Camera? = null

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityMainBinding.inflate(layoutInflater)
        setContentView(binding.root)
        // Kiểm tra quyền truy cập CAMERA
        if (ContextCompat.checkSelfPermission(
                this,
                Manifest.permission.CAMERA
            ) != PackageManager.PERMISSION_GRANTED
        ) {
            ActivityCompat.requestPermissions(
                this,
                arrayOf(Manifest.permission.CAMERA),
                CAMERA_PERMISSION_REQUEST_CODE
            )
        } else {
            // Quyền truy cập CAMERA đã được cấp
//            openCameraWithId(CAMERA_ID)
            // Khởi tạo Camera
            camera = getCameraInstance()

            // Tạo CameraPreview và đặt nó làm nội dung chính của layout
            val cameraPreview = CameraPreview(this, camera!!)
            setContentView(cameraPreview)
        }
    }


    override fun onRequestPermissionsResult(
        requestCode: Int,
        permissions: Array<String>,
        grantResults: IntArray
    ) {
        super.onRequestPermissionsResult(requestCode, permissions, grantResults)
        if (requestCode == CAMERA_PERMISSION_REQUEST_CODE) {
            if (grantResults.isNotEmpty() && grantResults[0] == PackageManager.PERMISSION_GRANTED) {
                // Quyền truy cập CAMERA đã được cấp
                openCameraWithId(CAMERA_ID)
            } else {
                // Quyền truy cập CAMERA bị từ chối
                Log.e("Camera Permission", "Camera permission denied")
            }
        }
    }

    private fun openCameraWithId(cameraId: String) {
        val cameraManager = getSystemService(Context.CAMERA_SERVICE) as CameraManager
        try {
            if (ActivityCompat.checkSelfPermission(
                    this,
                    android.Manifest.permission.CAMERA
                ) != PackageManager.PERMISSION_GRANTED
            ) {
                return
            }
            cameraManager.openCamera(cameraId, object : CameraDevice.StateCallback() {
                override fun onOpened(camera: CameraDevice) {
                    // Camera đã được mở thành công
                    Log.d("Camera", "Camera opened")
                    // TODO: Thực hiện các thao tác với camera
                }

                override fun onDisconnected(camera: CameraDevice) {
                    // Camera bị mất kết nối
                    Log.d("Camera", "Camera disconnected")
                    // TODO: Xử lý khi mất kết nối camera
                }

                override fun onError(camera: CameraDevice, error: Int) {
                    // Lỗi khi mở camera
                    Log.e("Camera", "Camera error: $error")
                    // TODO: Xử lý lỗi mở camera
                }
            }, null)
        } catch (e: CameraAccessException) {
            e.printStackTrace()
        }
        binding.apply {
            val surfaceHolder = sfView.holder
            surfaceHolder.addCallback(object : SurfaceHolder.Callback {
                override fun surfaceCreated(holder: SurfaceHolder) {
                    // Được gọi khi SurfaceView được tạo
                    val canvas = holder.lockCanvas()
                    // Vẽ hình ảnh, video, đồ họa lên canvas
                    holder.unlockCanvasAndPost(canvas)
                }

                override fun surfaceChanged(holder: SurfaceHolder, format: Int, width: Int, height: Int) {
                    // Được gọi khi kích thước hoặc định dạng của SurfaceView thay đổi
                }

                override fun surfaceDestroyed(holder: SurfaceHolder) {
                    // Được gọi khi SurfaceView bị hủy
                }
            })
        }
    }

    private fun getCameraInstance(): Camera? {
        Log.e("TAG", "getCameraInstance: ${baseContext.getCameraIdList()}")
        return try {
            Camera.open(2) // Mở camera mặc định
        } catch (e: Exception) {
            // Xử lý lỗi
            null
        }
    }

    companion object {
        private const val CAMERA_ID = "0"
        private const val CAMERA_PERMISSION_REQUEST_CODE = 100
    }
}