import 'package:flutter/cupertino.dart';
import '../Api/api_service.dart';
import '../Api/models/restaurant_detail.dart';

enum DetailResultState { NoData, HasData, Loading, error }

class DetailProvider extends ChangeNotifier {
  final ApiService apiService;
  final String id;
  DetailProvider({required this.apiService, required this.id}) {
    _getDetail(id);
  }

  late DetailRestaurant _detailRestaurant;
  late DetailResultState _state;
  String _message = "";

  String get message => _message;
  DetailRestaurant get result => _detailRestaurant;
  DetailResultState get state => _state;

  Future<dynamic> _getDetail(String id) async {
    try {
      _state = DetailResultState.Loading;
      notifyListeners();
      final detail = await apiService.detailRestaurant(id);
      if (detail.error) {
        _state = DetailResultState.NoData;
        notifyListeners();
      } else {
        _state = DetailResultState.HasData;
        notifyListeners();
        return _detailRestaurant = detail;
      }
    } catch (e) {
      _state = DetailResultState.error;
      notifyListeners();
      return _message = "Error ---> ${e}";
    }
  }
}
