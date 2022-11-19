package com.example.recipejetpack.screen.detailrecipe

import androidx.compose.foundation.layout.Column
import androidx.compose.material.Text
import androidx.compose.runtime.Composable

@Composable
fun DetailRecipeScreen(pk: () -> Long?) {
    Column {
        Text(text = "${pk()}")
    }
}