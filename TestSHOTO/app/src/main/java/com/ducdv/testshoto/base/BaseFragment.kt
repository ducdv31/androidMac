package com.ducdv.testshoto.base

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.fragment.app.Fragment
import androidx.viewbinding.ViewBinding

abstract class BaseFragment<T : ViewBinding> : Fragment() {
    private lateinit var binding: T

    abstract val getInflater: (LayoutInflater, ViewGroup?, Boolean) -> T

    override fun onCreateView(inflater: LayoutInflater, container: ViewGroup?, savedInstanceState: Bundle?): View? {
        binding = getInflater.invoke(inflater, container, true)
        return binding.root
    }
}