import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tsec_app/models/apartment.dart';
import 'package:tsec_app/network/api/search_rooms.dart';
import 'package:tsec_app/views/widgets/item_card_main.dart';

class SearchRoomDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.clear)),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder(
        future: FetchSearch.get(query),
        builder: ((BuildContext c, AsyncSnapshot<List<Apartment>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: ((context, index) {
                  return ItemCardMain(
                    apartment: snapshot.data![index],
                  );
                }));
          }

          return Text(snapshot.data.toString());
        }));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Align(
                alignment: Alignment.topLeft,
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Trending Searches    ",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w400),
                      ),
                      const WidgetSpan(
                        child: Icon(Icons.trending_up_sharp, size: 24),
                      ),
                    ],
                  ),
                ),
              )),
        ),
      ],
    );
  }
}
