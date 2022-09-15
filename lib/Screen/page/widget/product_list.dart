import 'package:flutter/material.dart';
import 'package:makan_makan/Api/models/element.dart';
import 'package:makan_makan/Screen/page/detail.dart';

class ProductList extends StatelessWidget {
  final Restaurant restaurant;
  const ProductList({Key? key, required this.restaurant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, DetailPage.routeName,
            arguments: restaurant.id);
      },
      child: Card(
        child: Container(
            margin: EdgeInsets.only(top: 20),
            height: 100,
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.all(5),
                  height: 90,
                  width: 100,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(restaurant.getImage()),
                          fit: BoxFit.cover)),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(5, 15, 10, 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.verified_user,
                            size: 15,
                            color: Colors.yellow,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 6),
                            child: Text(
                              restaurant.name,
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Text(
                          'Foods & Drinks',
                          style: TextStyle(fontSize: 12, color: Colors.black45),
                        ),
                      ),
                      SizedBox(height: 6),
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            size: 15,
                            color: Colors.orange,
                          ),
                          SizedBox(width: 3),
                          Text(
                            restaurant.rating.toString(),
                            style:
                                TextStyle(fontSize: 12, color: Colors.black45),
                          ),
                          SizedBox(width: 10),
                          Icon(
                            Icons.place_outlined,
                            size: 15,
                          ),
                          SizedBox(width: 3),
                          Text(
                            restaurant.city,
                            style:
                                TextStyle(fontSize: 12, color: Colors.black45),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }
}
