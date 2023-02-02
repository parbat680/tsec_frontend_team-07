import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
    return Container();
    // return FutureBuilder(
    //     future: fetch.FetchForQuery(query),
    //     builder: (BuildContext context, AsyncSnapshot<List<venue>> snapshot) {
    //       if (snapshot.connectionState == ConnectionState.waiting) {
    //         return getshimmer();
    //       } else if (snapshot.data == null || snapshot.data!.isEmpty) {
    //         return Center(
    //           child: Column(
    //             mainAxisSize: MainAxisSize.min,
    //             children: [
    //               const SizedBox(
    //                 height: 50,
    //               ),
    //               Flexible(
    //                 child: Image.asset(
    //                   'assets/images/notfoundimage.png',
    //                   height: 200,
    //                 ),
    //               ),
    //               const SizedBox(
    //                 height: 20,
    //               ),
    //               Text("No Turfs Found!",
    //                   style: GoogleFonts.poppins(fontSize: 20)),
    //             ],
    //           ),
    //         );
    //       } else if (snapshot.hasData) {
    //         return CustomScrollView(slivers: [
    //           SliverList(
    //             delegate: SliverChildListDelegate(List.generate(
    //                     snapshot.data!.length,
    //                     (index) => TurfHomeCard(v: snapshot.data![index]))
    //                 .toList()),
    //           ),
    //         ]);
    //       }
    //       return Text(snapshot.error.toString());
    //     });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Column(
      children: [
        Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Align(
              alignment: Alignment.topLeft,
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Trending Searches    ",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                    ),
                    const WidgetSpan(
                      child: Icon(Icons.trending_up_sharp, size: 24),
                    ),
                  ],
                ),
              ),
            )),
        // ListView.builder(
        //   shrinkWrap: true,
        //   physics: const NeverScrollableScrollPhysics(),
        //   itemCount: searchTerms.length,
        //   itemBuilder: ((context, index) {
        //     return Card(
        //       margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        //       child: ListTile(
        //         title: Text(searchTerms[index]),
        //         trailing: IconButton(
        //           onPressed: () {},
        //           icon: const Icon(
        //             Icons.clear,
        //             color: Colors.grey,
        //             size: 20,
        //           ),
        //         ),
        //       ),
        //     );
        //   }),
        // )
      ],
    );
  }
}
