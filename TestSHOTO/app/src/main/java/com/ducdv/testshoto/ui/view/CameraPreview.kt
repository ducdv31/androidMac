import android.Manifest
import android.content.Context
import android.content.pm.PackageManager
import android.graphics.ImageFormat
import android.hardware.camera2.*
import android.media.ImageReader
import android.util.Size
import android.view.Surface
import android.view.SurfaceHolder
import android.view.SurfaceView
import androidx.core.app.ActivityCompat
import java.util.*

class CameraPreview(context: Context) : SurfaceView(context), SurfaceHolder.Callback {

    private val surfaceHolder: SurfaceHolder = holder.apply {
        addCallback(this@CameraPreview)
    }

    private var cameraDevice: CameraDevice? = null
    private var captureSession: CameraCaptureSession? = null
    private var imageReader: ImageReader? = null

    private val stateCallback = object : CameraDevice.StateCallback() {
        override fun onOpened(camera: CameraDevice) {
            cameraDevice = camera
            createCaptureSession()
        }

        override fun onDisconnected(camera: CameraDevice) {
            cameraDevice?.close()
            cameraDevice = null
        }

        override fun onError(camera: CameraDevice, error: Int) {
            cameraDevice?.close()
            cameraDevice = null
        }
    }

    private val captureSessionCallback = object : CameraCaptureSession.StateCallback() {
        override fun onConfigured(session: CameraCaptureSession) {
            captureSession = session
            createCaptureRequest()
        }

        override fun onConfigureFailed(session: CameraCaptureSession) {
            // Xử lý lỗi
        }
    }

    private val imageReaderCallback = ImageReader.OnImageAvailableListener { reader ->
        val image = reader.acquireLatestImage()
        // Xử lý ảnh thu được từ camera
        image?.close()
    }

    private fun createCaptureRequest() {
        val captureRequestBuilder = cameraDevice?.createCaptureRequest(CameraDevice.TEMPLATE_PREVIEW)
        captureRequestBuilder?.addTarget(surfaceHolder.surface)

        // Thực hiện việc cấu hình và bắt đầu xem trước
        captureSession?.setRepeatingRequest(
            captureRequestBuilder!!.build(),
            null,
            null
        )
    }

    private fun createCaptureSession() {
        val surfaces = listOf(surfaceHolder.surface, imageReader?.surface).filterNotNull()

        cameraDevice?.createCaptureSession(surfaces, captureSessionCallback, null)
    }

    override fun surfaceCreated(holder: SurfaceHolder) {
        // Khởi tạo CameraManager
        val cameraManager = context.getSystemService(Context.CAMERA_SERVICE) as CameraManager

        // Lấy danh sách camera
        val cameraId = cameraManager.cameraIdList.firstOrNull() ?: return

        // Tạo ImageReader để nhận dữ liệu hình ảnh từ camera
        val imageReaderSize = chooseImageReaderSize(cameraId)
        imageReader = ImageReader.newInstance(
            imageReaderSize.width,
            imageReaderSize.height,
            ImageFormat.JPEG,
            1
        )
        imageReader?.setOnImageAvailableListener(imageReaderCallback, null)

        // Mở camera
        if (ActivityCompat.checkSelfPermission(
                context,
                Manifest.permission.CAMERA
            ) != PackageManager.PERMISSION_GRANTED
        ) {
            return
        }
        cameraManager.openCamera(cameraId, stateCallback, null)
    }

    override fun surfaceChanged(holder: SurfaceHolder, format: Int, width: Int, height: Int) {
        // Không làm gì trong trường hợp này
    }

    override fun surfaceDestroyed(holder: SurfaceHolder) {
        captureSession?.close()
        cameraDevice?.close()
        imageReader?.close()
    }

    private fun chooseImageReaderSize(cameraId: String): Size {
        val cameraManager = context.getSystemService(Context.CAMERA_SERVICE) as CameraManager
        val characteristics = cameraManager.getCameraCharacteristics(cameraId)
        val map = characteristics.get(CameraCharacteristics.SCALER_STREAM_CONFIGURATION_MAP)
        val outputSizes = map?.getOutputSizes(SurfaceHolder::class.java)

        // Chọn kích thước ảnh phù hợp từ danh sách kích thước camera hỗ trợ
        val largestSize = outputSizes
        return largestSize!!.first()
    }
}