import 'package:flutter/cupertino.dart';
import '../Api/api_service.dart';
import '../Api/models/search.dart';

enum SearchState { HasData, Loading, Error, NoData }

class SearchProvider extends ChangeNotifier {
  ApiService apiService;

  SearchProvider({required this.apiService}) {
    searchData(query);
  }

  late SearchRestaurant _searchRestaurant;
  late SearchState _state;
  String _message = '';
  String _query = '';

  SearchRestaurant get result => _searchRestaurant;
  SearchState get state => _state;
  String get message => message;
  String get query => _query;

  Future<dynamic> searchData(String query) async {
    try {
      _state = SearchState.Loading;
      _query = query;
      final searchrestaurant = await apiService.searchRestaurant(query);
      if (searchrestaurant.restaurants.isEmpty) {
        _state = SearchState.NoData;
        notifyListeners();
        _message = "Faied Search Restaurant";
      } else {
        _state = SearchState.HasData;
        notifyListeners();
        return _searchRestaurant = searchrestaurant;
      }
    } catch (e) {
      _state = SearchState.Error;
      return _message = "Error ---> ${e}";
    }
  }
}
