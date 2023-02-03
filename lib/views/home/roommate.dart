import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:tsec_app/models/apartment.dart';
import 'package:tsec_app/models/roommate.dart';
import 'package:tsec_app/network/api/roommate.dart';
import 'package:tsec_app/views/widgets/roommate_tile.dart';

import '../widgets/item_card_main.dart';

class RoomMateScreen extends StatelessWidget {
  const RoomMateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: FetchRooms.get(),
        builder: ((BuildContext c, AsyncSnapshot<List<RoomMate>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: ((context, index) {
                  return RoomMateTile(
                    roomMate: snapshot.data![index],
                  );
                }));
          }

          return Text(snapshot.data.toString());
        }));
  }
}
