package com.example.websocket.data.websocket

import com.example.websocket.util.CONNECTION_TIMEOUT
import org.java_websocket.client.WebSocketClient
import org.java_websocket.drafts.Draft
import org.java_websocket.handshake.ServerHandshake
import java.lang.Exception
import java.net.URI

class MyWebSocket @JvmOverloads constructor(
    serverUri: URI?,
    protocolDraft: Draft? = null,
    httpHeaders: MutableMap<String, String>? = null,
    connectTimeout: Int = CONNECTION_TIMEOUT
) : WebSocketClient(serverUri, protocolDraft, httpHeaders, connectTimeout) {

    override fun onOpen(handshakedata: ServerHandshake?) {
        println("Open")
    }

    override fun onMessage(message: String?) {
        println(message)
    }

    override fun onClose(code: Int, reason: String?, remote: Boolean) {
        println(reason)
    }

    override fun onError(ex: Exception?) {
        println(ex?.message)
    }
}