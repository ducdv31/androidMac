import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:recipe/list_recipe/model/ResponseRecipes.dart';

part 'apiclient.g.dart';

class Apis {
  static const BASE_URL = "https://food2fork.ca/api/recipe/";
  static const TOKEN = "Token 9c8b06d329136da358c2d00e76946b0111ce2c48";
}

@RestApi(baseUrl: Apis.BASE_URL)
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET("search/?page={page}&query={query}")
  Future<ResponseRecipe> getListRecipes(
      @Path("page") int page, @Path("query") String? query);
}
