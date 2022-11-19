package com.example.recipejetpack.screen.recipe

import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.wrapContentHeight
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.rememberLazyListState
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.CircularProgressIndicator
import androidx.compose.material.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Alignment.Companion.CenterHorizontally
import androidx.compose.ui.ExperimentalComposeUiApi
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.platform.LocalSoftwareKeyboardController
import androidx.compose.ui.text.TextStyle
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.text.style.TextDecoration
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import androidx.paging.LoadState
import androidx.paging.compose.collectAsLazyPagingItems
import androidx.paging.compose.itemsIndexed
import coil.compose.AsyncImagePainter
import coil.compose.SubcomposeAsyncImage
import coil.compose.SubcomposeAsyncImageContent
import com.example.recipejetpack.common.base.MySearchView
import com.example.recipejetpack.screen.recipe.paging.model.Result
import com.example.recipejetpack.utils.Constant

@OptIn(ExperimentalComposeUiApi::class)
@Composable
fun RecipeListScreen(
    recipeViewModel: RecipeViewModel,
    onClickItem: (Result?) -> Unit
) {

    var name by remember {
        mutableStateOf(Constant.EMPTY)
    }
    val listState = rememberLazyListState()
    val listResultFlow = recipeViewModel.getListRecipeFlow(name).collectAsLazyPagingItems()
    val keyboard = LocalSoftwareKeyboardController.current

    Column(
        modifier = Modifier
            .fillMaxSize()
    ) {
        Spacer(modifier = Modifier.height(8.dp))

        MySearchView(onValueChange = {
            name = it
        }, keyboard)

        Spacer(modifier = Modifier.height(8.dp))

        LazyColumn(
            modifier = Modifier
                .fillMaxWidth(), state = listState
        ) {
            itemsIndexed(items = listResultFlow,
                key = { _, item ->
                    item.pk ?: 0
                }
            ) { _, value ->
                ItemRecipe(result = value, onClickItem = onClickItem)
            }
        }
    }
}

@Composable
fun ItemRecipe(result: Result?, onClickItem: (Result?) -> Unit) {
    Column(
        modifier = Modifier
            .fillMaxWidth()
            .padding(8.dp)
            .clip(shape = RoundedCornerShape(16.dp))
            .background(color = Color.LightGray)
            .padding(8.dp)
            .clickable {
                onClickItem.invoke(result)
            },
        horizontalAlignment = Alignment.CenterHorizontally
    ) {
        SubcomposeAsyncImage(
            model = result?.featuredImage,
            contentDescription = "Image",
            modifier = Modifier
                .clip(shape = RoundedCornerShape(16.dp)),
            contentScale = ContentScale.Fit,
        ) {
            when (painter.state) {
                is AsyncImagePainter.State.Loading -> {
                    CircularProgressIndicator(color = Color.Red)
                }
                is AsyncImagePainter.State.Success -> {
                    SubcomposeAsyncImageContent(
                        modifier = Modifier.fillMaxWidth(),
                        contentScale = ContentScale.Crop
                    )
                }
                else -> {}
            }
        }

        Text(
            text = "${result?.title}", style = TextStyle(
                color = Color.Black,
                fontSize = 24.sp,
                textAlign = TextAlign.Center
            )
        )
    }
}