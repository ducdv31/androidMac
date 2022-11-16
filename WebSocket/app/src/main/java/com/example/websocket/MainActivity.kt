package com.example.websocket

import android.os.Bundle
import android.provider.Telephony
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.material.MaterialTheme
import androidx.compose.material.Surface
import androidx.compose.material.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.tooling.preview.Preview
import com.example.websocket.data.websocket.MyWebSocket
import com.example.websocket.ui.theme.WebSocketTheme
import com.example.websocket.util.URI_WEB_SOCKET
import org.java_websocket.drafts.Draft_6455
import java.net.URI

class MainActivity : ComponentActivity() {

    private val myWebSocket = MyWebSocket(serverUri = URI(URI_WEB_SOCKET), protocolDraft = Draft_6455())

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContent {
            WebSocketTheme {
                // A surface container using the 'background' color from the theme
                Surface(modifier = Modifier.fillMaxSize(), color = MaterialTheme.colors.background) {
                    Greeting("Android") {
                        myWebSocket.connect()
                    }
                }
            }
        }
    }
}

@Composable
fun Greeting(name: String, onClick: () -> Unit) {
    Text(text = "Hello $name!", modifier = Modifier.clickable {
        onClick.invoke()
    })
}