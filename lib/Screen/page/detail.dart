import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:makan_makan/Api/api_service.dart';
import 'package:makan_makan/Screen/page/review.dart';
import 'package:makan_makan/Screen/page/widget/menus.dart';
import 'package:makan_makan/provider/detail_restaurant.dart';
import 'package:provider/provider.dart';

class DetailPage extends StatefulWidget {
  final String id;
  static const routeName = '/detail_page';
  const DetailPage({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DetailProvider>(
      create: (_) => DetailProvider(apiService: ApiService(), id: widget.id),
      child: Scaffold(body: Consumer<DetailProvider>(
        builder: (context, value, _) {
          if (value.state == DetailResultState.Loading) {
            return Center(child: CircularProgressIndicator());
          } else if (value.state == DetailResultState.HasData) {
            final restaurant = value.result.restaurant;
            return CustomScrollView(
              slivers: [
                SliverAppBar(
                  pinned: true,
                  expandedHeight: 250,
                  backgroundColor: Colors.orange,
                  flexibleSpace: FlexibleSpaceBar(
                    titlePadding: EdgeInsets.only(left: 16, bottom: 16),
                    background: Image.network(
                      restaurant.getImage(),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Row(
                            children: [
                              Icon(
                                Icons.verified_user,
                                size: 25,
                                color: Colors.orange,
                              ),
                              SizedBox(width: 5),
                              Text(
                                restaurant.name,
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, ReviewPage.routeName,
                                arguments: widget.id);
                          },
                          child: Row(
                            children: [
                              Icon(
                                Icons.star,
                                size: 18,
                                color: Colors.yellow,
                              ),
                              Icon(
                                Icons.star,
                                size: 18,
                                color: Colors.yellow,
                              ),
                              Icon(
                                Icons.star,
                                size: 18,
                                color: Colors.yellow,
                              ),
                              Icon(
                                Icons.star,
                                size: 18,
                                color: Colors.yellow,
                              ),
                              Icon(
                                Icons.star,
                                size: 18,
                                color: Colors.yellow,
                              ),
                              SizedBox(width: 4),
                              Text(restaurant.rating.toString()),
                              SizedBox(width: 4),
                              Text("( Lihat Penilaian )"),
                              Icon(Icons.arrow_forward_ios, size: 15),
                            ],
                          ),
                        ),
                        SizedBox(height: 6),
                        Row(
                          children: [
                            Icon(
                              Icons.place_outlined,
                              size: 18,
                            ),
                            SizedBox(width: 3),
                            Text(
                              restaurant.city,
                            ),
                          ],
                        ),
                        SizedBox(height: 30),
                        Text(
                          restaurant.description,
                          textAlign: TextAlign.justify,
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
                SliverPadding(
                  padding: EdgeInsets.all(10),
                  sliver: SliverToBoxAdapter(
                    child: Container(
                      alignment: Alignment.center,
                      height: 30,
                      decoration:
                          BoxDecoration(color: Colors.orange, boxShadow: [
                        BoxShadow(
                            color: Colors.grey,
                            spreadRadius: 3,
                            blurRadius: 7,
                            offset: Offset(0, 5))
                      ]),
                      child: Text("Aneka Minuman"),
                    ),
                  ),
                ),
                menuList(restaurant.menus.drinks),
                SliverPadding(
                  padding: EdgeInsets.all(10),
                  sliver: SliverToBoxAdapter(
                    child: Container(
                      alignment: Alignment.center,
                      height: 30,
                      decoration:
                          BoxDecoration(color: Colors.orange, boxShadow: [
                        BoxShadow(
                            color: Colors.grey,
                            spreadRadius: 3,
                            blurRadius: 7,
                            offset: Offset(0, 5))
                      ]),
                      child: Text("Aneka Makanan"),
                    ),
                  ),
                ),
                menuList(restaurant.menus.foods)
              ],
            );
          } else if (value.state == DetailResultState.NoData) {
            return Center(child: Text("Maaf!! Sedang Terjadi Kesalahan"));
          } else if (value.state == DetailResultState.error) {
            return Center(child: Text("No Connection"));
          } else {
            return Text("");
          }
        },
      )),
    );
  }
}
