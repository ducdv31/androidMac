package com.example.recipejetpack

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.activity.viewModels
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.material.MaterialTheme
import androidx.compose.material.Surface
import androidx.compose.runtime.internal.composableLambda
import androidx.compose.ui.Modifier
import androidx.navigation.NavType
import androidx.navigation.compose.NavHost
import androidx.navigation.compose.composable
import androidx.navigation.compose.rememberNavController
import androidx.navigation.navArgument
import com.example.recipejetpack.screen.detailrecipe.DetailRecipeScreen
import com.example.recipejetpack.screen.home.HomeScreen
import com.example.recipejetpack.screen.recipe.RecipeViewModel
import com.example.recipejetpack.ui.theme.RecipeJetpackTheme
import dagger.hilt.android.AndroidEntryPoint

@AndroidEntryPoint
class MainActivity : ComponentActivity() {

    private val recipeViewModel by viewModels<RecipeViewModel>()

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContent {
            RecipeJetpackTheme {

                val navController = rememberNavController()

                Surface(
                    modifier = Modifier.fillMaxSize(),
                    color = MaterialTheme.colors.background
                ) {
                    NavHost(navController = navController, startDestination = ListRecipeScreen) {
                        composable(ListRecipeScreen) {
                            HomeScreen(recipeViewModel = recipeViewModel, onClickItem = {
                                navController.navigate("$DetailRecipe/${it?.pk}") {
                                    popUpTo(navController.graph.startDestinationId) {
                                        saveState = true
                                    }
                                    launchSingleTop = true
                                    restoreState = true
                                }
                            })
                        }
                        composable("$DetailRecipe/{pk}", arguments = listOf(
                            navArgument("pk") { type = NavType.LongType }
                        )) { entry ->
                            val pk = entry.arguments?.getLong("pk")
                            DetailRecipeScreen(pk = { pk })
                        }
                    }
                }
            }
        }
    }
}

const val ListRecipeScreen = "ListRecipeScreen"
const val DetailRecipe = "DetailRecipe"
