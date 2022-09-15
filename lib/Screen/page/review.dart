import 'package:flutter/material.dart';
import 'package:makan_makan/Api/api_service.dart';
import 'package:makan_makan/provider/detail_restaurant.dart';
import 'package:provider/provider.dart';

class ReviewPage extends StatefulWidget {
  final String id;
  static const routeName = '/review_page';

  const ReviewPage({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  State<ReviewPage> createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DetailProvider>(
      create: (context) =>
          DetailProvider(apiService: ApiService(), id: widget.id),
      child: Scaffold(
        body: Consumer<DetailProvider>(
          builder: (context, review, _) {
            if (review.state == DetailResultState.Loading) {
              return Center(child: CircularProgressIndicator());
            } else if (review.state == DetailResultState.HasData) {
              final cusReview = review.result.restaurant.customerReviews;
              return Column(
                children: [
                  Container(
                    height: 100,
                    width: MediaQuery.of(context).size.width,
                    child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            "Penilaian",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        )),
                    decoration: BoxDecoration(color: Colors.orange),
                  ),
                  SizedBox(height: 30),
                  AlertDialog(
                    title: Text("Comming Soon"),
                  )
                ],
              );
            }
            return Text("");
          },
        ),
      ),
    );
  }
}
