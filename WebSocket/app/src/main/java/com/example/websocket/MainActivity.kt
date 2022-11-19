package com.example.websocket

import android.os.Bundle
import android.util.Log
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.LazyListState
import androidx.compose.foundation.lazy.rememberLazyListState
import androidx.compose.material.MaterialTheme
import androidx.compose.material.Surface
import androidx.compose.material.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.LaunchedEffect
import androidx.compose.runtime.mutableStateListOf
import androidx.compose.runtime.produceState
import androidx.compose.runtime.remember
import androidx.compose.runtime.rememberCoroutineScope
import androidx.compose.runtime.snapshotFlow
import androidx.compose.runtime.snapshots.SnapshotStateList
import androidx.compose.ui.Modifier
import com.example.websocket.data.websocket.MyWebSocket
import com.example.websocket.ui.theme.WebSocketTheme
import com.example.websocket.util.URI_WEB_SOCKET
import kotlinx.coroutines.async
import kotlinx.coroutines.channels.Channel
import kotlinx.coroutines.channels.consume
import kotlinx.coroutines.channels.consumeEach
import kotlinx.coroutines.delay
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.launch
import kotlinx.coroutines.runBlocking
import org.java_websocket.drafts.Draft_6455
import org.java_websocket.handshake.ServerHandshake
import java.net.URI
import kotlin.random.Random

class MainActivity : ComponentActivity() {

    private val myWebSocket = MyWebSocket(serverUri = URI(URI_WEB_SOCKET), protocolDraft = Draft_6455())
    private val channelReceived = Channel<String?> { }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContent {
            val scope = rememberCoroutineScope()
            val lazyListState = rememberLazyListState()
            val listData = remember { mutableStateListOf<String?>() }
            LaunchedEffect(key1 = channelReceived, block = {
                channelReceived.consumeEach {
                    Log.e("TAG", "onCreate: $it")
                }
            })

            myWebSocket.addOnSocketListener(object : MyWebSocket.IOnSocketListener {
                override fun onOpen(handshakedata: ServerHandshake?) {
                }

                override fun onMessage(message: String?) {
                    runBlocking {
                        channelReceived.send(message)
                    }
                    listData.add(message)
                }

                override fun onClose(code: Int, reason: String?, remote: Boolean) {
                }

                override fun onError(ex: Exception?) {
                }
            })


            WebSocketTheme {
                Surface(modifier = Modifier.fillMaxSize(), color = MaterialTheme.colors.background) {
                    myWebSocket.connect()
                    ListDataScreen(lazyListState = lazyListState, listData)
                }
            }
        }
    }
}

@Composable
fun ListDataScreen(lazyListState: LazyListState, listData: SnapshotStateList<String?>) {
    LazyColumn(state = lazyListState) {
        item {
            listData.forEachIndexed { index, message ->
                Text(text = "$index: $message")
            }
        }
    }
}

@Composable
fun PutDataReceived(lazyListState: LazyListState, message: String?) {
    LaunchedEffect(key1 = lazyListState, block = {
        snapshotFlow {
            lazyListState
        }
    })
}