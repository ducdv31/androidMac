package com.example.recipejetpack.screen.recipe.paging.model

data class ResponseRecipe(
    var count: Long?,
    var next: String?,
    var previous: String?,
    var results: List<Result>
)
