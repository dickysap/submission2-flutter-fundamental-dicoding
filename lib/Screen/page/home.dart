import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:makan_makan/Api/api_service.dart';
import 'package:makan_makan/Screen/page/list.dart';
import 'package:makan_makan/provider/restaurant_result.dart';


class HomePage extends StatelessWidget {
  static final routeName = '/home_page';
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ResultProvider>(
      create: (_) => ResultProvider(apiService: ApiService()),
      child: ListPage(),
    );
  }
}
