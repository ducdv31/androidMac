package com.example.recipejetpack.screen.recipe

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import androidx.paging.Pager
import androidx.paging.PagingConfig
import androidx.paging.cachedIn
import com.example.recipejetpack.screen.recipe.paging.pagingsoruce.RecipePagingSource
import com.example.recipejetpack.screen.recipe.repository.RecipeRepositoryImpl
import dagger.hilt.android.lifecycle.HiltViewModel
import javax.inject.Inject

@HiltViewModel
class RecipeViewModel @Inject constructor(
    private val recipeRepositoryImpl: RecipeRepositoryImpl
) : ViewModel() {

    fun getListRecipeFlow(name: String) = Pager(
        config = PagingConfig(pageSize = 30)
    ) {
        RecipePagingSource(recipeRepositoryImpl, name)
    }.flow.cachedIn(viewModelScope)
}