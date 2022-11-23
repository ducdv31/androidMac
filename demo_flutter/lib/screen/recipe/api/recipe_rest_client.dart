import 'package:demo_flutter/screen/recipe/model/recipe_response.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'recipe_rest_client.g.dart';

const BASE_URL_RECIPE = "https://food2fork.ca/api/recipe/";

@RestApi(baseUrl: BASE_URL_RECIPE)
abstract class RecipeRestClient {
  factory RecipeRestClient(Dio dio, {String? baseUrl}) = _RecipeRestClient;

  @GET("search/")
  Future<RecipeResponse> searchRecipe(
      @Query("page") int page, @Query("query") String query);
}
