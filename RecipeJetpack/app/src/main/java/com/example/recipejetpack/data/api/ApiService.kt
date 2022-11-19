package com.example.recipejetpack.data.api

import com.example.recipejetpack.screen.recipe.paging.model.ResponseRecipe
import retrofit2.http.GET
import retrofit2.http.Header
import retrofit2.http.Query

const val BASE_URL = "https://food2fork.ca/api/recipe/"
const val Authorization = "Authorization"
const val TOKEN = "Token 9c8b06d329136da358c2d00e76946b0111ce2c48"

interface ApiService {

    @GET("search")
    suspend fun searchRecipe(
        @Header(Authorization) authorization: String = TOKEN,
        @Query("page") page: Int,
        @Query("query") query: String
    ): ResponseRecipe

}