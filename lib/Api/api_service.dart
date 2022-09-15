import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:makan_makan/Api/models/restaurant_detail.dart';
import 'package:makan_makan/Api/models/restaurant_list.dart';
import 'package:makan_makan/Api/models/search.dart';

class ApiService {
  static const String _baseURL = 'https://restaurant-api.dicoding.dev/';
  static const String iMGURL =
      'https://restaurant-api.dicoding.dev/images/medium/';

  Future<RestaurantList> restaurantResult() async {
    final response = await http.get(Uri.parse(_baseURL + 'list'));
    if (response.statusCode == 200) {
      return RestaurantList.fromJson(json.decode(response.body));
    } else {
      throw Exception("Error to Load Restaurant Result");
    }
  }

  Future<DetailRestaurant> detailRestaurant(String id) async {
    final response = await http.get(Uri.parse(_baseURL + 'detail/$id'));

    if (response.statusCode == 200) {
      return DetailRestaurant.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failde to Load Restaurant Detail");
    }
  }

  Future<SearchRestaurant> searchRestaurant(String query) async {
    final response = await http.get(Uri.parse(_baseURL + 'search?q=$query'));
    if (response.statusCode == 200) {
      return SearchRestaurant.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to Load Data");
    }
  }
}
