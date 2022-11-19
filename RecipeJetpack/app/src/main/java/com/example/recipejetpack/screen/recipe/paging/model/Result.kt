package com.example.recipejetpack.screen.recipe.paging.model

import com.google.gson.annotations.SerializedName

data class Result(
    var pk: Long?,
    var title: String?,
    var publisher: String?,
    @SerializedName("featured_image")
    var featuredImage: String?,
    var rating: Int?,
    @SerializedName("source_url")
    var sourceUrl: String?,
    var description: String?,
    @SerializedName("cooking_instructions")
    var cookingInstructions: Any?,
    var ingredients: List<String>?,
    @SerializedName("date_added")
    var dateAdded: String,
    @SerializedName("date_updated")
    var dateUpdated: String,
    @SerializedName("long_date_added")
    var longDateAdded: Long,
    @SerializedName("long_date_updated")
    var longDateUpdated: Long
)
