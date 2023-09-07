package com.ducdv.testshoto.ext

import android.util.Log
import android.widget.Toast
import androidx.fragment.app.Fragment

fun Fragment.showToast(message: String?) {
    Toast.makeText(this.context, message, Toast.LENGTH_SHORT).show()
}

fun Fragment.lgScreen(vararg data: String) {
    Log.e("nameScreen", "${this::class.java.simpleName} - ${data.map { it }}")
}