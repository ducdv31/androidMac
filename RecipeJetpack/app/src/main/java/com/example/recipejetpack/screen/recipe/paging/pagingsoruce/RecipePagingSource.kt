package com.example.recipejetpack.screen.recipe.paging.pagingsoruce

import androidx.paging.PagingSource
import androidx.paging.PagingState
import com.example.recipejetpack.screen.recipe.paging.model.Result
import com.example.recipejetpack.screen.recipe.repository.RecipeRepositoryImpl

class RecipePagingSource(
    private val recipeRepository: RecipeRepositoryImpl,
    private val query: String
) : PagingSource<Int, Result>() {
    override fun getRefreshKey(state: PagingState<Int, Result>): Int? {
        return state.anchorPosition?.let { anchorPage ->
            val lastPage = state.closestPageToPosition(anchorPage)
            lastPage?.prevKey?.plus(1) ?: lastPage?.nextKey?.minus(1)
        }
    }

    override suspend fun load(params: LoadParams<Int>): LoadResult<Int, Result> {
        return try {
            val paramKey = params.key ?: 1

            val response = recipeRepository.getListRecipeWithName(paramKey, query)
            LoadResult.Page(
                data = response,
                prevKey = null,
                nextKey = paramKey + 1
            )
        } catch (e: Exception) {
            LoadResult.Error(e)
        }
    }
}