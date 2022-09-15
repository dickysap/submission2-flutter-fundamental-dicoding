import 'package:flutter/material.dart';
import 'package:makan_makan/Screen/page/search.dart';
import 'package:makan_makan/Screen/page/widget/product_list.dart';
import 'package:provider/provider.dart';
import 'package:makan_makan/provider/restaurant_result.dart';

class ListPage extends StatelessWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<ResultProvider>(builder: (context, state, _) {
        if (state.state == ResultState.Loading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state.state == ResultState.HasData) {
          return SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.all(20),
              child: Column(
                children: [
                  SafeArea(
                    child: Container(
                      height: 100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Warung Tiwi",
                            style: TextStyle(fontSize: 25),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, SearchPage.routeName);
                            },
                            child: Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                    color: Colors.orange,
                                    borderRadius: BorderRadius.circular(20)),
                                child: Icon(
                                  Icons.search,
                                  color: Colors.white,
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Promo For You",
                        textAlign: TextAlign.left,
                      ),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            "See All",
                            style: TextStyle(
                                color: Color.fromARGB(190, 251, 152, 4)),
                          ))
                    ],
                  ),
                  Container(
                    height: 100,
                    child: PageView.builder(
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return Container(
                          height: 100,
                          margin: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/img/slide-1.png'),
                                  fit: BoxFit.cover)),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 10),
                  ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: state.result.restaurants.length,
                      itemBuilder: (context, index) {
                        var restaurant = state.result.restaurants[index];
                        return ProductList(
                          restaurant: restaurant,
                        );
                      })
                ],
              ),
            ),
          );
        } else if (state.state == ResultState.NoData) {
          return Center(
              child: Text("Mohon Maaf Sedang Ada Gangguan Dari Server"));
        } else if (state.state == ResultState.Error) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("No Connection",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                SizedBox(height: 20),
                Icon(
                  Icons.signal_wifi_off,
                  size: 100,
                  color: Colors.blue,
                )
              ],
            ),
          );
        } else {
          return Center(child: Text(''));
        }
      }),
    );
  }
}
