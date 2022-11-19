package com.example.websocket.data.websocket

import com.example.websocket.util.CONNECTION_TIMEOUT
import org.java_websocket.client.WebSocketClient
import org.java_websocket.drafts.Draft
import org.java_websocket.drafts.Draft_6455
import org.java_websocket.handshake.ServerHandshake
import java.net.URI

class MyWebSocket @JvmOverloads constructor(
    serverUri: URI?,
    protocolDraft: Draft = Draft_6455(),
    httpHeaders: MutableMap<String, String>? = null,
    connectTimeout: Int = CONNECTION_TIMEOUT
) : WebSocketClient(serverUri, protocolDraft, httpHeaders, connectTimeout) {

    private var iOnSocketListener: IOnSocketListener? = null

    override fun onOpen(handshakedata: ServerHandshake?) {
        iOnSocketListener?.onOpen(handshakedata)
        println("Open")
    }

    override fun onMessage(message: String?) {
        println(message)
        iOnSocketListener?.onMessage(message)
    }

    override fun onClose(code: Int, reason: String?, remote: Boolean) {
        println(reason)
        iOnSocketListener?.onClose(code, reason, remote)
    }

    override fun onError(ex: Exception?) {
        println(ex?.message)
        iOnSocketListener?.onError(ex)
    }

    fun addOnSocketListener(iOnSocketListener: IOnSocketListener) {
        this.iOnSocketListener = iOnSocketListener
    }

    interface IOnSocketListener {
        fun onOpen(handshakedata: ServerHandshake?)
        fun onMessage(message: String?)
        fun onClose(code: Int, reason: String?, remote: Boolean)
        fun onError(ex: Exception?)
    }
}