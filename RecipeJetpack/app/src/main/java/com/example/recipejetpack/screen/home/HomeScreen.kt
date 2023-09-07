package com.example.recipejetpack.screen.home

import androidx.annotation.DrawableRes
import androidx.annotation.StringRes
import androidx.compose.foundation.Image
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.material.BottomNavigation
import androidx.compose.material.BottomNavigationItem
import androidx.compose.material.Tab
import androidx.compose.material.TabRow
import androidx.compose.material.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.LaunchedEffect
import androidx.compose.runtime.SideEffect
import androidx.compose.runtime.getValue
import androidx.compose.runtime.remember
import androidx.compose.runtime.rememberCoroutineScope
import androidx.compose.runtime.rememberUpdatedState
import androidx.compose.runtime.snapshotFlow
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.graphics.painter.BitmapPainter
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.res.stringResource
import androidx.compose.ui.viewinterop.AndroidView
import androidx.fragment.app.Fragment
import androidx.viewpager2.adapter.FragmentStateAdapter
import androidx.viewpager2.widget.ViewPager2
import com.example.recipejetpack.R
import com.example.recipejetpack.screen.recipe.RecipeListScreen
import com.example.recipejetpack.screen.recipe.RecipeViewModel
import com.example.recipejetpack.screen.recipe.paging.model.Result
import com.google.accompanist.pager.ExperimentalPagerApi
import com.google.accompanist.pager.HorizontalPager
import com.google.accompanist.pager.PagerDefaults
import com.google.accompanist.pager.PagerState
import com.google.accompanist.pager.rememberPagerState
import kotlinx.coroutines.launch

@OptIn(ExperimentalPagerApi::class)
@Composable
fun HomeScreen(recipeViewModel: RecipeViewModel, onClickItem: (Result?) -> Unit) {

    val pagerState = rememberPagerState()
    val scope = rememberCoroutineScope()

    Column(modifier = Modifier.fillMaxSize()) {
        MyTabLayout(currentPage = { pagerState.currentPage },
            onClickTab = {
                scope.launch {
                    pagerState.animateScrollToPage(it)
                }
            })


        HorizontalPager(
            count = PagerUtils.values().size,
            state = pagerState,
            modifier = Modifier.fillMaxSize(),
            flingBehavior = PagerDefaults.flingBehavior(state = pagerState)
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
}

@Composable
private fun MyTabLayout(currentPage: () -> Int, onClickTab: (position: Int) -> Unit) {

    TabRow(selectedTabIndex = currentPage()) {
        PagerUtils.values().forEachIndexed { index, pagerUtils ->
            Tab(selected = currentPage() == index,
                onClick = {
                    onClickTab.invoke(index)
                },
                icon = {
                    Image(
                        painter = painterResource(id = pagerUtils.icon),
                        contentDescription = stringResource(id = pagerUtils.title)
                    )
                }, text = {
                    Text(
                        text = stringResource(id = pagerUtils.title),
                        color = if (currentPage() == index) Color.Red else Color.White
                    )
                })
        }
    }
}

enum class PagerUtils(
    @StringRes val title: Int,
    @DrawableRes val icon: Int,
) {
    PageRecipe(R.string.recipe, R.drawable.ic_baseline_fastfood_24),
    PageNone(R.string.app_name, R.drawable.ic_baseline_fastfood_24)
}
