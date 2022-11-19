package com.example.recipejetpack.screen.home

import androidx.annotation.DrawableRes
import androidx.annotation.StringRes
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.material.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import com.example.recipejetpack.R
import com.example.recipejetpack.screen.recipe.RecipeListScreen
import com.example.recipejetpack.screen.recipe.RecipeViewModel
import com.example.recipejetpack.screen.recipe.paging.model.Result
import com.google.accompanist.pager.ExperimentalPagerApi
import com.google.accompanist.pager.HorizontalPager
import com.google.accompanist.pager.rememberPagerState

@OptIn(ExperimentalPagerApi::class)
@Composable
fun HomeScreen(recipeViewModel: RecipeViewModel, onClickItem: (Result?) -> Unit) {

    val pagerState = rememberPagerState()

    HorizontalPager(
        count = PagerUtils.values().size,
        state = pagerState,
        modifier = Modifier.fillMaxSize()
    ) { page: Int ->
        when (page) {
            PagerUtils.PageRecipe.ordinal -> {
                RecipeListScreen(
                    recipeViewModel = recipeViewModel,
                    onClickItem = onClickItem
                )
            }
            PagerUtils.PageNone.ordinal -> {
                Text(
                    text = "Hi"
                )
            }
            else -> {
                RecipeListScreen(
                    recipeViewModel = recipeViewModel,
                    onClickItem = onClickItem
                )
            }
        }

    }
}

enum class PagerUtils(
    @StringRes val title: Int,
    @DrawableRes val icon: Int,
) {
    PageRecipe(R.string.recipe, R.drawable.ic_baseline_fastfood_24),
    PageNone(R.string.app_name, R.drawable.ic_launcher_foreground)
}
