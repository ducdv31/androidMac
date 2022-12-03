import 'package:dio/dio.dart';
import 'package:rxdart/rxdart.dart';

import '../../../utils/constant.dart';
import '../api/recipe_rest_client.dart';
import '../model/result.dart';

class RecipeViewModel {
  final _searchSbj = BehaviorSubject<String>();
  final _listResultObj = BehaviorSubject<List<Result>>();

  Sink<String> get searchSink => _searchSbj.sink;

  Sink<List<Result>?> get listRecipeSink => _listResultObj.sink;

  Stream<List<Result>?> get listRecipeStream => _listResultObj.stream;

  RecipeViewModel() {
    _searchSbj
        .debounceTime(const Duration(milliseconds: 500))
        .listen((searchKey) {
      searchRecipe(1, searchKey).then((listData) {
        listRecipeSink.add(listData);
      });
    });
  }

  Future<List<Result>?> searchRecipe(int page, String? query) async {
    final dio = Dio();
    dio.options.headers[authorization] = token;
    final client = RecipeRestClient(dio);
    var response = await client.searchRecipe(page, query ?? "");
    return response.results;
  }

  dispose() {
    _searchSbj.close();
  }
}
