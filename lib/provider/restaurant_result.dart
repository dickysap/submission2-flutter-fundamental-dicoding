import 'package:flutter/cupertino.dart';
import 'package:makan_makan/Api/models/restaurant_list.dart';
import '../Api/api_service.dart';

enum ResultState { NoData, Loading, HasData, Error }

class ResultProvider extends ChangeNotifier {
  ApiService apiService;
  ResultProvider({required this.apiService}) {
    _fetchRestaurant();
  }

  late RestaurantList _restaurantList;
  late ResultState _state;
  String _message = "";

  RestaurantList get result => _restaurantList;
  ResultState get state => _state;
  String get message => _message;

  Future<dynamic> _fetchRestaurant() async {
    try {
      _state = ResultState.Loading;
      final restaurant = await apiService.restaurantResult();
      if (restaurant.restaurants.isEmpty) {
        _state = ResultState.NoData;
        notifyListeners();
        return _message = "Data Kosong";
      } else {
        _state = ResultState.HasData;
        notifyListeners();
        return _restaurantList = restaurant;
      }
    } catch (e) {
      _state = ResultState.Error;
      notifyListeners();
      return _message = "Error ---- ${e}";
    }
  }
}
