package com.example.recipejetpack.screen.recipe.repository

import com.example.recipejetpack.data.api.ApiService
import javax.inject.Inject

interface RecipeRepository {
    suspend fun getListRecipeWithName(page: Int, name: String): List<com.example.recipejetpack.screen.recipe.paging.model.Result>
}

class RecipeRepositoryImpl @Inject constructor(
    private val apiService: ApiService
) : RecipeRepository {
    override suspend fun getListRecipeWithName(page: Int, name: String): List<com.example.recipejetpack.screen.recipe.paging.model.Result> {
        return apiService.searchRecipe(page = page, query = name).results
    }
}