import 'package:flutter/material.dart';

import '../../../Api/models/element.dart';
import '../detail.dart';

class SearchResult extends StatelessWidget {
  final Restaurant restaurants;
  const SearchResult({Key? key, required this.restaurants}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, DetailPage.routeName,
            arguments: restaurants.id);
      },
      child: ListTile(
        leading: Container(
          height: 48,
          width: 48,
          decoration: BoxDecoration(
              image:
                  DecorationImage(image: NetworkImage(restaurants.getImage()))),
        ),
        title: Text(restaurants.name),
        subtitle: Text(restaurants.city),
      ),
    );
  }
}
